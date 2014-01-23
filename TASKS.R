
#  1. clean zero UNITS out as this leads to Inf price - investigate
getwd()
Rprof("profile1.out", line.profiling=TRUE)
eval(parse(file = "http://pastebin.com/download.php?i=BetqHTYa", keep.source=TRUE))
Rprof(NULL)

summaryRprof("profile1.out", lines = "show")

?Rprof



f_expand = function(my.row) {
	list(c1.new = rep(c1,(c3 - c2+1)) , WEEK = c2:c3)
}


dt = data.table(c1 = letters[1:3], c2 = sample(1:5,3,replace=TRUE), c3 = sample(6:10,3,replace=TRUE))
dt
dt[,list(, b=c2:c3)]
dt[,list(b=(c2:c3)), by = c1]

dt[,f_expand(.SD)]
dt[1]
