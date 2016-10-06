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
    
    # main app object
    RDataCreate(
        dir = dir,
        x = "main",
        fun = list,
        args = list(
            results = RDataUse(dir, "results")
        )
    )
    
}
