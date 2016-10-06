cleanData <- function(dir) {
    
    # years
    RDataCreate(
        dir = dir,
        x = "years",
        fun = teamsYearSplit,
        args = list(
            teams = RDataUse(dir, "teams")
        )
    )
    
}
