\name{lmplot2}
\alias{lmplot2}
\title{
  Plots to assess the goodness of fit for the linear model objects
}
\description{
   Plots to assess the goodness of fit for the linear model objects
 }
 \usage{
   lmplot2(
            x,
            which = 1:5,
            caption = c("Residuals vs Fitted", "Normal Q-Q plot",
              "Scale-Location plot", "Cook's distance plot"),
            panel = panel.smooth,
            sub.caption = deparse(x$call),
            main = "",
            ask = interactive() && nb.fig < length(which)
            && .Device != "postscript",
            ...,
            id.n = 3,
            labels.id = names(residuals(x)),
            cex.id = 0.75,
            band=TRUE,
            rug=TRUE,
            width=1/10,
            max.n=5000
            )
}
\arguments{
  \item{x}{lm object}
  \item{which}{Numerical values between 1 and 5, indicating which plots
    to be shown. The codes are:
    \describe{
      \item{1}{Fitted vs residuals}
      \item{2}{Normal Q-Q}
      \item{3}{Scale-Location}
      \item{4}{Cook's distance}
      \item{5}{Residuals vs. predictor}
      }
  }
  \item{caption}{ Caption for each type of plot}
  \item{panel}{ function to draw on the existing plot}
  \item{sub.caption}{ SubCaption for the plots }
  \item{main}{Main title of the plot}
  \item{ask}{whether interactive graphics}
  \item{\dots}{ parameters passed to \code{lmplot2}. }
  \item{id.n}{ integer value, less than or equal to residuals of lm object }
  \item{labels.id}{Names of the residuals of the lm object}
  \item{cex.id}{Parameter to control the height of text stringsx}
  \item{band}{logical vector indicating whether bandplot should also be plotted }
  \item{rug}{logical vector indicating whether rug should be added to
    the existing plot }
  \item{width}{Fraction of the data to use for plot smooths}
  \item{max.n}{Maximum number of points to display in plots}
}
\note{
  This function replaces \code{plot.lm2}, which has been deprecated
  to avoid potential problems with S3 method dispatching.
}
\author{Gregory R. Warnes \email{greg@warnes.net} and Nitin
  Jain \email{nitin.jain@pfizer.com}}
\seealso{
  \code{\link[stats]{plot.lm}}
  }
\examples{
ctl <- rnorm(100, 4)
trt <- rnorm(100, 4.5)
group <- gl(2,100,200, labels=c("Ctl","Trt"))
weight <- c(ctl, trt)
wt.err <- rnorm(length(weight), mean=weight, sd=1/2)
x <- lm(weight ~ group + wt.err)

lmplot2(x)

lmplot2(x, which=1,   width=1/3)
lmplot2(x, which=1:3, width=1/3)
}
\keyword{hplot}
