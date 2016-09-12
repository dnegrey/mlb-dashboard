publishResults <- function(dir) {
    
    # set environment variable for pandoc
    Sys.setenv(RSTUDIO_PANDOC = "/usr/lib/rstudio/bin/pandoc")
    
    # app main
    file.copy("data/main.RData", dir, overwrite = TRUE)
    
    # restart
    file.create("restart.txt")
    
}
