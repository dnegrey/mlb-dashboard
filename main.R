# load spork package
library(spork)

# read CONFIG file
CONFIG <- readConfig("CONFIG")

# load additional packages
loadPackages("PACKAGES")

# source local functions
sourceFunctions("R/main")

# get data
getData(dir = "data")

# clean data
cleanData(dir = "data")

# analyze data
analyzeData(dir = "data")

# publish results
publishResults(dir = "pub")

# deliver results
deliverResults(dir = CONFIG$PUBLISH)
