\name{bubbleplot}
\alias{bubbleplot}
\alias{bubbleplot.default}
\alias{bubbleplot.formula}
\title{Bubble Plot}
\description{
  Draw a bubble plot, a scatterplot with varying symbol sizes and
  colors, or add points to existing plots. A variety of input formats
  are supported, including vectors, matrices, data frames, formulas,
  etc.
}
\usage{
bubbleplot(x, \dots)

\method{bubbleplot}{default}(x, y, z, std=TRUE, pow=0.5, add=FALSE,
           rev=FALSE, type="p", ylim=NULL, xlab=NULL, ylab=NULL,
           pch=c(16,1), cex.points=1, col="black", bg=par("bg"), \dots)

\method{bubbleplot}{formula}(formula, data, subset, na.action=NULL, \dots)
}
\arguments{
  \item{x}{a vector of values for the horizontal axis. Can also be a
    2-dimensional matrix or table (x values in column names and y values
    in row names), or a data frame containing \code{x}, \code{y}, and
    \code{z} in that order. If the data frame contains column names
    \code{x}, \code{y}, and \code{z} then they will be used for
    plotting.}
  \item{\dots}{passed to \code{plot} and \code{points}.}
  \item{y}{a vector of values for the vertical axis.}
  \item{z}{a vector of values determining the bubble sizes.}
  \item{std}{whether to standardize the \code{z} values.}
  \item{pow}{a power coefficient for the bubble sizes.}
  \item{add}{whether to add bubbles to an existing plot.}
  \item{rev}{whether to reverse the y axis.}
  \item{type}{passed to \code{points}.}
  \item{ylim}{passed to \code{plot}.}
  \item{xlab, ylab}{passed to \code{plot}.}
  \item{pch}{passed to \code{points}.}
  \item{cex.points}{scales all bubble sizes.}
  \item{col, bg}{passed to \code{points}.}
  \item{formula}{has the form \code{z ~ x + y}, where \code{z}
    determines the bubble sizes and \code{x} and \code{y} determine
    bubble locations.}
  \item{data}{where formula terms are stored, e.g. data frame or list.}
  \item{subset}{a logical vector specifying which data to plot.}
  \item{na.action}{how \code{NA} values are handled.}
}
\details{
  The \code{std} standardization sets \code{z = abs(z) / mean(abs(z))}.

  The \code{pow = 0.5} (square root) is a good default, where a \code{z}
  value of 2 has twice the area of 1. See example #2 below for an
  exception, where the \code{z} value is tree circumference and
  therefore proportional to the tree diameter.

  The \code{pch}, \code{col}, and \code{bg} arguments can be be vectors
  of length 2, where positive \code{z} values are drawn with
  \code{pch[1]}, \code{col[1]}, \code{bg[1]} and negative \code{z}
  values are drawn with \code{pch[2]}, \code{col[2]}, and \code{bg[2]}.
}
\author{Arni Magnusson.}
\seealso{
  \code{\link{points}} is the underlying function used to draw the
  bubbles.

  \code{\link{symbols}} can also draw bubbles, but does not handle
  negative \code{z} values or have convenience features such as
  \code{pow} and \code{rev}.

  \code{\link{balloonplot}} provides an alternative interface and visual
  style based on tables instead of scatterplots.
}
\examples{
catch.t <- xtabs(Catch~Year+Age, catch.d)              # example table
catch.m <- as.matrix(as.data.frame(unclass(catch.t)))  # example matrix

# 1  Formula
bubbleplot(Catch~Age+Year, data=catch.d)
# Use rev=TRUE to get same layout as crosstab matrix:
print(catch.m)
bubbleplot(Catch~Age+Year, data=catch.d, rev=TRUE, las=1)

# 2  Data frame
bubbleplot(catch.d)
bubbleplot(Orange)
# Visualize tree transverse section at breast height
bubbleplot(Orange, pow=1, cex=2, pch=21,
           col="darkred", bg="peru", lwd=1.5)

# 3  Matrix or table
bubbleplot(catch.m)
bubbleplot(catch.t)

# 4  Positive and negative values
bubbleplot(catch.r)
bubbleplot(Resid~Age+Year, catch.r, subset=Age \%in\% 4:9,
           rev=TRUE, xlim=c(3.5,9.5), cex=1.3)
# Residuals from orange tree model
library(nlme)
fm <- nlme(circumference~phi1/(1+exp(-(age-phi2)/phi3)),
           fixed=phi1+phi2+phi3~1, random=phi1~1|Tree,
           data=Orange, start=c(phi1=200,phi2=800,phi3=400))
bubbleplot(residuals(fm)~Tree+age, Orange)
bubbleplot(residuals(fm)~Tree+age, Orange, cex=2.5, pch=16,
           col=c("dodgerblue","orange"))

# 5  Richter magnitude, amplitude, and energy release
bubbleplot(mag~long+lat, quakes, pch=1)
bubbleplot(10^mag~long+lat, quakes, cex=1.2, col=gray(0, 0.3))
bubbleplot(sqrt(1000)^mag~long+lat, quakes, cex=1.2, col=gray(0, 0.3))
bubbleplot(sqrt(1000)^mag~long+lat, quakes, cex=1.2, col="#FF00004D")
}
