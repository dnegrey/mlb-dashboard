teamsYearSplit <- function(teams){
    lapply(split(teams, teams$yearID),
           function(x){
               select(x, yearID, lgID, teamID, franchID, divID, Rank,
                      G, Ghome, W, L, WSWin, LgWin, DivWin, WCWin, name) %>% 
                   mutate(lgID = as.character(lgID),
                          teamID = as.character(teamID),
                          franchID = as.character(franchID))
           })
}