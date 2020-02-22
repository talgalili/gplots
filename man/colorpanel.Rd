\name{colorpanel}
\alias{colorpanel}
\alias{redgreen}
\alias{greenred}
\alias{bluered}
\alias{redblue}
\title{Generate a smoothly varying set of colors}
\description{
  \code{colorpanel} generate a set of colors that varies
  smoothly. \code{redgreen}, \code{greenred}, \code{bluered}, and 
  \code{redblue} generate red-black-green, green-black-red,
  red-white-blue, and blue-white-red colorbars, respectively.
  colors 
}
\usage{
colorpanel(n, low, mid, high)
redgreen(n)
greenred(n)
bluered(n)
redblue(n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{Desired number of color elements in the panel.}
  \item{low, mid, high}{Colors to use for the Lowest, middle,
                        and highest values. \code{mid} may be ommited.}
}
\details{
  The values for \code{low, mid, high} can be given as
  color names ('red'), plot color index (2=red), and HTML-style RGB,
  ("\#FF0000"=red). 

  If \code{mid} is supplied, then the returned color panel will consist
  of \code{n - floor(n/2)} HTML-style RGB elements which vary smoothly
  between \code{low} and \code{mid}, then between \code{mid} and
  \code{high}. Note that if \code{n} is even, the color \code{mid} will
  occur twice at the center of the sequence.

  If \code{mid} is omitted, the color panel will vary
  smoothly beween \code{low} and \code{high}. 
}
\value{
  Vector of HTML-style RGB colors.
}
\author{ Gregory R. Warnes \email{greg@warnes.net} }
\seealso{ \code{\link{colors} } }
\examples{

showpanel <- function(col)
{
  image(z=matrix(1:100, ncol=1), col=col, xaxt="n", yaxt="n" )
}

par(mfrow=c(3,3))

# two colors only:
showpanel(colorpanel(8,low="red",high="green"))

# three colors
showpanel(colorpanel(8,"red","black","green"))
# note the duplicatation of black at the center, using an odd
# number of elements resolves this:
showpanel(colorpanel(9,"red","black","green"))

showpanel(greenred(64))
showpanel(redgreen(64))
showpanel(bluered(64))
showpanel(redblue(64))

}
\keyword{color}
