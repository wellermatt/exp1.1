

library(reshape)
sp.pos = readRDS("/hone/users/wellerm/R/R_data/beer.top.upc.sp.pos.rds")
mx.pr = cast(sp.pos,chain+Market+WEEK~IRI_KEY,fun.aggregate=sum, value="PRICE",add.missing=TRUE,fill=NA)
saveRDS(mx.pr, "/hone/users/wellerm/R/R_data/beer.top.upc.mx.pr.rds")
