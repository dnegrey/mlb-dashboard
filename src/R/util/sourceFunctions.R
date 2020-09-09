sourceFunctions <- function(dir, recursive = TRUE) {
    x <- list.files(
        path = dir,
        pattern = ".R$",
        full.names = TRUE,
        recursive = recursive
    )
    invisible(
        lapply(x, source)
    )
}
