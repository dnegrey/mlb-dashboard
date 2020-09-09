leagueResultDT <- function(leagueResult) {
    x <- leagueResult
    for (i in grep("#", x$Rank)) {
        for (j in 1:length(x)) {
            x[i, j] <- paste0("<span class=\"leagueResultDT-header\">",
                              x[i, j],
                              "</span>")
        }
    }
    y <- datatable(
        data = x,
        caption = "* Division Winner; ** Wild Card Winner",
        class = "row-border hover nowrap",
        escape = FALSE,
        selection = "none",
        extensions = "Scroller",
        rownames = FALSE,
        colnames = rep("", length(x)),
        options = list(
            dom = "t",
            ordering = FALSE,
            pageLength = nrow(x),
            scrollY = 600,
            scrollCollapse = FALSE,
            columnDefs = list(
                list(className = 'dt-center', targets = c(0, 2, 3, 4, 5, 6))
            )
        )
    )
    return(y)
}