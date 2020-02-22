% $Id: space.Rd 1441 2010-06-11 03:11:54Z warnes $
%
% $Log$
% Revision 1.9  2005/09/12 15:44:37  nj7w
% Updated Greg's email
%
% Revision 1.8  2005/06/09 14:20:28  nj7w
% Updating the version number, and various help files to synchronize splitting of gregmisc bundle in 4 individual components.
%
% Revision 1.1.1.1  2005/05/25 22:15:31  nj7w
% Initial submission as an individual package
%
% Revision 1.7  2004/04/13 13:42:31  warnes
% Add ability to space points along 'y' direction.
%
% Revision 1.6  2003/01/03 19:23:34  warnes
% - Added reference to and comparison example of sunflowerplot.
% - Added code to put example plots on same plot window using par(mfrow=...).
%
% Revision 1.5  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
%

\name{space}
\alias{space}
\title{Space points in an x-y plot so they don't overlap.}
\description{
  Space points in an x-y plot so they don't overlap.
}
\usage{
space(x, y, s=1/50, na.rm=TRUE, direction="x")
}
\arguments{
  \item{x}{numeric vector of x coordonates.}
  \item{y}{numeric vector of x coordonates.}
  \item{s}{either a single numeric value or 2 element vector specifying
  the minimum distance between points in the x and y dimensions as a
  fraction of the x and y range.  Defaults to 1/50.}
  \item{na.rm}{logical indicating whether pairs where one or both
    elements are missing should be removed.  Defaults to TRUE.}
  \item{direction}{"x" or "y", indicating which direction points should
    be moved to accomplish spacine.}
}
\details{
  In an x-y plot where at least one variable has discrete levels several
  points may be plotted at or very near the same coordonates.
  This makes it difficult to guage the number of points in a specific
  region.  A common method of resolving this problem is to 'jitter' the
  points by adding random noise.

  This function takes a different approach to the same problem.  

  When there are two or more points with the same (x,y) value (or
  within x+-s[1] and x+-s[2]), it spaces these out in the x direction
  so that the points are separated by at least distance s.

  Another method for dealing with overploting is available in the
  \code{\link{sunflowerplot}} function.
}
\value{
  list with two components
  \item{x}{(modified) x location for each input point}
  \item{y}{y location of each input point}
}
\author{ Gregory R. Warnes \email{greg@warnes.net} }
\seealso{ \code{\link{jitter}}, \code{\link{sunflowerplot}} }

\examples{
   x <- rep(1:5, 10)
   y <- round(rnorm(length(x),x))

   prepar <- par("mfrow")
   par(mfrow=c(1,3))

   # standard x-y plot: noverlapping points are hidden
   plot(x,y)
   title("Standard Plot") 

   # 'spaced' plot: overlapping points are spread out and visible
   plot(space(x,y))
   title("Plot with 'space'")


   # 'spaced' plot: overlapping points are spread out along y and visible
   plot(space(x,y, direction='y'))
   title("Plot with 'space', direction='y' ")


   # 'sunflower' plot, another approach, overlapping points are
   # indicated via petals
   sunflowerplot(x,y)
   title("Sunflower Plot")

   \testonly{
     # check that missign values correctly handled
     x <- c(x,NA)
     y <- c(y,NA)
     plot(space(x,y))
   }

   par(mfrow=prepar)
}
\keyword{ dplot }

