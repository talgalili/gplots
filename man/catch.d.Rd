\name{catch.d}
\alias{catch.d}
\alias{catch.r}
\docType{data}
\title{Catch at Age and Residuals}
\description{
  Catch-at-age observed data and model residuals from Icelandic saithe
  assessment.
}
\usage{
catch.d
catch.r
}
\format{
  Data frame containing three columns:
  \tabular{ll}{
    \code{Year}  \tab year\cr
    \code{Age}   \tab age\cr
    and\cr
    \code{Catch} \tab catch (thousands of individuals)\cr
    or\cr
    \code{Resid} \tab standardized residual
  }
}
\details{
  The data are from Tables 8.2 and 8.6 in the ICES (2015) fish stock
  assessment of Icelandic saithe.
}
\source{
  ICES (2015) Report of the North-Western Working Group (NWWG).
  \emph{ICES CM 2015/ACOM:07}, pp. 240--246.
}
\seealso{
  \code{\link{bubbleplot}} is an effective way to visualize these data.
}
\examples{
catch.t <- xtabs(Catch~Year+Age, catch.d)
catch.m <- as.matrix(as.data.frame(unclass(catch.t)))

# 1  Formula
bubbleplot(Catch~Age+Year, data=catch.d)
# Use rev=TRUE to get same layout as crosstab matrix:
print(catch.m)
bubbleplot(Catch~Age+Year, data=catch.d, rev=TRUE, las=1)

# 2  Data frame
bubbleplot(catch.d)

# 3  Matrix or table
bubbleplot(catch.m)
bubbleplot(catch.t)

# 4  Positive and negative values
bubbleplot(catch.r)
bubbleplot(Resid~Age+Year, catch.r, subset=Age \%in\% 4:9,
           rev=TRUE, xlim=c(3.5,9.5), cex=1.3)
}
