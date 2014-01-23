rm(list=ls())


	library(data.table)
    dt <- data.table(a = c(1:10),
                 b = c("a", "a", "b", "c", "c", "b", "a", "c", "c", "b"))
	my.list = lapply(unique(dt$b), function(select) { dt[b == select]})
    df.names = unique(dt$b)
	assign(df.names, my.list[])
	?assign
	testF = function(select) {
    	dum = subset(df, b == select)
    	dum                                # you need to return the data frame resulting from the subset back out of the function
    }
    
    my.list = lapply(unique(df$b), testF)
    names(my.list) = unique(df$b)          # set the names of the list elements to the subsets they represent (a,b,c)
    list2env(my.list,envir = .GlobalEnv)   # copy the data frames from the list to the Global Environment


my.list = lapply(unique(df$b), testF)
names(my.list) = unique(df$b)
list2env(my.list,envir = .GlobalEnv)


ls()
a=my.list[[1]]
b=my.list[[2]]
c=my.list[[3]]

my.list
?assign
?list2env
.GlobalEnv



f2 = function(dt)
{
	dt$sq= dt$x ^ 2
	dt
}
?rep
rm(list-ls())
dt = data.table(grp = rep(letters[1:2], each=5), 
				period = rep(1:5,2), 
				y1 = rnorm(10),
				y2 = rnorm(10))
my.fun = function(dt.sub) {
	y1.lag = c(NA, dt.sub$y1[1:(nrow(dt.sub)-1)])
	y2.lag = c(NA, dt.sub$y2[1:(nrow(dt.sub)-1)])
	y1y2 = dt.sub$y1 * dt.sub$y2
	list(y1.lag = y1.lag, y2.lag = y2.lag, y1y2 = y1y2) #
}
dt

dt = dt[,c(.SD, my.fun(.SD)),by=grp]
dt.out = dt[,as.list(.SDcols, my.fun(.SD)),by=grp]
dt.out = dt[,`:=`(my.fun(.SD)),by=grp]
dt.out
as.list(dt)
?split
library(plyr)
my.fun2 = function(dt.sub) {
	
	y1.lag = c(NA, dt.sub$y1[1:(nrow(dt.sub)-1)])
	y2.lag = c(NA, dt.sub$y2[1:(nrow(dt.sub)-1)])
	y1y2 = dt.sub$y1 * dt.sub$y2
	data.table(y1.lag = y1.lag, y2.lag = y2.lag, y1y2 = y1y2) #
}
ddply(dt, .(grp), my.fun2)



?ddply


library(data.table)
library(microbenchmark)
rm(list=ls())
dt = data.table(grp = rep(letters[1:20], each=50000), 
                period = rep(1:50000,20), 
                y1 = rnorm(1000000),
                y2 = rnorm(1000000))
my.fun = function(dt.sub) {
    y1.lag = c(NA, dt.sub$y1[1:(nrow(dt.sub)-1)])
    y2.lag = c(NA, dt.sub$y2[1:(nrow(dt.sub)-1)])
    y1y2 = dt.sub$y1 * dt.sub$y2
    list(y1.lag = y1.lag, y2.lag = y2.lag, y1y2 = y1y2) #
}
source("./scripts/memory_usage.R")
lsos()

gc()  # memory = 37.8mb
mem_change(dt[ , `:=`(y1.lag = c(NA, head(y1,-1) ),
              y2.lag = c(NA, head(y2,-1) ),
              y1y2 = y1*y2) ,by=grp])   ## memory change = 22.88
gc()  # memory = 66.5Mb
microbenchmark(dt[ , `:=`(y1.lag = c(NA, head(y1,-1) ),
              y2.lag = c(NA, head(y2,-1) ),
              y1y2 = y1*y2) ,by=grp])
lsos()
mem_change(cbind(dt, dt[, my.fun(.SD), by = grp][, grp := NULL]))  ## memory chainge 0.436
gc()  # memory = 66.5Mb
microbenchmark(cbind(dt, dt[, my.fun(.SD), by = grp][, grp := NULL]))


