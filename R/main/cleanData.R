cleanData <- function(dir) {
    
    # years
    RDataCreate(
        dir = dir,
        x = "years",
        fun = function(x){
            lapply(split(x, x$yearID),
                   function(x){
                       y <- select(x, yearID, lgID, teamID, franchID, divID, Rank,
                                   G, Ghome, W, L, WSWin, LgWin, DivWin, WCWin, name) %>% 
                           mutate(lgID = as.character(lgID),
                                  teamID = as.character(teamID),
                                  franchID = as.character(franchID)) %>% 
                           mutate(LeagueDiv = ifelse(is.na(divID),
                                                     lgID,
                                                     paste0(lgID, divID)))
                       divs <- unique(y$divID)
                       divs <- divs[order(divs)]
                       divs <- paste(divs, collapse = "")
                       class(y) <- c(class(y), sprintf("divs%s", divs))
                       return(y)
                   })
        },
        args = list(x = RDataUse(dir, "teams"))
    )
    
}
