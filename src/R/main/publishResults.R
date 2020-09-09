publishResults <- function(dir) {
    # main app object
    file.copy("data/main.RData", dir, overwrite = TRUE)
    
    # restart
    file.create("restart.txt")
}
