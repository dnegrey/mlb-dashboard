calculate_year_results <- function(x) {
    x$divID <- ifelse(is.na(x$divID), x$lgID, x$divID)
    y <- split(x, x$lgID)
    y <- lapply(y, function(x){split(x, x$divID)})
    y <- lapply(y, function(x){
        lapply(x, calculate_standings)
    })
    z <- list()
    z$standings <- y
    if (all(is.na(x$LgWin))) {
        z$wonAL <- NA
        z$wonNL <- NA
    } else {
        z$wonAL <- x[x$lgID == "AL" & x$LgWin == "Y", "name"]
        z$wonNL <- x[x$lgID == "NL" & x$LgWin == "Y", "name"]
    }
    if (all(is.na(x$WSWin))) {
        z$wonWS <- NA
    } else {
        z$wonWS <- x[x$WSWin == "Y", "name"]
    }
    return(z)
}
