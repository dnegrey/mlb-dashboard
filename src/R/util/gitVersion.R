gitVersion <- function() {
    v <- system("git describe --tags", intern = TRUE)
    v <- v[length(v)]
    #v <- paste("version", v)
    return(v)
}
