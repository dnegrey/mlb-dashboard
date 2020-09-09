cleanData <- function(dir) {
    # years
    RDataCreate(
        dir = dir,
        x = "year",
        fun = teamsYearSplit,
        args = list(
            teams = RDataUse(dir, "team")
        )
    )
}
