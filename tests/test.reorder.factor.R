## Test results before and after loading gdata

m <- factor(c('a','b','c'))

( m1 <- stats::reorder(m, X=c(3, 2, 1)) )

( m2 <- gplots::reorder.factor(m, X=c(3, 2, 1)) )

stopifnot(identical(m1,m2))
