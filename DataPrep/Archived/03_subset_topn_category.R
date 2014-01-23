library(data.table)
options(width=150)

# the following parameters should be passed into the script as arguments 
par.top.n.items = 10
par.proportion.of.weeks = 0.9
par.max.consec.missing.periods = 2
par.category = "beer"

pth.upc = "/home/users/wellerm/IRI_DATA/upc/"
pth.tf = "/storage/users/wellerm/data/tf/sales/"
pth.agg = "/storage/users/wellerm/data/agg/"
pth.subset = "/storage/users/wellerm/data/subset/"


f.upc = function(par.category)
{
    ## load the product catalogue information for the specified category
    fil = paste(pth.upc, "prod_", par.category, ".csv", sep = "") ; #print(fil)
    cat.dat <- read.csv(fil, 
                        header=TRUE, 
                        strip.white = TRUE)
    cat.field.names = names(cat.dat)
    cat.attributes = cat.field.names[15:length(cat.field.names)]
    cat.attributes
    cat.dat = cat.dat[,c(11,8,6, 1:5)]
    names(cat.dat) = c("VEND","UPC","UPC_NAME","CAT1","CAT2","SUPP1","SUPP2","BRAND")
    cat.dat$PRV = grepl("+PRV ", cat.dat$UPC_NAME)
    cat.dat = cat.dat[cat.dat$PRV==FALSE,]
    data.table(cat.dat)
}

f.upc.horizon = function(par.category) {
	# function to get the UPCs which are the top sellers in terms of revenue within the category
	# the function will read the aggregated revenue per UPC over the whole horizon and return the Top n items
    fil.prefix = paste(pth.agg, par.category, "/", par.category,sep="")
    dupc = data.frame(readRDS(paste(fil.prefix,".dat.upc.horizon.rds",sep="")))
    dupc$category = par.category
    dupc <- dupc[with(dupc, order(-revenue)), ]
    dupc = dupc[dupc$start_week==1 & dupc$end_week==313 & dupc$UPC %in% upc$UPC ,]
    head(dupc, top.n.items)
}

f.upc.store.horizon = function(par.category) {
	
	# function to identify the SKUS (item by store) that we will be interested in using
	# will take the top n items and identify where they have been sold for more than a specified
	# number of weeks
	fil.prefix = paste(pth.agg, par.category, "/", par.category,sep="")
    dush = data.table(readRDS(paste(fil.prefix,".dat.upc.store.horizon.rds",sep="")))
    dush$category = par.category
	dush$start_week = as.integer(dush$start_week)
   	dush$end_week = as.integer(dush$end_week)
	dush = dush[dush$UPC %in% upc.top.n$UPC,]
	print(nrow(dush))
	# calculate the minimum number of weeks to warrant inclusion for the data set
	min.weeks = as.integer(proportion.of.weeks * (max(dush$start.week) - min(dush$start.week)))
	dush = dush[dush$num_weeks >= min.weeks,]
	print(nrow(dush))
	dush <- dush[with(dush, order(-revenue)), ]
	dush
}

f.subset.category = function(par.category)
{
	# this is the function in use to subset the whole transformed category file, based on the SKUs in scope:
	# that is the UPCs in the top n sold for a sufficient number of periods
	fil.prefix = paste(pth.trans, par.category, "/", par.category,sep="")
	dat.all = data.table(readRDS(paste(fil.prefix,".tf.all.rds",sep="")),
				key = c("UPC", "IRI_KEY"))
	print(head(sku)) ; nrow(sku)
	print(paste(nrow(dat.all), "rows in dat.all"))
	# subset the data.table for the relevant items
	dat.all = dat.all[dat.all$UPC %in% upc.top.n$UPC,]
	print(paste(nrow(dat.all), "rows in dat.all"))
	# subset the data.table for SKUs in scope
	dat.all = dat.all[sku[,c(1,2),with=FALSE]]
	print(paste(nrow(dat.all), "rows in dat.all"))
	
	# save the filtered dataset
	fil = paste(pth.subset, par.category, "/", par.category, ".subset.rds",sep="")
	print(fil);print(nrow(dat.all))
	saveRDS(dat.all, file=fil)
	head(dat.all)
}

########### MAIN ############


upc = f.upc(category)

upc.top.n = f.upc.horizon(category)  # get the UPCs in scope
sku = data.table(f.upc.store.horizon(category))	# get the UPC/store combinations
setkeyv(sku,c("UPC","IRI_KEY"))
dat.subset = f.subset.category(category)
print(head(dat.subset,20))
upc = NULL; upc.top.n = NULL ; sku=NULL ; dat.subset=NULL; gc()


##### EOF ######






#f.subset.category.year = function(par.category, yr)
#{
	## for a single year we can subset to only include SKUS which are in scope based on the importance of
	## the item and the number of weeks of data available
	#
	## function has been replaced now by doing the filtering over the whole period
	#fil = paste(pth.tf, par.category,"/", par.category, ".tf.", yr, ".rds", sep="")
	#print(paste("procegvssing file: ", fil, sep=""))
	#dat.all = readRDS(file=fil)
	#dat.all$year = i
	#dat.all = dat.all[dat.all$UPC %in% upc.top.n$UPC,]
	#dat.all = merge(dat.all, sku[1:2])
	#fil = paste(pth.filter,par.category, "/", par.category, ".subset.rds",sep="")
	#print(fil);print(nrow(dat.all))
	#dat.all
#}