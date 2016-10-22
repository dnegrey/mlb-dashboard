seasonResultsClean <- function(seasonResults) {
    # division results
    x <- list(
        AL = seasonResults$standings$AL,
        NL = seasonResults$standings$NL
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
                x <- rbind(y, x)
                return(x)
            })
        }
    )
    # division labels
    for (i in 1:length(x)) {
        for (j in 1:length(x[[i]])) {
            k <- names(x[[i]])[j]
            names(x[[i]])[j] <- switch(k, AL = "League", NL = "League",
                                       E = "East", C = "Central", W = "West")
            x[[i]][[j]][1, 2] <- gsub("Team",
                                      trimws(paste(names(x)[i], 
                                                   ifelse(names(x[[i]])[j] == "League",
                                                          "", names(x[[i]][j])))),
                                      x[[i]][[j]][1, 2])
        }
    }
    rm(i, j, k)
    # division order
    x <- lapply(x, function(x){list(x$League, x$East, x$Central, x$West)})
    # division stack
    x <- lapply(x, function(x){do.call(rbind, x)})
    # remove bottom row
    x <- lapply(x, function(x){x[1:(nrow(x)-1), ]})
    # construct output list
    x <- list(
        AL = x$AL,
        NL = x$NL,
        wonAL = seasonResults$wonAL,
        wonNL = seasonResults$wonNL,
        wonWS = seasonResults$wonWS
    )
    return(x)
}