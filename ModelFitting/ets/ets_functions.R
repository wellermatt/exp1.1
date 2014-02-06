library("forecast") ; library("xts")
ssm = spm[fc.item == "00-01-18200-53030"]
ssw = spw[fc.item == "00-01-18200-53030"]



y = ts(ssm$UNITS,frequency = 12)

f_ets.fit = function(y, fit.years = 4)
{
	y.fit = window(y,start=1, end = fit.years + 0.99)
	mod.ets = ets(y.fit)
	mod.ets
}

f_ets.fit(y, 4)

n <- length(y)
k <- 48 # minimum data length for fitting a model
mae1 <- mae2 <- mae3 <- matrix(NA,n-k,12)
st <- tsp(y)[1]+(k-1)/12

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


