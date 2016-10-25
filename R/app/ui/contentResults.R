contentResults <- function() {
    list(
        fluidRow(
            column(
                width = 12,
                selectInput(
                    "selectResultsSeason",
                    label = "Select Season",
                    choices = getResultsSeasons(),
                    selected = getResultsSeasonsMax(),
                    width = "25%"
                ),
                h3(strong("World Series Champion: "),
                   textOutput("resultsWonWS", inline = TRUE))
            )
        ),
        fluidRow(
            box(
                title = strong("American League"),
                solidHeader = TRUE,
                status = "primary",
                h4(strong("Champion: "),
                   textOutput("resultsWonAL", inline = TRUE)),
                div(
                    dataTableOutput("resultsStandingsAL"),
                    class = "resultsStandingsContainer"
                )
            ),
            box(
                title = strong("National League"),
                solidHeader = TRUE,
                status = "primary",
                h4(strong("Champion: "),
                   textOutput("resultsWonNL", inline = TRUE)),
                div(
                    dataTableOutput("resultsStandingsNL"),
                    class = "resultsStandingsContainer"
                )
            )
        )
    )
}