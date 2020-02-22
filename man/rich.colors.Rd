\name{rich.colors}
\alias{rich.colors}
\title{Rich Color Palettes}
\description{
  Create a vector of \code{n} colors that are perceptually equidistant
  and in an order that is easy to interpret.
}
\usage{
rich.colors(n, palette="temperature", alpha=1.0, rgb=FALSE, plot=FALSE)
}
\arguments{
  \item{n}{number of colors to generate.}
  \item{palette}{palette to use: \code{"temperature"} contains
    blue-green-yellow-red, and \code{"blues"} contains
    black-blue-white.}
  \item{alpha}{alpha transparency, from 0 (fully transparent)  to 1
    (opaque).} 
  \item{rgb}{if \code{TRUE} then a matrix of RGBA values is included as an
          attribute.}
  \item{plot}{whether to plot a descriptive color diagram.}
}
\value{A character vector of color codes.}
\author{Arni Magnusson.}
\seealso{
  \code{\link{rgb}}, \code{\link{rainbow}}, \code{\link{heat.colors}}.
}
\examples{
m <- abs(matrix(1:120+rnorm(120), nrow=15, ncol=8))
opar <- par(bg="gray", mfrow=c(1,2))
matplot(m, type="l", lty=1, lwd=3, col=rich.colors(8))
matplot(m, type="l", lty=1, lwd=3, col=rich.colors(8,"blues"))
par(opar)

barplot(rep(1,100), col=rich.colors(100), space=0, border=0, axes=FALSE)
barplot(rep(1,20), col=rich.colors(40)[11:30]) # choose subset

plot(m, rev(m), ylim=c(120,0), pch=16, cex=2,
     col=rich.colors(200,"blues",alpha=0.6)[1:120]) # semitransparent

rich.colors(100, plot=TRUE)  # describe rgb recipe

par(mfrow=c(2,2))
barplot(m, col=heat.colors(15), main="\nheat.colors")
barplot(m, col=1:15, main="\ndefault palette")
barplot(m, col=rich.colors(15), main="\nrich.colors")
barplot(m, col=rainbow(15), main="\nrainbow")
par(opar)
}
% Graphics
\keyword{color}
