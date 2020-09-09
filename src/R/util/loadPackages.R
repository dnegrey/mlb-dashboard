loadPackages <- function(file) {
    sapply(
        readLines(file),
        function(x){
            cat(sprintf("Loading package: %s\n", x))
            invisible(
                library(x, character.only = TRUE, logical.return = TRUE)
            )
        }
    )
}
