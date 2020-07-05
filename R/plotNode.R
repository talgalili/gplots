here <- function() {}

plot.dendrogram <- stats:::plot.dendrogram
environment(plot.dendrogram) <- environment(here)

plotNodeLimit <- stats:::plotNodeLimit
environment(plotNodeLimit) <- environment(here)

# .memberDend <- stats:::.memberDend
.memberDend <- function (x) 
{
    r <- attr(x, "x.member")
    if (is.null(r)) {
        r <- attr(x, "members")
        if (is.null(r)) 
            r <- 1L
    }
    r
}
environment(.memberDend) <- environment(here)

# .midDend <- stats:::.midDend
.midDend <- function (x) {
    if (is.null(mp <- attr(x, "midpoint"))) 0 else mp
}
environment(.midDend) <- environment(here)

unByteCode <- function(fun)
    {
        FUN <- eval(parse(text=deparse(fun)))
        environment(FUN) <- environment(fun)
        FUN
    }

plotNode <- unByteCode(stats:::plotNode)
environment(plotNode) <- environment(here)
