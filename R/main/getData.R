getData <- function(dir) {
    
    # teams
    RDataCreate(
        dir = dir,
        x = "teams",
        fun = function(x) {
            filter(x, yearID >= 1903 & lgID %in% c("AL", "NL"))
        },
        args = list(
            x = Teams
        )
    )
    
}
