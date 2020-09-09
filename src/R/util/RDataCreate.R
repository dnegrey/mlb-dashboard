RDataCreate <- function(dir, x, fun, args, replace = FALSE) {
    f <- paste0(dir, "/", x, ".RData")
    if (file.exists(f) && !replace) {
        cat(sprintf("The file [%s] already exists and replace is FALSE", f), sep = "\n")
    } else if ((file.exists(f) && replace) || !file.exists(f)) {
        if (file.exists(f)) {
            cat(sprintf("The file [%s] already exists and replace is TRUE", f), sep = "\n")
            cat(sprintf("The file [%s] will now be replaced", f), sep = "\n")
            file.remove(f)
        } else  {
            cat(sprintf("The file [%s] does not exist", f), sep = "\n")
            cat(sprintf("The file [%s] will now be created", f), sep = "\n")
        }
        y <- do.call(fun, args)
        assign(x, y)
        save(list = x, file = f)
    }
}
