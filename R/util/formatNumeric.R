formatNumeric <- function(x, type, digits = 0) {
    # check parameters
    if (!is.numeric(x)) {
        stop("x must be a numeric vector")
    } else if (!stringTest(type)) {
        stop("type must be a string")
    } else if (!(
        is.numeric(digits) & 
        length(digits) == 1 & 
        all(digits >= 0) & 
        all(as.integer(digits) == digits)
    )) {
        stop("digits must be a non-negative integer")
    }
    # proceed
    if (type %in% c("num", "dlr")) {
        y <- format(round(x, digits), nsmall = digits, big.mark = ",")
    } else if (type == "pct") {
        y <- format(100*round(x, digits + 2), nsmall = digits, big.mark = ",")
    } else {
        y <- x
    }
    y <- trimws(y)
    if (type == "dlr") {
        y <- paste0("$", y)
    } else if (type == "pct") {
        y <- paste0(y, "%")
    }
    if (type %in% c("num", "dlr")) {
        y <- ifelse(x < 0, paste0("(", gsub("-", "", y), ")"), y)
    }
    # return
    return(y)
}
