
library(plyr) ; library(reshape); library(ggplot2) ; library(data.table)
rm(list = ls())



options(width = 250)
options(scipen=100)

machine = (Sys.info()["nodename"])
if (machine == "M11") pth.dropbox = "C:/Users/Matt/Dropbox/"
if (machine == "DESKTOP") pth.dropbox = "D:/Dropbox/Dropbox/"

pth.dropbox.data = paste(pth.dropbox, "HEC/IRI_DATA/", sep = "")
pth.dropbox.code = paste(pth.dropbox, "HEC/Code/exp1.1/", sep = "")


f_cor.results.load = function(agg.level = "intra.chain") {
	
	setwd(pth.dropbox.data)
	if (agg.level == "intra.chain") {
		fil = paste("./iri analysis output/correlations/", par.category, ".intra.chain.correlations.rds", sep="")
	} else {
		fil = paste("./iri analysis output/correlations/", par.category, ".cross.chain.correlations.rds", sep="")
	}
	readRDS(fil)
}

cor.output[,mean(cor.stat),by =c("chain","variable.name")]
cast(cor.output, chain ~ variable.name, mean,value="cor.stat")

ggplot(data=cor.output, aes(x=variable.name, y = cor.stat)) + geom_boxplot() + coord_flip()
ggplot(data=cor.output[variable.name %in% c("PRICE","PR")], aes(x=reorder(chain,cor.stat, FUN=median), y = cor.stat)) +
	geom_boxplot() + facet_wrap( ~ variable.name) + 
	coord_flip() + xlab("Chain") + ylab("Correlation") + ggtitle("Correlation between stores of a Chain (Price variables)\n") + theme_bw()
	
ggplot(data=cor.output[variable.name %in% grep("FEAT_",variables.to.test, value = TRUE) ], aes(x=reorder(chain,cor.stat, FUN=median), y = cor.stat)) +
	geom_boxplot() + facet_wrap( ~ variable.name, nrow=1) + 
	coord_flip() + xlab("Chain") + ylab("Correlation") + ggtitle("Correlation between stores of a Chain (Feature variables)\n") + theme_bw()
	
ggplot(data=cor.output[variable.name %in% grep("DISP_",variables.to.test, value = TRUE) ], aes(x=reorder(chain,cor.stat, FUN=median), y = cor.stat)) +
	geom_boxplot() + facet_wrap( ~ variable.name, nrow=1) + 
	coord_flip() + xlab("Chain") + ylab("Correlation") + ggtitle("Correlation between stores of a Chain (Display variables)\n") + theme_bw()
	
cor.output$chain	
cor.output[variable.name %in% grep("FEAT_",variables.to.test, value = TRUE) ]




#================================================================================================
#  CROSS CHAIN CORRELATIONS - which chains are correlated with one another
#================================================================================================

# need to use this to identify which chains are highly correlated
par.category = "carbbev"
cor.dat = f_cor.results.load(agg.level = "cross.chain")
cor.dat[,cor.pair:=paste(pmin(as.integer(fc.item1),as.integer(fc.item2)), pmax(as.integer(fc.item1),as.integer(fc.item2)),sep="+")]
ggplot(cor.dat,aes(variable.name, cor.stat)) + geom_boxplot() + coord_flip()

names(cor.dat)
cor.dat[cor.stat>0.5][order(-cor.stat)]

cor.means = cor.dat[,list(cor.stat = mean(cor.stat)), by=c("cor.pair")] ; setkey(cor.means, cor.pair)
cor.variables = data.table(cast(cor.dat, cor.pair ~ variable.name, mean, fill = NA, value = "cor.stat"), key="cor.pair") 
cor.summary = merge(cor.means, cor.variables)[order(-cor.stat)] 
cor.summary = cbind(cor.summary[,1,with=FALSE],round(cor.summary[,-1,with=FALSE],4) )
cor.summary



#cor.dat[,list(cor.stat = mean(cor.stat)), by=c("cor.pair","variable.name")][order(-cor.stat)]



cor.dat.temp = cor.dat
cor.dat.temp$fc.item1a = cor.dat.temp$fc.item1
cor.dat.temp$fc.item1 = cor.dat.temp$fc.item2
cor.dat.temp$fc.item2 = cor.dat.temp$fc.item1a
cor.dat.temp$fc.item1a = NULL
cor.dat = rbindlist(list(cor.dat, cor.dat.temp))
cor.dat.temp = NULL



print(cast(cor.dat, fc.item1 + fc.item2 ~ variable.name, mean, value = "cor.stat"), digits = 4)
