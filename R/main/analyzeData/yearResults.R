yearResults <- function(x) {
    x$divID <- ifelse(is.na(x$divID), x$lgID, x$divID)
    y <- split(x, x$lgID)
    y <- lapply(y, function(x){split(x, x$divID)})
    z <- lapply(y, function(x){
        lapply(x, standings)
    })
    return(z)
}
