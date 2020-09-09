#!/usr/bin/env Rscript

#####~~~~~ reusable generic components ~~~~~#####

## capture starting working directory and script directory
DIR_START <- getwd()
DIR_SCRIPT <- commandArgs()[grepl("--file=", commandArgs())]
DIR_SCRIPT <- dirname(substr(DIR_SCRIPT, 8, nchar(DIR_SCRIPT)))
DIR_SCRIPT <- setwd(DIR_SCRIPT)
DIR_SCRIPT <- getwd()


#####~~~~~ project specific components ~~~~~#####

## project scripts stored in <project-root>/bin
## change working directory to project root
setwd(paste0(DIR_SCRIPT, "/.."))
DIR_ROOT <- getwd()

## R functions stored in <project-root>/src/R
## source project R functions
source("src/R/util/sourceFunctions.R")
sourceFunctions("src/R/main")
sourceFunctions("src/R/util")


#####~~~~~ script specific components ~~~~~#####

## command line arguments

main <- function(CMD_ARGS,
                 MAIN_CFG = "etc/CONFIG",
                 MAIN_PKG = "etc/PACKAGES") {
    catn(sprintf("Start call to %s", whichScript()))
    # capture start time
    scriptTime <- list(start = Sys.time())
    # read configuration file
    catn("Reading main configuration file...")
    CONFIG <- readConfig(MAIN_CFG)
    for (i in seq_along(CONFIG)) {
        catn(sprintf("CONFIG variable %s is %s", names(CONFIG)[i], CONFIG[i]))
    }
    rm(i)
    # load additional packages
    catn("Loading required packages...")
    sink(file = "/dev/null")
    pld <- suppressMessages(loadPackages(MAIN_PKG))
    sink()
    pld <- ifelse(pld, "SUCCESS", "FAILURE")
    for (i in seq_along(pld)) {
        catn(sprintf("Package load (%s): %s", pld[i], names(pld)[i]))
    }
    rm(i)
    # remove data from last run
    catn("Removing temporary data from previous run...")
    drm <- list.files("data", full.names = TRUE, pattern = ".RData")
    catn(sprintf("There are %s temporary data files that need removed", length(drm)))
    drml <- file.remove(drm)
    if (sum(!drml) == 0) {
        catn("All temporary data files have been removed")
    } else {
        catn("The following files were not removed and should be investigated:")
        invisible(lapply(drm[!drml], catn))
    }
    # get data
    catn("Function `getData()` started")
    getData(
        dir = "data"
    )
    catn("Function `getData()` complete")
    # clean data
    catn("Function `cleanData()` started")
    cleanData(
        dir = "data"
    )
    catn("Function `cleanData()` complete")
    # analyze data
    catn("Function `analyzeData()` started")
    analyzeData(
        dir = "data"
    )
    catn("Function `analyzeData()` complete")
    # publish results
    catn("Function `publishResults()` started")
    publishResults(
        dir = "pub"
    )
    catn("Function `publishResults()` complete")
    # refreshed output check
    tmpd <- all(drml)
    mdob <- file.exists("pub/main.RData") &
        file.info("pub/main.RData")$mtime > scriptTime$start
    catn(sprintf("Main data object successfully rebuilt: %s", mdob))
    arst <- file.exists("restart.txt") &
        file.info("restart.txt")$mtime > scriptTime$start
    catn(sprintf("Restart file successfully rebuilt: %s", arst))
    opc <- all(tmpd, mdob, arst)
    catn(sprintf("Application successfully refreshed: %s", opc))
    # write out script result
    write(opc, "success.txt")
    catn(sprintf("End call to %s", whichScript()))
}

options(scipen = 999)

main(commandArgs(trailingOnly = TRUE))
