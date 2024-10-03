suppressMessages(library(gplots))

col <- "#123456"
col2 <- adjust_hsv(col, h=0.1)  # h
col3 <- adjust_hsv(col, s=0.1)  # s
col4 <- adjust_hsv(col, v=0.7)  # v
col5 <- adjust_hsv("blue")      # name
col6 <- adjust_hsv(4)           # integer
col7 <- adjust_hsv(palette(), alpha=0.1)  # multiple colors, alpha

cols <- c(col2, col3, col4, col5, col6, col7)

stopifnot(all(is.character(cols)))            # character
stopifnot(all(substring(cols, 1, 1) == "#"))  # start with #
stopifnot(all(nchar(cols) %in% c(7, 9)))      # either 7 or 9 chars long

barplot(rep(1, length(cols)), col=cols, space=0, border=NA)  # can be used
