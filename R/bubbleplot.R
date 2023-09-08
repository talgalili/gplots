bubbleplot <- function(x, ...)
{
  UseMethod("bubbleplot")
}

bubbleplot.default <- function(x, y, z, std=TRUE, pow=0.5, add=FALSE, rev=FALSE,
                               type="p", ylim=NULL, xlab=NULL, ylab=NULL,
                               pch=c(16,1), cex.points=1, col="black",
                               bg=par("bg"), ...)
{
  pch <- rep(pch, length.out=2)
  col <- rep(col, length.out=2)
  bg <- rep(bg, length.out=2)

  if(is.matrix(x))  # matrix or table
  {
    dnn <- names(dimnames(x))
    if(is.null(xlab))
      xlab <- if(is.null(dnn)) "" else dnn[2]
    if(is.null(ylab))
      ylab <- if(is.null(dnn)) "" else dnn[1]
    y <- as.data.frame(as.table(x))[[1]]
    z <- as.data.frame(as.table(x))[[3]]
    x <- as.data.frame(as.table(x))[[2]]
  }

  if(is.list(x))  # data.frame or list
  {
    xyz <- all(c("x","y","z") %in% names(x))  # colnames include x,y,z
    if(is.null(xlab))
      xlab <- if(xyz) "x" else names(x)[1]
    if(is.null(ylab))
      ylab <- if(xyz) "y" else names(x)[2]
    if(xyz)
    {
      y <- x$y
      z <- x$z
      x <- x$x
    }
    else
    {
      y <- x[[2]]
      z <- x[[3]]
      x <- x[[1]]
    }
  }

  if(is.null(xlab))
    xlab <- deparse(substitute(x))
  if(is.null(ylab))
    ylab <- deparse(substitute(y))

  ## Convert factor to numeric
  x <- type.convert(as.character(x), as.is=TRUE)
  y <- type.convert(as.character(y), as.is=TRUE)

  if(is.null(ylim))
    ylim <- range(y)
  if(rev)
    ylim <- rev(ylim)

  if(std)
    mycex <- cex.points * (abs(z)/mean(abs(z)))^pow
  else
    mycex <- cex.points * abs(z)^pow

  if(!add)
    suppressWarnings(plot(x, y, type="n", ylim=ylim, xlab=xlab, ylab=ylab, ...))
  suppressWarnings(points(x[z>0], y[z>0], type=type, cex=mycex[z>0],
                          pch=pch[1], col=col[1], bg=bg[1], ...))
  suppressWarnings(points(x[z<0], y[z<0], type=type, cex=mycex[z<0],
                          pch=pch[2], col=col[2], bg=bg[2], ...))
}

bubbleplot.formula <- function(formula, data, subset, na.action=NULL, ...)
{
  m <- match.call(expand.dots=FALSE)
  if(is.matrix(eval(m$data,parent.frame())))
    m$data <- as.data.frame(data)
  m$... <- NULL
  m[[1L]] <- quote(model.frame)
  mf <- eval(m, parent.frame())

  if(ncol(mf) < 3)
    stop("formula must have the form z ~ x + y")

  bubbleplot.default(mf[c(2,3,1)], ...)
}
