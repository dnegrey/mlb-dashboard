RDataUse <- function(dir, x) {
    f <- paste0(dir, "/", x, ".RData")
    if (!file.exists(f)) {
        stop(sprintf("The file [%s] does not exist", f))
    } else {
        nv <- new.env()
        load(file = f, envir = nv)
        if (!any(ls(nv) == x)) {
            stop(sprintf("The object [%s] was not found in [%s]", x, f))
        } else {
            y <- get(x, pos = nv)
            return(y)
        }
    }
}
