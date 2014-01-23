library(zoo)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

library(data.table)
f_reference.prices = function(pt)
{
  # set parameters for algorithm
  l = 5
  C = 1/3
  a = 0.5
  
  # unsure why we need this
  if (sum(is.na(pt)) > 0) {
    z = zoo(pt)
  }  
  
  # create df to hold the data during the run
  dt = data.table(pt, pm = 0, pr = 0, ft = 0)
  
  TT = length(pt)
  # first pass will calculate the mode value for each period in the price data series
  pass1 = ldply((1+l):(TT - l), 
                function(t) {
                  x = pt[(t - l):(t + l)]
                  if (sum(x > 0) >= 2 * a * l) { 
                    pm = Mode(x)
                    ft = (sum(x > 0))/(2 * l + 1)
                    data.frame(pm, ft)
                  } else  {
                    pm = 0
                    ft = 0
                    data.frame(pm, ft) }#function(x1)x1^2)
                })
  dt$pm[(1+l):(TT - l)] = pass1$pm
  dt$ft[(1+l):(TT - l)] = pass1$ft
  #pass1$pt = pt[(1+l):(TT - l)]
  dt$pr[l + 1] = if (pass1[1,1] == 0) pass1[1,4] else pass1[1,1]
  for (t in (l + 2):(TT - l))
  {        
    if (dt$pm[t] != 0 & dt$ft[t] > C & dt$pt[t] == dt$pm[t]) dt$pr[t] = dt$pt[t] else dt$pr[t] = dt$pr[t-1]    
  }
  dt# RR - set of periods with regular price change
  # 
  for (i in 1:l)
  {
    R1 = which(diff(dt$pr)!=0) + 1
    R2 = which(dt$pr != 0) + 1
    R3 = which(dt$pr != 0)
    R.set = intersect(intersect(R1, R2), R3)
    
    C1 = which(dt$pr - dt$pt==0)
    C2 = R3
    C3 = which(dt$pt != 0)
    C.set = intersect(intersect(C1, C2), C3)
    
    P1 = which(dt$pr - dt$pt == 0) + 1
    P2 = R2
    P3 = which(dt$pt != 0) + 1
    P.set = intersect(intersect(P1, P2), P3)
    
    RC.set = intersect(R.set, C.set)
    if (length(RC.set) > 0) dt$pr[RC.set - 1] = dt$pt[RC.set]
    
    RP.set = intersect(R.set, P.set)
    if (length(RP.set) > 0) dt$pr[RP.set] = dt$pt[RP.set - 1]
  }
  dt = dt[-c(1:l,(TT-l+1):TT),]
  dt$price.discount = dt$pt - dt$pr
	dt$ft=NULL ; dt$pm = NULL
	dt$period = as.integer(rownames(dt))
  dt
}


#testing
library(reshape2)
sp1= sp[UPC =="00-01-12000-00053" & chain =="108" & !is.na(IRI_KEY)]
prices = data.table(dcast(sp1, WEEK~IRI_KEY, value.var = "PRICE", fun.aggregate = sum, na.rm=TRUE))

prices
prices2 = rbindlist(lapply(2:9,function(i)data.table(IRI_KEY = names(prices)[i], f_reference.prices(prices[[i]]))))

#prices2 = f_reference.prices(prices[[2]])
#prices2$period= as.integer(rownames(prices2))
prices2.melt = melt(prices2, id.vars = c("IRI_KEY","period"))
library(ggplot2)
ggplot(data=prices2.melt, aes(x=period,y=value)) + 
	geom_line(aes(colour=variable)) +
	facet_wrap(~IRI_KEY)


