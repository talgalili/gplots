\name{qqnorm.aov}
\alias{qqnorm.aov}

\title{ Makes a half or full normal plot for the effects from an aov model }
\description{
  Makes a half or full normal plot for the effects from a model
  inheriting from
  class \code{aov}. One can interactively label the points in the plot.
}
\usage{
\method{qqnorm}{aov}(y, full=FALSE, label=FALSE, omit=NULL,
           xlab=paste(if (full) "" else "Half", " Normal plot"), 
           ylab="Effects", ...)
}

\arguments{
  \item{y}{A model object inheriting from \code{aov}}
   \item{full}{Full or half normal plot (half is default) }
   \item{label}{If \code{TRUE}, function allows interactive
     labelling of points in plot, using the mouse }
   \item{omit}{Numeric or character vector of effects to omit,
     the intercept is always omitted}
   \item{xlab}{Horizontal axix label }
   \item{ylab}{Vertical axis label }
   \item{\dots}{Further arguments to be given to the plot function }
}
\details{
   Produces a (half) normal plot of the effects from an AOV model. The
   idea behind the plot is that most effects will be small or null, and
   this effects can be used as a basis for estimation of the
   experimental variance. This small effects will show up in the plot as
   a straight line, other effects can be judged against this as a
   background. Heavily used by Box, Hunter \& Hunter, which attributes
   the idea to Daniel.

   This is a simpler implementation than the one in S-Plus.
}
\value{
  If \code{label=TRUE}, the vector of points identified, else nothing of
   interest.
}

\references{
   Box, Hunter and Hunter: Statistics for Experimenters. An Introduction
   to Design, Data Analysis and Model Building. Wiley. \cr
   Daniel, C (1976): Applications of Statistics to Industrial
   Experimentation. Wiley. \cr
   Daniel, C (1959): Use of half-normal plot in interpreting factorial
   two-level experiments. \emph{Technometrics.}\bold{1}, 149.
}

\author{Kjetil Halvorsen \email{kjetil@entelnet.bo}}

\examples{
library(MASS)
data(npk)
npk.aov <- aov(yield ~ block + N*P*K, npk)
qqnorm(npk.aov)

## interactive labeling of points.  Click mouse on points to show label.
if (dev.interactive()) qqnorm(npk.aov, omit=2:6, label=TRUE)
}
\keyword{ hplot }%
\keyword{ design }

