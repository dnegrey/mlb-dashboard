analyzeData <- function(dir) {
    
    # year results
    RDataCreate(
        dir = dir,
        x = "results",
        fun = lapply,
        args = list(
            X = RDataUse(dir, "years"),
            FUN = yearResults
        )
    )
    
}
