

library("data.table")
rm(list=ls())
options(width=200)
machine = (Sys.info()["nodename"])

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

###############################
# THIS CODE NEEDS TO BE RUN TO CREATE THE WEEKLY INPUT DATASETS
#setwd(paste(pth, "HEC/Code/exp1", sep=""))   ;   source("TS_Regression.R")
options(echo=TRUE) # if you want see commands in output file
args <- commandArgs(trailingOnly = TRUE)
print(args)
par.category = args[1] #"carbbev"

setwd(paste(pth.dropbox.data, "iri category subsets/reformatted/",sep=""))
setwd(pth.dropbox.code)		; source("./ModelFitting/LoadData.R")   # loads the calendars, the category data, the fc.items, the stores file
setwd(pth.dropbox.code)		; source("./DataPrep/06_prepare_regression_data_functions.R")   # loads the calendars, the category data, the fc.items, the stores file

calendar.map.week.445 = calendar.weekly[,list(WEEK, period_id)]
sp = merge(fc.items[,1:2,with=FALSE], dat.cat, by = "fc.item")    ######## this needs removing so we can get the level into the 
keycols = c("fc.item","WEEK")
setkeyv(sp,keycols) 

######## FOR TESTING ONLY - REMOVE!
#fc.items = fc.items[1:3]

# expand the dataset to insert missing weeks as NA records with only the key values of fc.item & WEEK
fc.item.weeks.all = data.table(expand.grid(fc.items$fc.item, 1:313))
setnames(fc.item.weeks.all, 
		c("fc.item","WEEK"))
keycols = c("fc.item","WEEK")
setkeyv(fc.item.weeks.all,keycols) 

sp = merge(fc.item.weeks.all, sp, all.x=TRUE)
dat.cat = NULL
fc.item.weeks.all = NULL

#=========================================================================================
# ALL fc.items Weekly
#=========================================================================================

seasonal.harmonics = f_ts.seas.harmonics(season.type="WEEKLY", num.periods = 313, max.harmonics = 26)      # add the 26 sin and cos variables
seasonal.harmonics = data.table(cbind(WEEK = 1:313, seasonal.harmonics))
calendar.slim = calendar.weekly.lead.lag[,c(1:2,7:length(calendar.weekly.lead.lag)),with=FALSE][1:313,!"Hols_name",with=FALSE]

sp = merge(sp, calendar.slim, by="WEEK")  # add in the calendar fields
sp = merge(sp, seasonal.harmonics, by="WEEK")  # add in the calendar fields
gc()
tables()
setcolorder(sp, c("fc.item","WEEK", names(sp)[3:length(sp)]))
keycols = c("fc.item","WEEK")
setkeyv(sp,keycols) 

sp = cbind(sp, sp[, f_data.transform.add.variables.weekly(.SD), by = fc.item][, fc.item := NULL])

#dat.store.weekly = ddply(
						#.data=sp,
						#.variables=c("fc.item"),
						#.fun= function(dat.in) f_data.transform.add.variables.weekly(dat.in, 
						#calendar.slim, seasonal.harmonics)
						#)
fil = paste(pth.dropbox.data, "regression datasets/", par.category, ".regression.data.weekly.rds", sep="")
saveRDS(object=sp, file=fil)  




###########################
## MONTHLY DATA      
# ITEM LEVEL
#dat.item.445 =  f_data.transform.add.variables.445(sp.item.445, calendar.445)
#fil = paste(pth, "HEC/Data/regression datasets/dat.item.445.rds", sep="")
#saveRDS(object=dat.item.445, file=fil)
#
## CHAIN LEVEL
##chains = unique(sp.chain.445$chain)
#fil = paste(pth, "HEC/Data/regression datasets/dat.chain.445.rds", sep="")
#dat.chain.445 = ddply(.data=sp.chain.445,
                #.variables=("fc.item"),
                #.fun= function(dat.in) f_data.transform.add.variables.445(dat.in, calendar.445))
#saveRDS(object=dat.chain.445, file=fil)
#
#
## STORE LEVEL
##stores = unique(sp.pos.445$IRI_KEY)
#fil = paste(pth, "HEC/Data/regression datasets/dat.store.445.rds", sep="")
#dat.store.445 = ddply(.data=sp.pos.445,
                #.variables=("fc.item"),
                #.fun= function(dat.in) f_data.transform.add.variables.445(dat.in, calendar.445))
#saveRDS(object=dat.store.445, file=fil)    
#
#
######################################################################################
##STEP 2
######################################################################################
#
#rm(list=ls())
#options(width=120)
#if (Sys.info()["nodename"]!="M11") pth = "D:/Dropbox/Dropbox/" else pth = "C:/Users/matt/Dropbox/" 
#setwd(paste(pth, "HEC/Code/exp1", sep=""))   ;   source("TS_Regression.R")
#
##WEEKLY DATA FOR ALL LEVELS
#fil = paste(pth, "HEC/Data/regression datasets/dat.item.weekly.rds", sep="")
#dat.item.weekly = readRDS(file=fil)
#
#fil = paste(pth, "HEC/Data/regression datasets/dat.chain.weekly.rds", sep="")
#dat.chain.weekly = readRDS(file=fil)
#
#fil = paste(pth, "HEC/Data/regression datasets/dat.store.weekly.rds", sep="")
#dat.store.weekly = readRDS(file=fil)
#
## 445 DATA FOR ALL LEVELS
#fil = paste(pth, "HEC/Data/regression datasets/dat.item.445.rds", sep="")
#dat.item.445 = readRDS(file=fil)
#
#fil = paste(pth, "HEC/Data/regression datasets/dat.chain.445.rds", sep="")
#dat.chain.445 = readRDS(file=fil)
#
#fil = paste(pth, "HEC/Data/regression datasets/dat.store.445.rds", sep="")
#dat.store.445 = readRDS(file=fil)
#
##save.image("D:/Dropbox/Dropbox/HEC/Data/workspace/regression.RData")
##dat.store = dat$dat.store  ; dat.chain = dat$dat.chain  ; dat.item = dat$dat.item
#dat = list(dat.chain.weekly = dat.chain.weekly, dat.store.weekly = dat.store.weekly, dat.item.weekly = dat.item.weekly,
         #dat.chain.445 = dat.chain.445, dat.store.445 = dat.store.445, dat.item.445 = dat.item.445)  
##dat
#
#
#dat.store.weekly = dat$dat.store.weekly  ; dat.chain.weekly = dat$dat.chain.weekly  ; dat.item.weekly = dat$dat.item.weekly
#dat.store.445 = dat$dat.store.445  ; dat.chain.445 = dat$dat.chain.445  ; dat.item.445 = dat$dat.item.445
#dat = NULL ; sp.pos.weekly = NULL ; sp.pos.445 = NULL ; sp.chain.weekly = sp.chain.445 = sp.item.weekly = sp.item.445 = NULL
#save.image(paste(pth,"/HEC/Data/workspace/regression.RData",sep=""))
#source(paste(pth,"Development/R Libraries/test_mem_usage.R", sep = ""))
#lsos(n = 40)
#
#
