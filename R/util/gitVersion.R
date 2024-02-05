gitVersion <- function() {
    y <- readLines("../README.md")[5]
    y <- gsub("**", "", y, fixed = TRUE)
    y <- gsub("version", "", y, fixed = TRUE)
    y <- trimws(y)
    return(y)
}
