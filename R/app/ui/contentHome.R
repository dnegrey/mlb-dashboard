contentHome <- function() {
    fluidRow(
        column(
            width = 12,
            box(
                title = strong("Welcome to my MLB Shiny Dashboard!"),
                width = NULL,
                solidHeader = FALSE,
                status = "danger",
                includeMarkdown("www/contentHome.md")
            )
        )
    )
}