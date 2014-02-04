
#==============================================================================================

rm(list=ls())  ;  options(width=200)
machine = (Sys.info()["nodename"])

options(echo=TRUE) # if you want see commands in output file
args <- commandArgs(trailingOnly = TRUE)
print(args)

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
#====================================================================
# Source functions & Load data
#====================================================================
setwd(pth.dropbox.code)
source("./10_load_data_various.R") ; f_load.calendar()

par.category = "beer" ; par.periodicity = "445"	
setwd(pth.dropbox.data)

# get the input data for the regressions
if (FALSE == TRUE) {
	
	fil = paste("./regression datasets/", par.category, ".regression.data.", par.periodicity, ".rds", sep= "")
	sp = readRDS(fil)
	sp = sp[UPC=="00-01-18200-53030"]
	
	sp[,fc.item:=factor(fc.item)]
	fil = paste("./regression datasets/", par.category, ".test.regression.data.", par.periodicity, ".rds", sep= "")
	saveRDS(sp,fil)
}

par.periodicity = "445"	
fil = paste("./regression datasets/", par.category, ".test.regression.data.", par.periodicity, ".rds", sep= "")
#TESTING fil = paste("./regression datasets/", par.category, ".regression.data.", par.periodicity, ".TEST.rds", sep= "")
spm = readRDS(fil)

par.periodicity = "weekly"	
fil = paste("./regression datasets/", par.category, ".test.regression.data.", par.periodicity, ".rds", sep= "")
#TESTING fil = paste("./regression datasets/", par.category, ".regression.data.", par.periodicity, ".TEST.rds", sep= "")
spw = readRDS(fil)
#sp$chain

library(data.table)
store.stats = spw[!is.na(IRI_KEY), 
	j =	list(revenue = sum(DOLLARS, na.rm=TRUE),
		deal_intensity = mean(PR,na.rm=TRUE), 
		feat_intensity = mean(FEAT_ANY, na.rm=TRUE),
		disp_intensity = mean(DISP_ANY, na.rm=TRUE),
		deal_plus_feat_intensity = mean((PR * FEAT_ANY), na.rm=TRUE),
		deal_plus_disp_intensity = mean((PR * DISP_ANY), na.rm=TRUE),
		deal_plus_feat_disp_intensity = mean((PR * FEAT_ANY * DISP_ANY), na.rm=TRUE),
		price_consistency = sd(PRICE,na.rm=TRUE)/mean(PRICE,na.rm=TRUE)),
	by = list(UPC,chain,IRI_KEY) ]

		
chain.stats = spw[!is.na(IRI_KEY), 
	j =	list(revenue = sum(DOLLARS, na.rm=TRUE), 
		stores = length(unique(IRI_KEY)),
		deal_intensity = mean(PR,na.rm=TRUE), 
		feat_intensity = mean(FEAT_ANY, na.rm=TRUE),
		disp_intensity = mean(DISP_ANY, na.rm=TRUE),
		deal_plus_feat_intensity = mean((PR * FEAT_ANY), na.rm=TRUE),
		deal_plus_disp_intensity = mean((PR * DISP_ANY), na.rm=TRUE),
		deal_plus_feat_disp_intensity = mean((PR * FEAT_ANY * DISP_ANY), na.rm=TRUE),
		price_consistency = sd(PRICE,na.rm=TRUE)/mean(PRICE,na.rm=TRUE)),
	by=chain]
	
chain.stats[,market.share:=100*revenue/sum(revenue)]
library(ggplot2)

ggplot(data=chain.stats, aes(x= reorder(factor(paste("Chain",chain)),-market.share), y = market.share)) + 
	geom_bar(fill="blue") + coord_flip() +
	ggtitle("Market Share by chain for item 00-01-18200-53030") + labs(y="Market Share (%)", x = "Chain") +
	theme_bw()

#=====================================================================================================================


f_gg.ts.plot(dat.in) {
	#p = ggplot(dat.in, aes(x = 
	}
# weekly
ggplot(spw[!is.na(chain) & is.na(IRI_KEY)],aes(x=WEEK,y=UNITS))+ geom_line(aes(colour=chain)) + facet_wrap(~chain, scales = "free_y",ncol=1)
ggplot(spw[!is.na(chain) & is.na(IRI_KEY)],aes(x=WEEK,y=UNITS))+ geom_line(aes(colour=chain)) #+ facet_wrap(~chain, ncol=1)
# monthly/445
ggplot(spm[!is.na(chain) & is.na(IRI_KEY)],aes(x=period_id,y=UNITS))+ geom_line(aes(colour=chain)) + facet_wrap(~chain, ncol=1, scales = "free_y")




library("forecast") ; library("xts")
ss = spm[fc.item == "00-01-18200-53030"]

y = zoo(ss$UNITS, calendar.445$end_date[1:72], frequency=12)

to.day <- function(i) with(DF, zoo(X1[i], seq(start[i], end[i], "day")))
z.day <- do.call(c, lapply(1:nrow(DF), to.day))

# aggregate by month
aggregate(z.day, as.yearmon, mean)



k <- 48 # minimum data length for fitting a model
n <- length(y)
mae1 <- mae2 <- mae3 <- matrix(NA,n-k,12)
st <- tsp(y)[1]+(k-2)/12
#st = 48
for(i in 1:(n-k))
{
  xshort <- window(y, end=st + i/12)
  xnext <- window(y, start=st + (i+1)/12, end=st + (i+12)/12)
  fit1 <- tslm(xshort ~ trend + season, lambda=0)
  fcast1 <- forecast(fit1, h=12)
  fit2 <- Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12), 
      include.drift=TRUE, lambda=0, method="ML")
  fcast2 <- forecast(fit2, h=12)
  fit3 <- ets(xshort,model="MMM",damped=TRUE)
  fcast3 <- forecast(fit3, h=12)
  mae1[i,1:length(xnext)] <- abs(fcast1[['mean']]-xnext)
  mae2[i,1:length(xnext)] <- abs(fcast2[['mean']]-xnext)
  mae3[i,1:length(xnext)] <- abs(fcast3[['mean']]-xnext)
}


t = 48
fit = ets(y[1:t], model = "ZZZ")

# plot the in-sample fit
plot((fit$x-fit$fitted), ylim = c(-2000,17000), type = "h")
lines(fit$fitted, col = 4, type = "o") ; lines(fit$x, col = 2, type = "o")

