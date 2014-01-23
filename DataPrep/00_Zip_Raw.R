

## this script will take the data for every year for a single category and place it in a
## a new folder as a tar.gz file

root.source =  "/scratch/hpc/29/wellerm/Academic Dataset External"    #"K:/Academic Dataset External/"
root.target = "/storage/users/wellerm/data/01_raw/"

setwd(root.source)
category.files = dir(paste(root.source, "/parsed stub files 2007", sep="")
categories = gsub("prod_|.xlsx","",category.files)

for (category in categories[1])
{
	cat.files = character(0)
	for (yr in 1:1)
	{
		pth = paste(getwd(),"/Year", yr, "/External/", category, sep = "")
		cat.files = c(cat.files,(dir(pth, pattern = "drug|groc", full.names = FALSE)))
		for (fil in cat.files) {
			cmd = paste("cp ", pth, "/", fil, " ", root.target, category, "/", sep="")
			system(cmd)
		}
	}
	
	
	tar.file = paste(root.target, category, "/", category, ".tgz", sep="")
	tar(tar.file, cat.files)
}
yr.files

category = "beer"
dir.create(file.path(root.target, category))
?gzfile

f_file.tar.gz = function(src.file, yr, channel) {
	src.file = paste(getwd(),src.file,sep="/")
	if (file.exists(src.file)) {
		out.path <- paste(root.target, category, "/", "yr", yr, "_", channel, ".tgz", sep="")
		print(gsub("/","\\\\",src.file))
		#tar(tarfile, src.file, compression='gzip')
		system(paste("7z a -tgzip ", gsub("/","\\\\",src.file), " -o", root.target.win))
		}	
}
for (yr in 1:1) {
	pth.raw = paste(root.source, "Year", yr, "/External/", category, "/", sep="")
	setwd(pth.raw)
	# grocery file
	pat1 = paste(category,"groc", sep = "_")
 	fil = dir(pattern = c(pat1))
	f_file.tar.gz(fil, yr, "groc")
	# drug file
	pat2 = paste(category,"drug", sep = "_")
	fil = dir(pattern = c(pat2))
	f_file.tar.gz(fil, yr, "drug")
}
?channel
#
#
getwd()
