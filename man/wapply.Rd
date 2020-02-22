% $Id: wapply.Rd 1441 2010-06-11 03:11:54Z warnes $
%
% $Log$
% Revision 1.10  2005/12/01 16:46:52  nj7w
% Updated Greg's email address
%
% Revision 1.9  2005/06/09 14:20:28  nj7w
% Updating the version number, and various help files to synchronize splitting of gregmisc bundle in 4 individual components.
%
% Revision 1.1.1.1  2005/05/25 22:15:31  nj7w
% Initial submission as an individual package
%
% Revision 1.8  2003/12/03 02:46:51  warnes
% - match function argument defaults with 'usage'
%
% Revision 1.7  2003/01/20 17:13:06  warnes
%
% - Updated wapply.R to allow specification of evaluation points when
%   method is 'width' or 'range' using the 'pts' argument.
% - Updated wapply.Rd to add 'pts' argument
% - Fixed typos, spelling errors, gramatical errors and lack of clarity
%   in wapply.Rd help text.
%
% Revision 1.6  2002/04/09 00:51:33  warneg
%
% Checkin for version 0.5.3
%
% Revision 1.5  2001/12/07 23:34:35  warneg
%
% Fixed an problem where \code was incorrectly delimited by parens
% rather than curly brackets.
%
% Revision 1.4  2001/12/05 19:36:30  warneg
%  - Clarified how the width of the window is computed when method="nobs".
%
% Revision 1.3  2001/10/16 23:15:01  warneg
%
% Fixed unbalanced brace.
%
% Revision 1.2  2001/09/01 00:01:55  warneg
% Release 0.3.0
%
% Revision 1.1  2001/08/25 05:45:10  warneg
% Initial Checkin
%
%
\name{wapply}
\alias{wapply}
\title{Compute the Value of a Function Over a Local Region Of An X-Y Plot}

\description{
  This function applies the specified function to the sets of y values
  that are defined by overlapping "windows" in the x-dimension. For
  example, setting \code{fun=mean} returns local means, while setting
  \code{fun=function(x) sqrt(var(x))} returns local estimates of
  the standard deviation.
}

\usage{
wapply(x, y, fun=mean, method="range", width, n=50, drop.na=TRUE,
       pts, ...)
}
\arguments{
  \item{x}{ vector of x values for (x,y) pairs }
  \item{y}{ vector of y values for (x,y) pairs }
  \item{fun}{ function to be applied }
  \item{method}{ method of defining an x-neighborhood.  One of
    "width","nobs","range", or "fraction".  See details.}
  \item{width}{ width of an x-neighborhood. See details. }
  \item{n}{ Number of equally spaced points at which to compute local
    estimates. See details.}
  \item{drop.na}{ should points which result in missing values \code{NA}
    be omitted from the return value. Defaults to true. }
  \item{pts}{ \code{x} locations at which to compute the local mean when
    using the "width" or "range" methods. Ignored otherwise.}
  \item{\dots}{ arguments to be passed to \code{fun} }
}
\details{
  Two basic techniques are available for determining what points fall
  within the same x-neighborhood.  The first technique uses a window with
  a fixed width in the x-dimension and is is selected by
  setting \code{method="width"} or \code{method="range"}.  For
  \code{method="width"} the \code{width} argument is an absolute
  distance in the x-dimension.  For \code{method="range"}, the width is
  expressed as a fraction of the x-range.  In both cases, \code{pts}
  specifies the points at which evaluation of \code{fun} occurs.  When
  \code{pts} is omitted, \code{n} x values equally spaced along the x
  range are used.

  The second technique uses windows containing  k neighboring points.  The
  (x,y) pairs are sorted by the x-values and the nearest k/2 points with
  higher x values and the k/2 nearest points with lower x values are
  included in the window.  When \code{method="nobs"}, k equals
  \code{width} (actually 2*floor(\code{width}/2) ).  When
  \code{method="fraction"}, \code{width} specifies what fraction of the
  total number of points should be included. The actual number of points
  included in each window will be floor(n*frac/2)*2.  Regardless of the
  value of \code{pts}, the function \code{fun} will be evaluated at all
  x locations.
}
\value{
  Returns a list with components 
  \item{x }{x location'}
  \item{y }{Result of applying \code{fun} to the window about each x location}
}
\author{ Gregory R. Warnes \email{greg@warnes.net}
  }
\examples{

#show local mean and inner 2-sd interval to help diagnose changing mean
#or variance structure
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1 + x/1000 )

plot(x,y)
lines(wapply(x,y,mean),col="red")

CL <- function(x,sd) mean(x)+sd*sqrt(var(x))

lines(wapply(x,y,CL,sd= 1),col="blue") 
lines(wapply(x,y,CL,sd=-1),col="blue") 
lines(wapply(x,y,CL,sd= 2),col="green")
lines(wapply(x,y,CL,sd=-2),col="green")

#show local mean and inner 2-sd interval to help diagnose changing mean
#or variance structure
x <- 1:1000
y <- rnorm(1000, mean=x/1000, sd=1)

plot(x,y)
lines(wapply(x,y,mean),col="red")

CL <- function(x,sd) mean(x)+sd*sqrt(var(x))

lines(wapply(x,y,CL,sd= 1,method="fraction",width=1/20),col="blue")
lines(wapply(x,y,CL,sd=-1,method="fraction",width=1/20),col="blue")
lines(wapply(x,y,CL,sd= 2,method="nobs",width=250),col="green")
lines(wapply(x,y,CL,sd=-2,method="nobs",width=250),col="green")


}
\keyword{ dplot }
