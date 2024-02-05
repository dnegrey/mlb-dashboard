readConfig <- function(file) {
    x <- readLines(file)
    x <- strsplit(x, split = "=", fixed = TRUE)
    y <- lapply(x, function(x){x[[1]]})
    z <- lapply(x, function(x){x[[2]]})
    names(z) <- unlist(y)
    return(z)
}
