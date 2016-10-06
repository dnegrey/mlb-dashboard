standings <- function(x) {
    x <- x %>% 
        mutate(PCT = W/G) %>% 
        select(Rank, Team = name, W, L, PCT, DivWin, WCWin) %>% 
        arrange(Rank, desc(PCT), desc(W), L, Team)
    PW <- x[1, "W"]
    PL <- x[1, "L"]
    x <- x %>% 
        mutate(GB = ifelse(Rank == 1, NA, ((PW - W) + (L - PL))/2)) %>% 
        mutate(WD = DivWin == "Y",
               WC = WCWin == "Y") %>% 
        select(-DivWin, -WCWin)
    return(x)
}