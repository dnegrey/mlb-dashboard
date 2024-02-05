whichScript <- function() {
    x <- commandArgs()[grepl("--file=", commandArgs())]
    x <- basename(substr(x, 8, nchar(x)))
    return(x)
}
