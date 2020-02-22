\name{rtPCR}
\alias{rtPCR}
\docType{data}
\title{Teratogenesis rtPCR data}
\description{
  rtPCR data for experiments investigating a variety of markers for
  characterizing teratogenicity.
}
\usage{data(rtPCR)}
\format{
  A data frame with 1672 observations on the following 21 variables.
  \describe{
    \item{PlateID}{a factor with levels \code{A0027002} through
      \code{A0054019}}
    \item{Test.Substance}{a factor with levels \code{Compound A} through
      \code{Compound H}}
    \item{Teratogenicity.in.vivo}{a factor with levels \code{Non}
      \code{Strong} \code{Weak / Moderate}}
    \item{Sample}{a factor with levels \code{Sample 1} - \code{Sample 152}}
    \item{Rep..}{a factor with levels \code{Rep 1} - \code{Rep 21}}
    \item{Label}{a factor with levels \code{Ctrl}, \code{Neg. Ctrl}
      \code{P1} - \code{P9}, \code{No Vehicle Ctrl}, and \code{Pos. Ctrl}}
    \item{Conc..ug.ml.}{a numeric vector}
    \item{Detector}{a factor with levels \code{ProbeType 1} -
      \code{ProbeType 17}}
    \item{Avg.delta.Ct}{a numeric vector}
    \item{delta.Ct.SD}{a numeric vector}
    \item{delta.delta.Ct}{a numeric vector}
    \item{RQ}{a numeric vector}
    \item{X..RQ}{a numeric vector}
    \item{X100..Custom..}{a numeric vector}
    \item{X100...Custom..}{a numeric vector}
    \item{Custom..}{a numeric vector}
    \item{Custom...1}{a numeric vector}
    \item{RQ.Min}{a numeric vector}
    \item{RQ.Max}{a numeric vector}
    \item{Threshold}{a numeric vector}
  }
}
\details{
  TBA
}
\source{
  Anonymized data.
}
\examples{
data(rtPCR)

# same scale
overplot( RQ ~ Conc..ug.ml. | Test.Substance,
         data=rtPCR,
         subset=Detector=="ProbeType 7" & Conc..ug.ml. > 0,
         same.scale=TRUE,
         log="xy",
         f=3/4,
         main="Detector=ProbeType 7",
         xlab="Concentration (ug/ml)",
         ylab="Relative Gene Quantification"
         )

# different scales, but force lower limit to 0.01 
overplot( RQ ~ Conc..ug.ml. | Test.Substance,
         data=rtPCR,
         subset=Detector=="ProbeType 7" & Conc..ug.ml. > 0,
         log="xy",
         f=3/4,
         main="Detector=ProbeType 7",
         xlab="Concentration (ug/ml)",
         ylab="Relative Gene Quantification",
         min.y=0.01
         )
}
\keyword{datasets}
