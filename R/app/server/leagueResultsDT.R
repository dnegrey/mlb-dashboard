leagueResultsDT <- function(results) {
    # division results
    x <- list(
        AL = results$standings$AL,
        NL = results$standings$NL
    )
    x <- lapply(
        X = x,
        FUN = function(x){
            lapply(x, function(x){
                x %>% 
                    mutate(Result = ifelse(WD, "*", ifelse(WC, "**", NA)),
                           PCT = round(PCT, 3)) %>% 
                    select(-Rank, -WD, -WC)
            })
        }
    )
    return(x)
}