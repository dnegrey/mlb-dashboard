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
                x$CGB <- ifelse(is.na(x$GB), 0, x$GB)
                x$PGB <- lag(x$CGB, default = -1)
                x$NewRank <- 1:nrow(x)
                x$NewRank <- ifelse(x$CGB == x$PGB, "-", as.character(x$NewRank))
                x <- x %>% 
                    mutate(WD = ifelse(is.na(WD), FALSE, WD),
                           WC = ifelse(is.na(WC), FALSE, WC),
                           Result = ifelse(WD, "*", ifelse(WC, "**", "")),
                           PCT = paste0(".", 1000*round(PCT, 3)),
                           GB = ifelse(is.na(GB), "-", format(round(GB, 1), nsmall = 1))) %>% 
                    select(-Rank, -WD, -WC) %>% 
                    mutate(W = as.character(W),
                           L = as.character(L)) %>% 
                    select(
                        Rank = NewRank,
                        Team,
                        W,
                        L,
                        PCT,
                        GB,
                        DIV_WC = Result
                    )
                y <- as.data.frame(lapply(x[1, ], function(x){""}))
                x <- rbind(x, y)
                y <- as.data.frame(rbind(names(y)), stringsAsFactors = FALSE)
                names(y) <- names(x)
                y$Rank <- "#"
                y$DIV_WC <- "DIV/WC"
                for (i in 1:length(y)){
                    y[1, i] <- paste0("<span class=\"leagueResultsDT-header\">",
                                      y[1, i],
                                      "</span>")
                }
                x <- rbind(y, x)
                return(x)
            })
        }
    )
    return(x)
}