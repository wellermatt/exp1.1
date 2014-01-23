## FIRST STEP
## convert the raw files to a more suitable format (rds) whilst also combining 
## 4 columns into a UPC code and merging all the years into one consolidated file

rm(list=ls())
ptm = proc.time()

## libraries and sourcing additional R scripts for functions used in this script
source("../scripts/memory_usage.R")
library(plyr)
library(data.table)


## Parameter definitions, will be defined as arguments passed in by scripts in the future
par.category = "beer"
par.start.year = 1
par.end.year = 6
par.drug.opt = TRUE  ;  par.groc.opt = TRUE
par.transform.data = TRUE   ;  par.merge.data = FALSE

## Define file paths in use
curr.dir = getwd()
pth.raw = "/storage/users/wellerm/data/01_raw/"
pth.tf = "/storage/users/wellerm/data/02_tf/sales/"
colClasses = c("integer", "integer","integer","integer","integer","integer","integer","numeric", "character", "integer","integer")


f_iri.process.data.file = function(df)
{  
  df <- within(df, {     
	# Notice that multiple vars can be changed
    WEEK <- WEEK - 1113
    IRI_KEY = factor(IRI_KEY)
    F = factor(F)
    D = factor(D)
    PR = factor(PR)
    })
	df <- within(df, {
	UPC = paste(as.character(sprintf("%02d", SY)),
                as.character(sprintf("%02d", GE)), 
                as.character(sprintf("%05d", VEND)),
                as.character(sprintf("%05d", ITEM)),sep ="-")
    UPC = factor(UPC)
  })
  df$SY = df$GE = df$VEND = df$ITEM = NULL
  
}


################
## DATA - calendar is required to determine the IRI start and end weeks for each year
cal = read.csv("~/IRI_DATA/IRI_Calendar.csv")[,c(1,4)]
years = ddply(cal,.(dataset_Year),summarise,min(IRI_week),max(IRI_week))
names(years) = c("yr","start.week","end.week")
print(years)

###############
f.transform = function(this.year) {

	# build the file names of the drug and grocery data files for the year being transformed
	prefix = paste(pth.raw , par.category, "/", par.category, sep="")        
	fil.drug = paste(prefix, "_drug_", years[this.year, 2], "_", years[this.year,3], sep = "")
	fil.groc = paste(prefix,  "_groc_", years[this.year, 2], "_", years[this.year,3], sep = "")
	print(fil.drug) ; print(fil.groc)
	
	# now process the drug and grocery files as required, loading from file and then cleaning
	if (par.drug.opt == TRUE) {
		df.drug = data.table(read.table(file = fil.drug, sep = "", header = TRUE, colClasses = colClasses, strip.white = TRUE, comment.char = "")) ; print(nrow(df.drug))
		df.drug = f_iri.process.data.file(df.drug) }
  	if (par.groc.opt == TRUE) {
		df.groc = data.table(read.table(file = fil.groc, sep = "", header = TRUE, colClasses = colClasses, strip.white = TRUE, comment.char = "")) ; print(nrow(df.groc))
		df.groc = f_iri.process.data.file(df.groc) }
	print(lsos(n=5))
  	
	# combine the files for this year
	if ((par.groc.opt + par.drug.opt) == 2) {
  		dat.processed = rbind(df.drug, df.groc) 
		df.drug = df.groc = NULL
		gc()
	} else {
		if (par.groc.opt == TRUE) dat.processed = df.groc else dat.processed = df.drug
	}
	df.drug = df.groc = NULL
	gc()
	print(proc.time() - ptm)
	#dat.processed = data.table(dat.processed)
	#proc.time() - ptm
	
	# finally output the transformed and consolidated file for the year/category
	output.file = paste(pth.tf, par.category,"/", par.category,".tf.", this.year, ".rds", sep="") 
	print(output.file)
	saveRDS(dat.processed, file = output.file)
	dat.processed = NULL ; gc(reset=TRUE)	
}

###### EXECUTE THE TRANSFORMATIONS AND CONSOLIDATION FOR A CATEGORY #####

# actually perform the transforms and save the individual year files as rds
if (par.transform.data == TRUE) {
	for (this.year in par.start.year:par.end.year) {
		print(paste("Loading:", par.category, "year", this.year))
		f.transform(this.year)
	}
}

print(proc.time() - ptm)
dat.i = NULL ; gc()
print(lsos())
