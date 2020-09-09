analyzeData <- function(dir) {
    # year results
    RDataCreate(
        dir = dir,
        x = "result",
        fun = lapply,
        args = list(
            X = RDataUse(dir, "year"),
            FUN = yearResults
        )
    )
    # main data object
    RDataCreate(
        dir = dir,
        x = "main",
        fun = list,
        args = list(
            result = RDataUse(dir, "result")
        )
    )
}
