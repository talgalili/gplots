\name{gplots-defunct}
\alias{boxplot.n}
\alias{plot.lm2}
\alias{smartlegend}
\title{Defunct functions}
\description{
  These functions are defunct and have been removed from the gplots package.
}
\usage{
   boxplot.n(..., top=FALSE, shrink=1, textcolor=NULL)
   plot.lm2(
            x,
            which = 1:5,
            caption = c("Residuals vs Fitted", "Normal Q-Q plot",
              "Scale-Location plot", "Cook's distance plot"),
            panel = panel.smooth,
            sub.caption = deparse(x$call),
            main = "",
            ask,
            ...,
            id.n = 3,
            labels.id = names(residuals(x)),
            cex.id = 0.75,
            band=TRUE,
            rug=TRUE,
            width=1/10,
            max.n=5000
            )
  smartlegend(x = c("left", "center", "right"),
             y = c("top", "center", "bottom"),
             ...,
             inset = 0.05)
}
\arguments{
  \item{ask,
        band,
        caption,
        cex.id,
        id.n,
        inset,
        labels.id,
        main,
        max.n,
        panel,
        rug,
        shrink,
        sub.caption,
        textcolor,
        top,
        which,
        width,
        x,
        y,
        \dots}{see man page for the corresponding replacement function}
}
\details{
These functions are no longer available.  Please refer to the manual page
for the replacement function:
  \itemize{
    \item \code{boxplot.n} has been replaced by \code{\link{boxplot2}}
    \item \code{plot.lm2} has been replaced by \code{\link{lmplot2}}
    \item \code{smartlegend} is no longer needed because relative
    positioning has been implemented in \code{\link[graphics]{legend}}.
  }
}
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{
  \code{\link{boxplot2}},
  \code{\link{lmplot2}},
  \code{\link[graphics]{legend}},
  \code{\link[base]{Defunct}}
}
\keyword{misc}
