# Load libraries
library(dplyr)
library(Lahman)

# Source local functions
source("R/util/sourceFunctions.R")
sourceFunctions("R/util")
sourceFunctions("R/main")

# Year/team level data
year_team <- Teams %>%
  filter(
    yearID >= 1903,
    lgID %in% c("AL", "NL")
  )

# Split by year
year_split <- lapply(
  X = split(year_team, year_team$yearID),
  FUN = function(x) {
    x %>%
      select(
        yearID, lgID, teamID, franchID, divID, Rank, G,
        Ghome, W, L, WSWin, LgWin, DivWin, WCWin, name
      ) %>%
      mutate(
        lgID = as.character(lgID),
        teamID = as.character(teamID),
        franchID = as.character(franchID)
      )
  }
)

# Calculate annual results
year_results <- lapply(
  X = year_split,
  FUN = calculate_year_results
)

# Save to main RDS file
main <- list(result = year_results)
saveRDS(main, "main.rds")
file.create("success.txt")
