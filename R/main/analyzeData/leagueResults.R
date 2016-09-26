leagueResults <- function(x) {
    UseMethod("leagueResults")
}

leagueResults.divsNA <- function(x) {
    y <- split(x, x$lgID)
    z <- list()
    z$AL <- list()
    z$AL$AL <- standings(y$AL)
    z$NL <- list()
    z$NL$NL <- standings(y$NL)
    return(z)
}