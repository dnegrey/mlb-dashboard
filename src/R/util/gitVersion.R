gitVersion <- function() {
    cmd <- "git describe --tags $(git rev-list --tags --max-count=1)"
    gf <- system(command = sprintf("%s | wc -l", cmd), intern = TRUE)
    gf <- as.logical(as.integer(gf))
    x <- NA_character_
    if (gf) {
        x <- system(cmd, intern = TRUE)
    }
    return(x)
}
