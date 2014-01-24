# this procedure needs considerable overhaul to make it quicker and allow more flexible subsetting
# should accept parameters for the number of weeks required or start/end week
# needs to pick a subset of UPCs, subset of chains

rm(list=ls()) ; gc()

f.upc = function(par.category)
{
	## load the product catalogue information for the specified category
	fil = paste(pth.upc, "prod_", par.category, ".csv", sep = "") ;  print(fil)
	upc <- read.csv(fil, header=TRUE, strip.white = TRUE)
	upc.attributes = names(upc)[15:length(names(upc))]        # get the custom attributes for the category
	print(upc.attributes)

    upc = upc[,c(11,8,6, 1:5)]
    names(upc) = c("VEND","UPC","UPC_NAME","CAT1","CAT2","SUPP1","SUPP2","BRAND")
    upc$PRV = grepl("+PRV ", upc$UPC_NAME)
    upc = upc[upc$PRV==FALSE,]
    data.table(droplevels(upc))
}

f.upc.top10.horizon = function(par.category, upc) {
	# function to get the UPCs which are the top sellers in terms of revenue within the category
	# the function will read the aggregated revenue per UPC over the whole horizon and return the Top n items
	fil.prefix = paste(pth.agg, par.category, "/", par.category,sep="")
	dupc = readRDS(paste(fil.prefix,".dat.upc.horizon.rds",sep=""))

	#dupc$UPC = factor(dupc$UPC)
	print(paste("Rows in dupc:",nrow(dupc)))
    	dupc <- dupc[with(dupc, order(-revenue)), ]
	print("TOP 10 ITEMS IN CATEGORY BASED ON SALES")
	print(head(dupc,10))

	# filter the UPC listing to only include those with a specified start/end/number of weeks and which are in the master file
	dupc = dupc[start_week==1 & end_week==313 & UPC %in% as.character(upc$UPC) ,]  #
	dupc = droplevels(dupc)
	print("TOP 10 ITEMS IN CATEGORY BASED ON SALES (only selling from weeks 1-313)")
	print(head(dupc,10))

    	head(dupc, par.top.n.items)
}


f.upc.store.horizon = function(par.category, upc.top.n) {
	
	# function to identify the SKUS (item by store) that we will be interested in using
	# will take the top n items and identify where they have been sold for more than a specified
	# number of weeks
	fil.prefix = paste(pth.agg, par.category, "/", par.category,sep="")
	fil = paste(fil.prefix,".dat.upc.store.horizon.rds",sep="")
    	dush = data.table(readRDS(fil))
    	dush$category = par.category
	dush$start_week = as.integer(dush$start_week)
   	dush$end_week = as.integer(dush$end_week)
	dush = dush[UPC %in% upc.top.n$UPC,]
	print(nrow(dush))

	# calculate the minimum number of weeks to warrant inclusion for the data set
	if (par.min.weeks > 0) {
		min.weeks = par.min.weeks
	} else {
		min.weeks = as.integer(par.proportion.of.weeks * (1+ max(dush$start_week, na.rm = TRUE) - min(dush$start_week, na.rm = TRUE)))
	}
	
	# subset to the minimum number of weeks
	dush = dush[num_weeks >= min.weeks,]
	print(nrow(dush))

	# subset to the maximum number of CONSECUTIVE MISSING weeks
	dush = dush[max_consecutive_missing <= par.max.consec.missing.periods ,]

	dush <- dush[with(dush, order(-revenue)), ]
	dush
}

f.subset.category = function(par.category, sku)
{
	# this is the function in use to subset the whole transformed category file, based on the SKUs in scope:
	# that is the UPCs in the top n sold for a sufficient number of periods
	fil.prefix = paste(pth.tf, par.category, "/", par.category,sep="")
	fil = paste(fil.prefix,".tf.all.rds",sep="")
	dat.all = readRDS(fil)
	setkeyv(dat.all, c("UPC", "IRI_KEY", "WEEK"))
	print(head(sku)) ; nrow(sku)
	print(paste(nrow(dat.all), "rows in dat.all"))
	
	# subset the data.table for the relevant items  - removed thi step because SKU handles it
	#dat.all = dat.all[UPC %in% upc.top.n$UPC,]
	#print(paste(nrow(dat.all), "rows in dat.all"))
	
	# subset the data.table for SKUs in scope
	dat.all = dat.all[sku[,c(1,2),with=FALSE]]
	print(paste(nrow(dat.all), "rows in dat.out"))
	
	# save the filtered dataset
	fil = paste(pth.subset, par.category, "/", par.category, ".subset.rds",sep="")
	print(fil);print(nrow(dat.all))
	print(head(dat.all,20))
	saveRDS(dat.all, file=fil)
	nrow(dat.all)
	
}

f_main = function(par.category) {

	upc = f.upc(par.category)
	upc.top.n = f.upc.top10.horizon(par.category, upc)  # get the UPCs in scope

	sku = data.table(f.upc.store.horizon(par.category, upc.top.n))	# get the UPC/store combinations
	setkeyv(sku, c("UPC","IRI_KEY"))
	gc()

	num.recs = f.subset.category(par.category, sku)	
	upc = NULL; upc.top.n = NULL ; sku=NULL ; dat.subset=NULL; gc()
	num.recs
}

########### MAIN ############

library(data.table)
options(width=150) #; options(echo=FALSE)

# the following parameters should be passed into the script as arguments 
par.top.n.items = 10
par.proportion.of.weeks = 0.9
par.min.weeks = 300
#par.min.weeks 
par.max.consec.missing.periods = 2

pth.upc = "/home/users/wellerm/IRI_DATA/iri reference data/upc/"
pth.tf = "/storage/users/wellerm/data/02_tf/sales/"
pth.agg = "/storage/users/wellerm/data/03_agg/"
pth.subset = "/storage/users/wellerm/data/04_subset/"


categories = c("beer", "carbbev", "milk")
lapply(categories, f_main)

##### EOF ######
