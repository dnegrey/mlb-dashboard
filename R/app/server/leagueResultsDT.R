leagueResultsDT <- function(leagueResults) {
    x <- leagueResults
    for (i in grep("#", x$Rank)) {
        for (j in 1:length(x)) {
            x[i, j] <- paste0("<span class=\"leagueResultsDT-header\">",
                              x[i, j],
                              "</span>")
        }
    }
    datatable(
        x,
        caption = "* Division Winner; ** Wild Card Winner",
        class = c("hover row-border"),
        escape = FALSE,
        rownames = FALSE,
        colnames = rep("", length(x)),
        options = list(
            dom = 't',
            ordering = FALSE,
            pageLength = 100,
            columnDefs = list(
                list(className = 'dt-center', targets = c(0, 2, 3, 4, 5, 6))
            )
        )
    )
}