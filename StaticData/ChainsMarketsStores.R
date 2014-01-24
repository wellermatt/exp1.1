f_load.stores.raw = function()
{
	setwd(pth.dropbox.data)
 	stores = readRDS("./iri reference data/stores.clean.rds")
	stores
}
