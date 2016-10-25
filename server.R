shinyServer(function(input, output) {
    
    ## reactive objects ----
    # results season
    resultsSeason <- reactive({
        input$selectResultsSeason
    })
    # season results
    seasonResults <- reactive({
        seasonResultsClean(getSeasonResults(resultsSeason()))
    })
    
    
    ## render output ----
    # results: WS champion
    output$resultsWonWS <- renderText(
        seasonResults()$wonWS
    )
    # results: AL champion
    output$resultsWonAL <- renderText(
        seasonResults()$wonAL
    )
    # results: NL champion
    output$resultsWonNL <- renderText(
        seasonResults()$wonNL
    )
    # standings: AL
    output$resultsStandingsAL <- renderDataTable(
        leagueResultsDT(seasonResults()$AL)
    )
    # standings: NL
    output$resultsStandingsNL <- renderDataTable(
        leagueResultsDT(seasonResults()$NL)
    )
    
})