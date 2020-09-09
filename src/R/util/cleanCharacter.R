cleanCharacter <- function(x) {
    UseMethod("cleanCharacter")
}
cleanCharacter.character <- function(x) {
    y <- trimws(x)
    z <- ifelse(
        is.na(y),
        NA_character_,
        ifelse(
            y == "",
            NA_character_,
            y
        )
    )
    return(z)
}
cleanCharacter.factor <- function(x) {
    x <- as.character(x)
    cleanCharacter(x)
}
cleanCharacter.data.frame <- function(x) {
    for (i in seq_along(x)) {
        if (any(inherits(x[, i], "character"), 
                inherits(x[, i], "factor"))) {
            x[, i] <- cleanCharacter(x[, i])
        }
    }
    return(x)
}
