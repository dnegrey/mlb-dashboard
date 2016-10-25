contentHome <- function() {
    fluidRow(
        column(
            width = 12,
            box(
                title = strong("Welcome to my MLB Shiny dashboard!"),
                width = NULL,
                solidHeader = FALSE,
                includeMarkdown("www/contentHome.md")
            )
        )
    )
}