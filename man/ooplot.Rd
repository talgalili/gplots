\name{ooplot.default}
\alias{ooplot.default}
\alias{ooplot}
\title{Create an OpenOffice style plot}
\description{
  An extension of barplot2. Creates bar- and line-plots mimicking the
  style of OpenOffice plots.  This utility can plot the values next to
  each point or bar as well as confidence intervals.
}
\usage{
ooplot(data, ...)
\method{ooplot}{default}(data, width=1, space=NULL, names.arg=NULL, 
                           legend.text=NULL, horiz=FALSE, 
                           density=NULL, angle=45, kmg="fpnumkMGTP", 
                           kmglim=TRUE, 
                           type=c("xyplot", "linear", "barplot", "stackbar"), 
                           col=heat.colors(NC), prcol=NULL, 
                           border=par("fg"), main=NULL, sub=NULL, 
                           xlab=NULL, ylab=NULL, xlim=NULL, ylim=NULL, 
                           xpd=TRUE, log="", axes=TRUE, 
                           axisnames=TRUE, prval=TRUE, lm=FALSE,
                           cex.axis=par("cex.axis"), 
                           cex.names=par("cex.axis"),
                           cex.values=par("cex"),inside=TRUE, 
                           plot=TRUE, axis.lty=0, plot.ci=FALSE, 
                           ci.l=NULL, ci.u=NULL, ci.color="black", 
                           ci.lty="solid", ci.lwd=1, plot.grid=FALSE, 
                           grid.inc=NULL, grid.lty="dotted", 
                           grid.lwd=1, grid.col="black", add=FALSE, 
                           by.row=FALSE, ...)
}
\arguments{
  \item{data}{a matrix of values describing the values that make up the
    plot. The first column of \code{data} is taken as the axis against
    which all the other values are plotted. The first column of
    \code{data} may not be sparse.}
  \item{width}{optional vector of barwidths. Re-cycled to the number of
    bars drawn. A single value will have no visible effect. }
  \item{space}{ the amount of space left before each bar. May be given
    as a single number or one number per bar. If \code{type} is
    \code{stackbar}, \code{space} may be specified by two numbers, where
  the first is the space between bars in the same group, and the second
  the space between groups. Defaults to \code{c(0,1)} if \code{type} is
  a \code{stackbar}, and to 0.2 otherwise. }
  \item{names.arg}{a vector of names to be plotted below each bar or
    group of bars.  If this argument is omitted, then the names are
    taken from the  row names of \code{data}. }
  \item{legend.text}{a vector of text used to construct a legend for the
    plot, or a logical indicating whether a legend should be included;
    if \code{legend.text} is true, the row names of \code{data} will
    be used as labels if they are non-null.}
  \item{horiz}{a logical value.  If \code{FALSE}, the bars are drawn
    vertically with the first bar to the left.  If \code{TRUE}, the
    bars are drawn horizontally with the first at the bottom.}
  \item{density}{a vector giving the the density of shading lines, in
    lines per inch, for the bars or bar components.
    The default value of \code{NULL} means that no shading lines
    are drawn. Non-positive values of \code{density} also inhibit the
    drawing of shading lines.}
  \item{angle}{the slope of shading lines, given as an angle in
    degrees (counter-clockwise), for the bars or bar components.}
  \item{kmg}{the set of SI units to convert, defaults to
    "fpnumkMGTP". See below for details. }
  \item{kmglim}{logical. If \code{FALSE} the conversion to SI units is not
    performed. Default is \code{TRUE}.
  }
  \item{type}{a string indicating the preferred format of the plot,
    choices are:
    xyplot : plot where y is plotted against the x-value.
    linear : plot where y values are plotted against equidistant x-values.
    barplot : plot where y values are represented as bars against
    equidistant x-values.
    stackplot : plot where y values are stacked for identical x-values
    and bars are equidistant.
  }
  \item{col}{a vector of colors for the bars or bar components.}
  \item{prcol}{the color to be used for the plot region.}
  \item{border}{the color to be used for the border of the bars.}
  \item{main, sub}{overall and sub titles for the plot.}
  \item{xlab}{a label for the x axis.}
  \item{ylab}{a label for the y axis.}
  \item{xlim}{limits for the x axis.}
  \item{ylim}{limits for the y axis.}
 \item{xpd}{logical. Should bars be allowed to go outside region?}
  \item{log}{a character string which contains `"x"' if the x axis is
    to be logarithmic, `"y"' if the y axis is to be logarithmic and
    `"xy"' or `"yx"' if both axes are to be logarithmic.}
  \item{axes}{logical.  If \code{TRUE}, a vertical (or horizontal, if
    \code{horiz} is true) axis is drawn.}
  \item{axisnames}{logical.  If \code{TRUE}, and if there are
    \code{names.arg} (see above), the
    other axis is drawn (with \code{lty=0}) and labeled.}
  \item{prval}{logical. If \code{TRUE}, then values are plotted above
    all points and bars.
    }
  \item{lm}{logical. If \code{TRUE}, the linear fit is plotted.
    }
  \item{cex.axis, cex.names, cex.values}{character scaling factor for
    numeric axis labels,
    names, and displayed values, respectively.}
  \item{inside}{logical.  If \code{TRUE}, the lines which divide
    adjacent (non-stacked!) bars will be drawn.  Only applies when
    \code{space = 0} (which it partly is when \code{beside = TRUE}).}
  \item{plot}{logical.  If \code{FALSE}, nothing is plotted.}
  \item{axis.lty}{the graphics parameter \code{lty} applied to the axis
    and tick marks of the categorical (default horzontal) axis.  Note
    that by default the axis is suppressed.}
  \item{plot.ci}{logical. If \code{TRUE}, confidence intervals are plotted
   over the bars. Note that if a stacked bar plot is generated, confidence
   intervals will not be plotted even if \code{plot.ci = TRUE}}
  \item{ci.l,ci.u}{The confidence intervals (ci.l = lower bound, ci.u =
   upper bound) to be plotted if \code{plot.ci} = \code{TRUE}. Values must have
   the same dim structure as \code{height}.}
  \item{ci.color}{the color for the confidence interval line segments}
  \item{ci.lty}{the line type for the confidence interval line segments}
  \item{ci.lwd}{the line width for the confidence interval line segments}
  \item{plot.grid}{if \code{TRUE} a lined grid will be plotted behind the bars}
  \item{grid.inc}{the number of grid increments to be plotted}
  \item{grid.lty}{the line type for the grid}
  \item{grid.lwd}{the line width for the grid}
  \item{grid.col}{the line color for the grid}
  \item{add}{logical, if \code{TRUE} add barplot to current plot.}
  \item{by.row}{Logical value.  If \code{TRUE} the data matrix is
    organized with variables along rows rather than down colums.}
  \item{\dots}{further graphical parameters (\code{\link{par}}) are
    passed to \code{\link{plot.window}()}, \code{\link{title}()} and
    \code{\link{axis}}.}
}
\details{
  Plot units are automatically scaled to SI units based on the
  maximum value present, according to the set of units specified by
  characters in the \code{kmg} parameter.  These letters are interpreted
  as
  \describe{
    \item{P}{peta = 1E15}
    \item{T}{tera = 1E12}
    \item{G}{giga = 1E09}
    \item{M}{mega = 1E06}
    \item{k}{kilo = 1E03}
    \item{m}{milli= 1E-03}
    \item{u}{micro= 1E-06}
    \item{n}{nano = 1E-09}
    \item{p}{pico = 1E-12}
    \item{f}{femto= 1E-15}
  }
  with the default being "fpnumkMGTP" (all of these units).  For
  example, if the largest value plotted is 1243000, it would be
  presented as 1.234M.
  
}
\value{
   A numeric vector (or matrix, when \code{beside = TRUE}), say
  \code{mp}, giving the coordinates of \emph{all} the bar midpoints
  drawn, useful for adding to the graph.

  If \code{beside} is true, use \code{colMeans(mp)} for the
  midpoints of each \emph{group} of bars, see example.
}
\author{Lodewijk Bonebakker \email{bonebakker@comcast.net} with modifications
  by Gregory R. Warnes \email{greg@warnes.net}.
  Based on barplot2().
  }
\seealso{ \code{\link{plot}}, \code{\link{boxplot}} }
\examples{
     data(VADeaths, package = "datasets")

     VADeaths <- cbind( Age=c(50,55,60,65,70), VADeaths)

     mp <- ooplot(VADeaths) # default
     mp <- ooplot(VADeaths, type="xyplot")  # same as default
     mp <- ooplot(VADeaths, type="linear")  # linear scale
     mp <- ooplot(VADeaths, type="linear", log="y") # log scale on y axis
     mp <- ooplot(VADeaths, type="barplot") # barplot
     mp <- ooplot(VADeaths, type="stackbar") # stacked


     tot <- colMeans(VADeaths[,-1])
     ooplot(VADeaths, 
             col = c("lightblue", "mistyrose", "lightcyan", "lavender"),
             legend = colnames(VADeaths)[-1], ylim = c(0, 100),
             type="barplot", cex.values=0.75)
     title(main = "Death Rates in Virginia", font.main = 4)


     ##
     ## Capability demo
     ##
     ## examples for the ooplot routine
     ##
     ## create some test data
     test1 <- data.frame(x=c(0,1,2,3,4), lin=c(0,1,2,3,4))
     test2 <- data.frame(x=c(0,1,2,3,4), par=c(0,1,4,9,16))
     test3 <- data.frame(x=c(-2,-1,0,1,2),y2=c(4,1,0,1,4))
     ## single line test example
     test1f <- test1
     ## two column example
     test2f <- merge(test1,test2,by.x="x",all=TRUE,sort=TRUE)
     ## three column example
     test3f <- merge(test2f,test3,by.x="x",all=TRUE,sort=TRUE)
     ## subset, single row, example
     test5r <- test3f[5,]  
     
     ##
     ## xyplot, linear, barplot, stackbar
     dev.off()
     mat <- matrix(c(1:16),4,4,byrow=TRUE)
     layout(mat)
     
     ooplot(test1f,type="barplot",col=c("red"))
     title(main="barplot")
     ooplot(test2f,type="barplot",col=c("red","blue"))
     ooplot(test3f,type="barplot",col=c("red","blue","green"))
     ooplot(test5r,type="barplot",col=c("red","blue","green"))
     
     ooplot(test1f,type="xyplot",col=c("red"))
     title(main="xyplot")
     ooplot(test2f,type="xyplot",col=c("red","blue"))
     ooplot(test3f,type="xyplot",col=c("red","blue","green"))
     ooplot(test5r,type="xyplot",col=c("red","blue","green"))
     
     ooplot(test1f,type="linear",col=c("red"))
     title(main="linear")
     ooplot(test2f,type="linear",col=c("red","blue"))
     ooplot(test3f,type="linear",col=c("red","blue","green"))
     ooplot(test5r,type="linear",col=c("red","blue","green"))
     
     ooplot(test1f,type="stackbar",col=c("red"))
     title(main="stackbar")
     ooplot(test2f,type="stackbar",col=c("red","blue"))
     ooplot(test3f,type="stackbar",col=c("red","blue","green"))
     ooplot(test5r,type="stackbar",col=c("red","blue","green"))

     # restore default layout (1 plot/page)
     layout(1)
}
\keyword{hplot}

