options("width"=160)                # wide display with multiple monitors

machine <<- (Sys.info()["nodename"])
pth.dropbox <<- "/home/users/wellerm/"
if (machine == "M11") pth.dropbox <<- "C:/Users/Matt/Dropbox/"
if (machine == "DESKTOP") pth.dropbox <<- "D:/Dropbox/Dropbox/"
if (machine == "IDEA-PC") pth.dropbox <<- "C:/Users/welle_000/Dropbox/"

pth.dropbox.data <<- paste(pth.dropbox, "HEC/IRI_DATA/", sep = "")
pth.dropbox.code <<- paste(pth.dropbox, "HEC/Code/exp1.1/", sep = "")
if (pth.dropbox == "/home/users/wellerm/") {
    pth.dropbox.data <<- paste(pth.dropbox, "IRI_DATA/", sep = "")
    pth.dropbox.code <<- paste(pth.dropbox, "projects/exp1.1/", sep = "")
}

unrowname <- function(x) {
    rownames(x) <- NULL
    x
}


lsa <- function() {
    obj_type <- function(x) class(get(x, envir = .GlobalEnv)) # define environment
    foo = data.frame(sapply(ls(envir = .GlobalEnv), obj_type))
    foo$object_name = rownames(foo)
    names(foo)[1] = "class"
    names(foo)[2] = "object"
    return(unrowname(foo))
}

lsp <-function(package, all.names = FALSE, pattern) {
    package <- deparse(substitute(package))
    ls(
        pos = paste("package", package, sep = ":"),
        all.names = all.names,
        pattern = pattern
    )
}

## from the AER book by Zeileis and Kleiber
options(prompt="R> ", digits=4, show.signif.stars=FALSE)
