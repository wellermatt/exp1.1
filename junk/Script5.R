rm(list=ls())
library(data.table) ; library(iterators)  ;   library(doParallel)  ;  library(microbenchmark)
num.series = 4000
num.periods = 2000
dt.all = data.table(
    grp     = factor(rep(1:num.series,each=num.periods)), 
    pd      = rep(1:num.periods, num.series), 
    y       = rnorm(num.series * num.periods),
    x1      = rnorm(num.series * num.periods),
    x2      = rnorm(num.series * num.periods)
)
dt.all[,y_lag := c(NA, head(y, -1)), by = c("grp")]

f_lm = function(dt.sub, grp) {
    my.model = lm("y ~ y_lag + x1 + x2 ", data = dt.sub)
    coef = summary(my.model)$coefficients
    data.table(grp, variable = rownames(coef), coef)
}

registerDoParallel(8)

isplitDT <- function(x, colname, vals) {
  colname <- as.name(colname)
  ival <- iter(vals)
  nextEl <- function() {
    val <- nextElem(ival)
    list(value=eval(bquote(x[.(colname) == .(val)])), key=val)
  }
  obj <- list(nextElem=nextEl)
  class(obj) <- c('abstractiter', 'iter')
  obj
}
isplitDT2 <- function(x, vals) {
  ival <- iter(vals)
  nextEl <- function() {
    val <- nextElem(ival)
    list(value=x[val], key=val)
  }
  obj <- list(nextElem=nextEl)
  class(obj) <- c('abstractiter', 'iter')
  obj
}
dtcomb <- function(...) {
  rbindlist(list(...))
}

# isplit/rbind
st1 = system.time(results <- foreach(dt.sub=isplit(dt.all,dt.all$grp),   
                    .combine="rbind",
                    .packages="data.table")  %dopar% {
    f_lm(dt.sub$value, dt.sub$key[[1]])
})
# isplit/rbindlist
st2 = system.time(results <- foreach(dt.sub=isplit(dt.all,dt.all$grp),  
                .combine='dtcomb', .multicombine=TRUE,
                .packages="data.table") %dopar% {
    f_lm(dt.sub$value, dt.sub$key[[1]])
})
# isplitDT/rbind
st3 = system.time(results <- foreach(dt.sub=isplitDT(dt.all, 'grp',     unique(dt.all$grp)),
            .combine='dtcomb', .multicombine=TRUE,
            .packages='data.table') %dopar% {
    f_lm(dt.sub$value, dt.sub$key)
})
# isplitDT/rbindlist
st4 = system.time(results <- foreach(dt.sub=isplitDT(dt.all, 'grp', unique(dt.all$grp)),
                .combine='dtcomb', .multicombine=TRUE,
                .packages='data.table') %dopar% {
    f_lm(dt.sub$value, dt.sub$key)
  })
setkey(dt.all, grp)
st5 = system.time(results <-
  foreach(dt.sub=isplitDT2(dt.all, levels(dt.all$grp)),
          .combine='dtcomb', .multicombine=TRUE,
          .packages='data.table') %dopar% {
    f_lm(dt.sub$value, dt.sub$key)
  })
st5
rbind(st1, st2, st3, st4)