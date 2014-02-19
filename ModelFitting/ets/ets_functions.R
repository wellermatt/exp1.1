
# functions required:

# FIT: fit an ets model to 445/monthly/weekly data

f_ets.fit = function(y, fit.years = 4)
{
    
    y.fit = window(y,start=1, end = fit.years + 0.9999)
    mod.ets = ets(y.fit)
    mod.ets
}


# FORECAST


# ROLL


# SPLIT/AGGREGATE



# EVALUATE
fit







#==================== TESTING ====================

library("forecast") ; library("xts")
setwd(pth.dropbox.code)
source("./DataAdaptor/00_data_adaptor_test.R")


# get the necessary data for a specific item
spw = f_da.reg.cat.test(par.category="beer", par.periodicity="weekly")
spm = f_da.reg.cat.test(par.category="beer", par.periodicity="445")
items = spw[!is.na(IRI_KEY),as.character(unique(fc.item))]
items
ssm = spm[fc.item == "00-01-18200-53030"]
ssw = spw[fc.item == "00-01-18200-53030"]

y = ts(ssm$UNITS,frequency = 12)





seasonplot(y,colours=rainbow(6))
plot(stl(y,s.window="periodic"))
plot(decompose(y))

fit = f_ets.fit(y, 4)
plot(fit) ; 
fit.acc = accuracy(fit)
str(fit.acc)
class(fit.acc)
fit
fit$x



fc = forecast(object=fit,h=24,level=0.95)
plot(fc)

# breakdown to in-sample weekly amounts
# origin month to week


y
fit$x
y[1:100]



# need generic functions to handle time series of varying lengths now...

f_roll.fc.item = function(y, h) {

    # rules around number of series
    n <- length(y)
    k <- 48             # minimum data length for fitting a model
    mae1 <- matrix(NA, n-k, h)    ## <- mae2 <- mae3 
    
    
    st <- tsp(y)[1]+(k-1)/h

    
    for(i in 1:(n-k))
    {
        xhist <- window(y, end= st + (i-1)/h )
        xfuture <- window(y, start=st + i/h , end=st + (i+11)/h)
                
        #fit.tslm <-     tslm(xhist ~ trend + season, lambda=0)
        
        #fit.Arima <-    Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12), 
        #                      include.drift=TRUE, lambda=0, method="ML")
        
        #fit.auto.arima <- auto.arima(xhist)
        
        fit.ets <- ets(xhist, model="MMM", damped=TRUE)  # model="MMM",
        
        
        # do the forecasts
        #fcast1 <- forecast(fit.tslm, h=12)
        #fcast2 <- forecast(fit.auto.arima, h=12)        
        fcast3 <- forecast(fit.ets, h=12)
        
        # record the data
        #mae1[i,1:length(xfuture)] <- abs(fcast1[['mean']]-xfuture)
        #mae2[i,1:length(xfuture)] <- abs(fcast2[['mean']]-xfuture)
        mae3[i,1:length(xfuture)] <- abs(fcast3[['mean']]-xfuture)
    }
    
    mae3
    
}


f_roll.fc.item(y,12)


# plot the in-sample fit
plot((fit$x-fit$fitted), ylim = c(-2000,17000), type = "h")
lines(fit$fitted, col = 4, type = "o") ; lines(fit$x, col = 2, type = "o")
