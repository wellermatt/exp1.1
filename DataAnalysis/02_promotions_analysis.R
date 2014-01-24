setwd(pth.dropbox.data)


library("data.table") ; library("ggplot2") ; library("reshape2") ; library("scales")
rm(list=ls())
options(width=200)
machine = (Sys.info()["nodename"])

pth.dropbox = "/home/users/wellerm/"
if (machine == "M11") pth.dropbox = "C:/Users/Matt/Dropbox/"
if (machine == "DESKTOP") pth.dropbox = "D:/Dropbox/Dropbox/"
if (machine == "IDEA-PC") pth.dropbox = "C:/Users/welle_000/Dropbox/"

pth.dropbox.data = paste(pth.dropbox, "HEC/IRI_DATA/", sep = "")
pth.dropbox.code = paste(pth.dropbox, "HEC/Code/exp1.1/", sep = "")
if (pth.dropbox == "/home/users/wellerm/") {
	pth.dropbox.data = paste(pth.dropbox, "IRI_DATA/", sep = "")
	pth.dropbox.code = paste(pth.dropbox, "projects/exp1.1/", sep = "")
}

#============== load data ==================
setwd(pth.dropbox.data)
categories = c("beer", "carbbev", "milk")	

f_load.fc.items = function(category) data.table(category = category, readRDS(paste("./iri category subsets/reformatted/", category, ".subset.fc.items.rds", sep = "")))
fc.items = rbindlist(lapply(categories, f_load.fc.items))

f_load.subset = function(category) data.table(category = category, readRDS(paste("./iri category subsets/unformatted/", category, "/", category, ".subset.rds", sep = "")))
subsets = rbindlist(lapply(categories, f_load.subset))
setkeyv(subsets,c("category","IRI_KEY","UPC"))
fci.1 = fc.items[lvl==1]
setkeyv(fci.1, c("category","IRI_KEY", "UPC"))
subsets = merge(subsets,fci.1)
subsets

round(with(subsets, 100*prop.table(table(F,D, PR))), digits=2)
format(with(subsets, prop.table(table(F,D, PR))), digits=2)


round(with(subsets, 100*prop.table(table(F,D,category))), digits=2)

ggplot(data=subsets, aes(fill=factor(D), x = F)) + stat_bin() + geom_bar(position="stack") +
facet_wrap(~category)
