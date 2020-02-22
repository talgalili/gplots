% $Id: hist2d.Rd 1812 2014-04-17 19:05:11Z warnes $
\name{hist2d}
\alias{hist2d}
\alias{print.hist2d}
\title{ Compute and Plot a 2-Dimensional Histogram }
\description{
  Compute and plot a 2-dimensional histogram.
}
\usage{
hist2d(x,y=NULL, nbins=200, same.scale=FALSE, na.rm=TRUE, show=TRUE,
       col=c("black", heat.colors(12)), FUN=base::length, xlab, ylab,
       ... )
\method{print}{hist2d}(x, ...)
}
\arguments{
  \item{x}{either a vector containing the x coordinates
    or a matrix with 2 columns. }
  \item{y}{a vector contianing the y coordinates, not required if `x'
    is matrix}
  \item{nbins}{number of bins in each dimension. May be a scalar or a
    2 element vector.  Defaults to 200.}
  \item{same.scale}{use the same range for x and y. Defaults to FALSE.}
  \item{na.rm}{ Indicates whether missing values should be
    removed. Defaults to TRUE.}
  \item{show}{ Indicates whether the histogram be displayed using
    \code{image} once it has
    been computed. Defaults to TRUE.}
  \item{col}{ Colors for the histogram. Defaults to "black" for
    bins containing no elements, a set of 16 heat colors for other bins.}
  \item{FUN}{Function used to summarize bin contents.  Defaults to
    \code{base::length}. Use, e.g., \code{mean} to calculate means for each bin
    instead of counts.}
  \item{xlab,ylab}{(Optional) x and y axis labels}
  \item{\dots}{ Parameters passed to the image function. }
}
\details{
  This fucntion creates a 2-dimensional histogram by cutting the x and
  y dimensions into \code{nbins} sections.  A 2-dimensional matrix is
  then constucted which holds the counts of the number of observed (x,y) pairs
  that fall into each bin.  If \code{show=TRUE}, this matrix is then
  then passed to \code{image} for display.
}
\value{
  A list containing 5 elements:
  \item{counts}{Matrix containing the number of points falling into each
    bin}
  \item{x.breaks, y.breaks}{Lower and upper limits of each bin}
  \item{x,y}{midpoints of each bin}
  }
\author{ Gregory R. Warnes \email{greg@warnes.net}}

\seealso{
  \code{\link{image}}, \code{\link{persp}}, \code{\link{hist}},
  \code{\link[r2d2]{freq2d}} 
  }

\examples{
   ## example data, bivariate normal, no correlation
   x <- rnorm(2000, sd=4)
   y <- rnorm(2000, sd=1)

   ## separate scales for each axis, this looks circular
   hist2d(x,y)

   ## same scale for each axis, this looks oval
   hist2d(x,y, same.scale=TRUE)

   ## use different ## bins in each dimension
   hist2d(x,y, same.scale=TRUE, nbins=c(100,200) )

   ## use the hist2d function to create an h2d object
   h2d <- hist2d(x,y,show=FALSE, same.scale=TRUE, nbins=c(20,30))

   ## show object summary
   h2d

   ## object contents
   str(h2d)

   ## perspective plot
   persp( h2d$x, h2d$y, h2d$counts,
          ticktype="detailed", theta=30, phi=30,
          expand=0.5, shade=0.5, col="cyan", ltheta=-30)

   ## for contour (line) plot ...
   contour( h2d$x, h2d$y, h2d$counts, nlevels=4 )

   ## for a filled contour plot ...
   filled.contour( h2d$x, h2d$y, h2d$counts, nlevels=4,
                   col=gray((4:0)/4) )



}
\keyword{dplot}
\keyword{hplot}
