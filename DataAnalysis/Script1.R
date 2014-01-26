dt = data.table(grp = sample(letters[1:3],100, replace = TRUE),
                v1 = rnorm(100), 
                v2 = rnorm(100), 
                v3 = rnorm(100))
sd.cols = c("v2", "v3")
dt.out = dt[, list(v1 = sum(v1),  lapply(.SD,mean)), by = grp, .SDcols = sd.cols]
dt.out = dt[, c(v1 = sum(v1),  lapply(.SD,mean)), by = grp, .SDcols = sd.cols]

sd.cols = c("v1","v2", "v3")
dt.out = dt[, list(sum.v1 = sum(v1), lapply(.SD,mean)), by = grp, .SDcols = sd.cols]
dt.out = dt[, c(sum.v1 = sum(v1), lapply(.SD,mean)), by = grp, .SDcols = sd.cols]






x = matrix(1:100,10)
x;diff(x)