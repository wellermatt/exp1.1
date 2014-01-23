library(data.table) ; library(ggplot2)  ; library(reshape)

machine = (Sys.info()["nodename"])
if (machine == "M11") pth.dropbox.data = "C:/Users/Matt/Dropbox/HEC/IRI_DATA/"
if (machine == "DESKTOP") pth.dropbox.data = "D:/Dropbox/Dropbox/HEC/IRI_DATA/"

setwd(pth.dropbox.data)
stores = f_load.stores.raw()

par.category = "beer"
f_wd.subsets.unformatted = function() setwd(paste(pth.dropbox.data,"iri category subsets/unformatted/", par.category,sep=""))

f_wd.subsets.unformatted()

# item summary
skul.h = data.table(readRDS(paste(par.category,".subset.upc.store.horizon.rds", sep = "")))
sku.h = data.table(readRDS(paste(par.category,".subset.upc.horizon.rds", sep = "")))
names(sku.h)
print(sku.h)
ggplot(skul.h, aes(x=max_consecutive_missing)) + geom_histogram() + facet_wrap(~UPC) + ggtitle("Consecutive missing weeks: store count by SKU")

# item location - subsetting rules
stores
skul.h = merge(skul.h, stores[,c(1:3), with =FALSE], by = "IRI_KEY")
sku.chain = skul.h[num_weeks>=300 & max_consecutive_missing <= 2, list(store.count = length(unique(IRI_KEY))) , by = c("UPC","chain")]
sku.chain = sku.chain[store.count>3, c(1,2), with = FALSE]
skul.h = merge(skul.h[num_weeks>=300 & max_consecutive_missing <= 2], sku.chain, by = c("UPC","chain"))
skul.h[num_weeks>=300 & max_consecutive_missing <= 2, list(store.count = length(unique(IRI_KEY))) , by = c("UPC","chain")]
skul.h[,list(store.count = length(unique(IRI_KEY)), chain.count = length(unique(chain))), by = c("UPC")]
sku.chain.store.count = data.table(cast(skul.h, chain ~ UPC))


head(skul.h)
names(skul.h)
hist(sush$num_weeks)


ggplot(skul.h, aes(x=num_weeks)) + geom_histogram() + facet_wrap(~UPC) + ggtitle("Number of weeks: store count by SKU")

