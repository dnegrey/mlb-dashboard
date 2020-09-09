catn <- function(..., prefix = paste0("----- ", basename(getwd()), " Log ", Sys.time(), ":")) {
    x <- list(...)
    stopifnot(
        all(unlist(lapply(x, is.character))),
        is.character(prefix),
        length(prefix) == 1
    )
    y <- lapply(x, function(z){
        paste(prefix, z)
    })
    z <- unlist(y)
    cat(z, sep = "\n")
}
