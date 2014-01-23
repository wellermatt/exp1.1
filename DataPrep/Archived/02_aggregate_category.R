library(data.table)

source("../scripts/memory_usage.R")
args <- commandArgs(trailingOnly = TRUE)
print (args)

## define the parameters for this procedure
par.category = "beer"  #args[1]  #
par.summarise.data = TRUE

pth.trans = paste("/storage/users/wellerm/data/02_tf/sales/", par.category, "/", sep = "")
pth.agg = paste("/storage/users/wellerm/data/03_agg/", par.category, "/", sep = "")

## load the transformed data for the category (all years) and convert to a data table and output stats

fil =  paste(pth.trans, par.category, ".tf.all.rds", sep="") ; print(fil)
da = readRDS(fil)
da$IRI_KEY = as.integer(levels(da$IRI_KEY))[da$IRI_KEY]    # this is to correct an issue with length(unique(IRI_KEY)) only in the last procedure!
nrow(da)
names(da)
tables()
lsos()

f_consecutive.missing.values = function(weeks.avail) {
	y = rep(0, max(weeks.avail) - min(weeks.avail)+1) 
	y[weeks.avail] = 1
	runs = rle(y)
	as.integer(max(runs$lengths[runs$values==0]))
}

if (par.summarise.data == TRUE) {
	###### WEEKLY ITEM STATS
	dat.upc.week = da[,j=list(revenue = sum(DOLLARS), 
				units_sold = sum(UNITS), 
				store_count = length(IRI_KEY)),
				by=list(UPC,WEEK)]
	dat.upc.week = dat.upc.week[with(dat.upc.week, order(-revenue)), ]
	saveRDS(dat.upc.week, file = paste(pth.agg, par.category, ".dat.upc.week.rds", sep=""))
	print("dat.upc.week") ; nrow(dat.upc.week)
	dat.upc.week = NULL ; gc()

	###### WEEKLY STORE STATS (all items
	dat.store.week = da[,j=list(revenue = sum(DOLLARS), 
				units_sold = sum(UNITS), 
				item_count = length(UPC)),
				by=list(IRI_KEY,WEEK)]
	dat.store.week = dat.store.week[with(dat.store.week, order(-revenue)), ]
	saveRDS(dat.store.week, file = paste(pth.agg, par.category, ".dat.store.week.rds", sep="")) ; 
	print("dat.store.week")  ; nrow(dat.store.week)
	dat.store.week = NULL ; gc()
	
	## WEEKLY CATEGORY STATS (all stores, all items)
	dat.category.week = da[,j=list(
				revenue = sum(DOLLARS), 
				units_sold = sum(UNITS), 
				n = length(DOLLARS), 
				item_count = length(unique(UPC)), 
				store_count = length(unique(IRI_KEY))),
				by = WEEK]
	dat.category.week = dat.category.week[with(dat.category.week, order(WEEK)),] 
	saveRDS(dat.category.week, file = paste(pth.agg, par.category, ".dat.category.week.rds", sep=""))  
	dat.category.week = NULL; gc()
	print("dat.category.week") ; nrow(dat.category.week)

	## CALCULTAE SUMMARIES OVER THE WHOLE HORIZON
	# sku-level stats
	dat.upc.store.horizon = da[,j=list(revenue = sum(DOLLARS), 
				units_sold = sum(UNITS), 
				start_week = min(WEEK),
				end_week = max(WEEK),
				num_weeks = length(WEEK),
				max_consecutive_missing = f_consecutive.missing.values(WEEK)),
				by=list(IRI_KEY,UPC)]
	dat.upc.store.horizon  = dat.upc.store.horizon [with(dat.upc.store.horizon , order(-revenue)), ]
	saveRDS(dat.upc.store.horizon , file = paste(pth.agg, par.category, ".dat.upc.store.horizon.rds", sep=""))  
	print("dat.upc.store.horizon") ; nrow(dat.upc.store.horizon)
	dat.upc.store.horizon  = NULL ; gc()

	# store-level stats
	dat.store.horizon = da[,j=list( 
				revenue = sum(DOLLARS),  
				units_sold = sum(UNITS), 
				n = length(DOLLARS),
				item_count = length(unique(UPC)),
				weeks_sold = length(unique(WEEK)),
				start_week = min(WEEK),
				end_week = max(WEEK),
				max_consecutive_missing = f_consecutive.missing.values(WEEK)),
				by = IRI_KEY]
	dat.store.horizon = dat.store.horizon[with(dat.store.horizon, order(-revenue)),]
	saveRDS(dat.store.horizon, file = paste(pth.agg, par.category, ".dat.store.horizon.rds", sep=""))   
	print("dat.store.horizon") ; nrow(dat.store.horizon)  
	dat.store.horizon = NULL ; gc()

	# item level stats	
	dat.upc.horizon = da[,j=list(
				revenue = sum(DOLLARS), 
				units_sold = sum(UNITS), 
				n = length(DOLLARS), 
				store_count = length(unique(IRI_KEY)), 
				weeks_sold = length(unique(WEEK)),
				start_week = min(WEEK),
				end_week = max(WEEK),
				max_consecutive_missing = f_consecutive.missing.values(WEEK)),
				by = UPC]
	dat.upc.horizon = dat.upc.horizon[with(dat.upc.horizon, order(-revenue)), ]
	saveRDS(dat.upc.horizon, file = paste(pth.agg, par.category,".dat.upc.horizon.rds", sep=""))
	top.10.upc = dat.upc.horizon[1:10,1]  
}
lsos()
da = NULL ; dat.upc.horizon = NULL ; gc()


print ("===== SCRIPT COMPLETED =====")