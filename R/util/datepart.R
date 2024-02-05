datepart <- function(x) {
    if (any(c("Date", "POSIXct") %in% class(x))) {
        y <- as.Date(substr(x, 1, 10))
    } else {
        y <- x
    }
    return(y)
}
