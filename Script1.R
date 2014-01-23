setwd("C:/Users/matt/Dropbox/WORK/LCF/FSS")

csv = read.csv("time_series.csv",header=TRUE)
library(reshape); library(ggplot2)
mlt1 = melt(csv,id.vars=c("Period"))
mlt1$variable
mlt2 = cbind(colsplit.factor(mlt1$variable,"_",c("Series","Variable")),mlt1[,c(1,3)])

head(mlt2)

ggplot(mlt2,aes(x=Period,y=value,colour=Variable))+geom_line() + geom_point() + facet_wrap(~Series)