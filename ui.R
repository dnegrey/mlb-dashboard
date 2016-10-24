dashboardPage(
    
    # page attributes
    title = "MLB Dashboard",
    skin = "blue",
    
    # dashboard header
    dashboardHeader(
        title = "Major League Baseball",
        titleWidth = 250
    ),
    
    # dashboard sidebar
    dashboardSidebar(
        width = 250,
        # custom css
        tags$head(
            tags$link(rel = "stylesheet",
                      type = "text/css",
                      href = "sidebar.css")
        ),
        # sidebar menu
        sidebarMenu(
            menuItem("Home", tabName = "home", icon = icon("home")),
            menuItem("Results by Year", tabName = "resultsYear", icon = icon("flag"))
        )
    ),
    
    # dashboard body
    dashboardBody(
        # custom css
        tags$head(
            tags$link(rel = "stylesheet",
                      type = "text/css",
                      href = "body.css")
        ),
        # fluid row, htmltools calls, etc...
        # tab items
        tabItems(
            tabItem(
                tabName = "home",
                h2(strong(icon("home"), "Home")),
                contentHome()
            ),
            tabItem(
                tabName = "resultsYear",
                h2(strong(icon("flag"), "Results by Year")),
                contentResults()[[1]],
                contentResults()[[2]]
            )
        )
    )
    
)