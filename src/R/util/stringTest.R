stringTest <- function(...){
    x <- list(...)
    cc <- unlist(lapply(x, class)) == "character"
    l1 <- unlist(lapply(x, length)) == 1
    y <- cc & l1
    return(y)
}
