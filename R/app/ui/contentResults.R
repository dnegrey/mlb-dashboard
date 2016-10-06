contentResults <- function() {
    fluidRow(
        column(
            width = 12,
            box(
                title = strong("Instructions"),
                width = NULL,
                solidHeader = FALSE,
                status = "danger",
                includeMarkdown("www/contentResults.md")
            )
        )
    )
}