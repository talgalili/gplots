% $Id: lowess.Rd 2124 2016-03-30 15:29:44Z warnes $
%
% $Log$
% Revision 1.7  2005/06/09 14:20:28  nj7w
% Updating the version number, and various help files to synchronize splitting of gregmisc bundle in 4 individual components.
%
% Revision 1.1.1.1  2005/05/25 22:15:30  nj7w
% Initial submission as an individual package
%
% Revision 1.6  2003/12/03 02:46:51  warnes
% - match function argument defaults with 'usage'
%
% Revision 1.5  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
%

\name{lowess}
\alias{lowess}
\alias{lowess.default}
\alias{lowess.formula}
\alias{plot.lowess}
\alias{plotLowess}
\title{Scatter Plot Smoothing}
\usage{
lowess(x, ...)

\method{lowess}{default}(x, y=NULL, f=2/3, iter=3L, delta=0.01 *
       diff(range(x)), ...)

\method{lowess}{formula}(formula,data=parent.frame(), ..., subset, f=2/3,
       iter=3L, delta=.01*diff(range(mf[-response])))

\method{plot}{lowess}(x, y, ..., col.lowess="red", lty.lowess=2)

plotLowess(formula, data=parent.frame(), ..., subset=parent.frame(),
           col.lowess="red", lty.lowess=2  )
}
\alias{lowess}
\arguments{
  \item{formula}{ formula providing a single dependent variable (y) and
    an single independent variable (x) to use as coordinates in the
    scatter plot.}
  \item{data}{a data.frame (or list) from which the variables in `formula'
    should be taken.}
  \item{subset}{ an optional vector specifying a subset of observations
    to be used in the fitting process. }
  \item{x, y}{vectors giving the coordinates of the points in the scatter
    plot. Alternatively a single plotting structure can be specified.}
  \item{f}{the smoother span. This gives the proportion of points in
    the plot which influence the smooth at each value.
    Larger values give more smoothness.}
  \item{iter}{the number of robustifying iterations which should be
    performed.
    Using smaller values of \code{iter} will make \code{lowess} run
    faster.}
  \item{delta}{values of \code{x} which lie within \code{delta}
    of each other replaced by a single value in the output from
    \code{lowess}.}
  \item{...}{parameters for methods.}
  \item{col.lowess, lty.lowess}{color and line type for plotted line}
}
\description{
  The \code{lowess} function performs the computations for the
  \emph{LOWESS} smoother (see the reference below).
  \code{lowess} returns a an object containing components
  \code{x} and \code{y} which give the coordinates of the smooth.
  The smooth can then be added to a plot of the original
  points with the function \code{lines}.

  Alternatively, \code{plot} can be called directly on the object
  returned from \code{lowess} and the 'lowess' method for \code{plot}
  will generate a scatterplot of the original data with a \code{lowess}
  line superimposed.

  Finally, the \code{plotLowess} function both calculates the
  \code{lowess} smooth and plots the original data with a \code{lowess}
  smooth.
}
\references{
  Cleveland, W. S. (1979)
  Robust locally weighted regression and smoothing scatterplots.
  \emph{J. Amer. Statist. Assoc.} \bold{74}, 829--836.

  Cleveland, W. S. (1981)
  LOWESS: A program for smoothing scatterplots by robust locally weighted
  regression. \emph{The American Statistician}, \bold{35}, 54.
}
\seealso{\code{\link{loess}} (in package \code{modreg}), a newer
  formula based version of \code{lowess} (with different defaults!).
}
\examples{
data(cars)

#
# x,y method
#
plot(cars$speed, cars$dist, main="lowess(cars)")
lines(lowess(cars$speed, cars$dist), col=2)
lines(lowess(cars$speed, cars$dist, f=.2), col=3)
legend(5, 120, c(paste("f=", c("2/3", ".2"))), lty=1, col=2:3)

#
# formula method: plot, then calculate the lowess smoother,
#                 then add smooth to the plot
#
plot(dist ~ speed, data=cars, main="lowess(cars)")
lines(lowess(dist ~ speed, data=cars), col=2, lty=2)
lines(lowess(dist ~ speed, data=cars, f=.2), col=3) # smaller bandwith
legend(5, 120, c(paste("f=", c("2/3", ".2"))), lty=1, col=2:3)

#
# formula method: calculate lowess() smoother, then call plot()
#                  on the lowess object
#
lw <- lowess(dist ~ speed, data=cars)
plot(lw, main="lowess(cars)"  )

#
# formula method: calculate and plot in a single command
#
plotLowess(dist ~ speed, data=cars, main="lowess(cars)")

\dontshow{
# test non-standard evaluation

with(cars, plotLowess(dist ~ speed, main="lowess(cars)") )
with(cars, plot(lowess(dist ~ speed, main="lowess(cars)") ) )

idx <- cars$speed > 10
plotLowess(dist[idx] ~ speed[idx], data=cars, main="lowess(cars)")
plot(lowess(dist[idx] ~ speed[idx], data=cars, main="lowess(cars)"))

with(cars, plotLowess(dist[idx] ~ speed[idx], main="lowess(cars)") )
with(cars, plot(lowess(dist[idx] ~ speed[idx], main="lowess(cars)") ))

local({
dist <- cars$dist
speed <- cars$speed
plotLowess(dist[idx] ~ speed[idx], main="lowess(cars)")
plot(lowess(dist[idx] ~ speed[idx], main="lowess(cars)"))
})
} % dontshow

}
\keyword{smooth}
