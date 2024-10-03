\name{adjust_hsv}
\alias{adjust_hsv}
\title{Adjust Color in HSV Space}
\description{Adjust color hue, saturation, and/or alpha value.}
\usage{
adjust_hsv(col, h=NULL, s=NULL, v=NULL, alpha=NULL)
}
\arguments{
  \item{col}{a color or vector of colors.}
  \item{h}{the desired hue.}
  \item{s}{the desired saturation.}
  \item{v}{the desired value.}
  \item{alpha}{the desired transparency.}
}
\details{
  Colors can be specified as a color name, a hexadecimal string, or an integer.

  Hue, saturation, value, and transparency are specified as values from 0 to 1,
  or \code{NULL} to leave unchanged.
}
\value{Adjusted colors in hexadecimal string format.}
\author{Arni Magnusson.}
\seealso{
  \code{\link{col2rgb}}, \code{\link{rgb2hsv}}, and \code{\link{hsv}} are the
  underlying functions used to convert and adjust the colors.
}
\examples{
col <- "#123456"
col2 <- adjust_hsv(col, h=0.1)
col3 <- adjust_hsv(col, s=0.1)
col4 <- adjust_hsv(col, v=0.7)

barplot(rep(1, 4), col=c(col, col2, col3, col4))
}
