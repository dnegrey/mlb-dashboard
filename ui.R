dashboardPage(
    
    # page attributes
    title = "MLB Dashboard",
    skin = "red",
    
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
        sidebarMenu(
            # input widgets
        )
    ),
    
    # dashboard body
    dashboardBody(
        # custom css
        tags$head(
            tags$link(rel = "stylesheet",
                      type = "text/css",
                      href = "body.css")
        )
        # fluid row, htmltools calls, etc...
        # output objects
    )
    
)