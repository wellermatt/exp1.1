library(plyr) ; library(reshape); library(ggplot2)
rm(list = ls())

par.category = "carbbev"
opt.intra.chain.correlations = TRUE
opt.cross.chain.correlations = TRUE

options(width = 250)
machine = (Sys.info()["nodename"])
if (machine == "M11") pth.dropbox = "C:/Users/Matt/Dropbox/"
if (machine == "DESKTOP") pth.dropbox = "D:/Dropbox/Dropbox/"

pth.dropbox.data = paste(pth.dropbox, "HEC/IRI_DATA/", sep = "")
pth.dropbox.code = paste(pth.dropbox, "HEC/Code/exp1.1/", sep = "")

setwd(pth.dropbox.code)		; source("./ModelFitting/LoadData.R")   # loads the calendars, the category data, the fc.items, the stores file
setwd(pth.dropbox.code)		; source("./DataAnalysis/04_correlation_functions.R")

dat.cat = dat.cat[!is.infinite(PRICE)]  ######### this needs to be implemented in the data cleansing routine
variables.to.test = c("PRICE", "PR", sort(grep("FEAT_|DISP_", names(dat.cat), value = TRUE)))
#=========================================================================================
#  correlations between stores per item, per chain - all promo & price variables
#=========================================================================================

# the correlation analysis for a category needs to be run at levels 1 and levels 2
# level 1 will look at the correlations within a chain for each variable
if (opt.intra.chain.correlations == TRUE) {
	sku.chains = unique(fc.items[lvl == 2,list(UPC,chain)])
	initial.run = TRUE

	# run correlation analysis within chains for each SKU
	for (i in 1:nrow(sku.chains))
	{
		#upc = sku.chains[1, c(i), with = FALSE]
		#ch = sku.chains[2, eval(i), with = TRUE]
		print(sku.chains[i])
		dat.fi = merge(sku.chains[i], dat.cat[!is.na(IRI_KEY)], by = c("UPC","chain"))
		
		for (variable.name in variables.to.test) {
			if(sum(dat.fi[,eval(variable.name), with = FALSE], na.rm=TRUE) != 0) {
				cor.method = f_cor.choose.method(NULL, variable.name, 1)
				mx.in = f_cor.prepare.matrix(dat.fi, variable.name, 1)
				if (sum(colSums(mx.in,na.rm=T)>0)>1) {   # test to make sure we have more than one column with a non-zero value
					if (initial.run == TRUE) {
						cor.output = f_cor.run(mx.in, cor.method, variable.name, sku.chains[i])
						initial.run = FALSE
					} else {
						cor.output = rbind(cor.output, f_cor.run(mx.in, cor.method, variable.name, sku.chains[i]))
					}
				}
			}
		}
	}

	cor.output$UPC = factor(cor.output$UPC)
	cor.output = data.table(droplevels(cor.output))
	setwd(pth.dropbox.data)
	fil = paste("./iri analysis output/correlations/", par.category, "intra.chain.correlations.rds", sep="")
	saveRDS(cor.output, fil)
}
#=========================================================================================
#  correlations between chains per item - all promo & price variables
#=========================================================================================

if (opt.cross.chain.correlations == TRUE) {
	sku.chains = unique(fc.items[lvl == 3,list(UPC,chain)])
	upcs = unique(fc.items[lvl == 3,list(UPC)])

	initial.run = TRUE
	for (i in 1:nrow(upcs))
	{
		print(upcs[i])
		dat.fi = droplevels(merge(upcs, dat.cat[is.na(IRI_KEY) & !is.na(chain)], by = c("UPC")))
		for (variable.name in variables.to.test) {
			if(sum(dat.fi[,eval(variable.name), with = FALSE], na.rm=TRUE) != 0) {
				cor.method = f_cor.choose.method(NULL, variable.name, 2)
				mx.in = f_cor.prepare.matrix(dat.fi, variable.name, 2)
				if (sum(colSums(mx.in,na.rm=T)>0)>1) {   # test to make sure we have more than one column with a non-zero value
					if (initial.run == TRUE) {
						cor.output = f_cor.run(mx.in, cor.method, variable.name, upcs[i])
						initial.run = FALSE
					} else {
						cor.output = rbind(cor.output, f_cor.run(mx.in, cor.method, variable.name, upcs[i]))
					}
				}
			}
		}
	}
	cor.output$UPC = factor(cor.output$UPC)
	cor.output = data.table(droplevels(cor.output))
	setwd(pth.dropbox.data)
	fil = paste("./iri analysis output/correlations/", par.category, ".cross.chain.correlations.rds", sep="")
	saveRDS(cor.output, fil)
}