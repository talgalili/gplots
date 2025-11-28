\name{heatmap.2}
\alias{heatmap.2}
\title{ Enhanced Heat Map }
\description{
  A heat map is a false color image (basically
  \code{\link{image}(t(x))}) with a dendrogram added to the left side
  and/or to the top.  Typically, reordering of the rows and columns
  according to some set of values (row or column means) within the
  restrictions imposed by the dendrogram is carried out.

  This heatmap provides a number of extensions to the standard R
  \code{\link[stats]{heatmap}} function.
}
\usage{
heatmap.2 (x,

           # dendrogram control
           Rowv = TRUE,
           Colv=if(symm)"Rowv" else TRUE,
           distfun = dist,
           hclustfun = hclust,
           dendrogram = c("both","row","column","none"),
           reorderfun = function(d, w) reorder(d, w),
           symm = FALSE,

           # data scaling
           scale = c("none","row", "column"),
           na.rm=TRUE,

           # image plot
           revC = identical(Colv, "Rowv"),
           add.expr,

           # mapping data to colors
           breaks,
           symbreaks=any(x < 0, na.rm=TRUE) || scale!="none",

           # colors
           col="heat.colors",

           # block sepration
           colsep,
           rowsep,
           sepcolor="white",
           sepwidth=c(0.05,0.05),

           # cell labeling
           cellnote,
           notecex=1.0,
           notecol="cyan",
           na.color=par("bg"),

           # level trace
           trace=c("column","row","both","none"),
           tracecol="cyan",
           hline=median(breaks),
           vline=median(breaks),
           linecol=tracecol,

           # Row/Column Labeling
           margins = c(5, 5),
           ColSideColors,
           RowSideColors,
           cexRow = 0.2 + 1/log10(nr),
           cexCol = 0.2 + 1/log10(nc),
           labRow = NULL,
           labCol = NULL,
           srtRow = NULL,
           srtCol = NULL,
           adjRow = c(0,NA),
           adjCol = c(NA,0),
           offsetRow = 0.5,
           offsetCol = 0.5,
           colRow = NULL,
           colCol = NULL,

           # color key + density info
           key = TRUE,
           keysize = 1.5,
           density.info=c("histogram","density","none"),
           denscol=tracecol,
           symkey = any(x < 0, na.rm=TRUE) || symbreaks,
           densadj = 0.25,
           key.title = NULL,
           key.xlab = NULL,
           key.ylab = NULL,
           key.xtickfun = NULL,
           key.ytickfun = NULL,
           key.par=list(),

           # plot labels
           main = NULL,
           xlab = NULL,
           ylab = NULL,

           # plot layout
           lmat = NULL,
           lhei = NULL,
           lwid = NULL,

           # extras
           extrafun=NULL,
           ...
           )
           }
\arguments{
  % Dendrogram Control
  \item{x}{numeric matrix of the values to be plotted. }
  \item{Rowv}{determines if and how the \emph{row} dendrogram should be
    reordered.	By default, it is TRUE, which implies dendrogram is
    computed and reordered based on row means. If NULL or FALSE, then no
    dendrogram is computed and no reordering is done. If a
    \code{\link{dendrogram}}, then it is used "as-is", ie
    without any reordering. If a vector of integers, then dendrogram is
    computed and reordered based on the order of the vector.}
  \item{Colv}{determines if and how the \emph{column} dendrogram should
    be reordered.	Has the options as the \code{Rowv} argument above and
    \emph{additionally} when \code{x} is a square matrix,
    \code{Colv="Rowv"} means that columns should be treated identically
    to the rows.}
  \item{distfun}{function used to compute the distance (dissimilarity)
    between both rows and columns.  Defaults to \code{\link{dist}}.}
  \item{hclustfun}{function used to compute the hierarchical clustering
    when \code{Rowv} or \code{Colv} are not dendrograms.  Defaults to
    \code{\link{hclust}}.}
  \item{dendrogram}{character string indicating whether to draw 'none',
    'row', 'column' or 'both' dendrograms.  Defaults to 'both'. However,
    if Rowv (or Colv) is FALSE or NULL and dendrogram is 'both', then a
    warning is issued and Rowv (or Colv) arguments are honoured.}
  \item{reorderfun}{\code{function(d, w)} of dendrogram and weights for
    reordering the row and column dendrograms.  The default uses
    \code{\link{stats}{reorder.dendrogram}} }.
  \item{symm}{logical indicating if \code{x} should be treated
    \bold{symm}etrically; can only be true when \code{x} is a
    square matrix.}
  % data scaling
  \item{scale}{character indicating if the values should be centered and
    scaled in either the row direction or the column direction, or
    none.  The default is \code{"none"}.}
  \item{na.rm}{logical indicating whether \code{NA}'s should be removed.}
  % image plot
  \item{revC}{logical indicating if the column order should be
    \code{\link{rev}}ersed for plotting, such that e.g., for the
    symmetric case, the symmetry axis is as usual.}
  \item{add.expr}{expression that will be evaluated after the call to
    \code{image}.  Can be used to add components to the plot.}
  \item{breaks}{(optional) Either a numeric vector indicating the
    splitting points for binning \code{x} into colors, or a integer
    number of break points to be used, in which case the break points
    will be spaced equally between \code{min(x)} and \code{max(x)}.}
  \item{symbreaks}{Boolean indicating whether breaks should be
    made symmetric about 0. Defaults to \code{TRUE} if the data includes
    negative values, and to \code{FALSE} otherwise.}
  \item{col}{colors used for the image. Defaults to heat colors
    (\code{heat.colors}).}
  % block separation
  \item{colsep, rowsep, sepcolor}{(optional) vector of integers
    indicating which columns or rows should be separated from the
    preceding columns or rows by a narrow space of color
    \code{sepcolor}.}
  \item{sepwidth}{(optional) Vector of length 2 giving the width
    (colsep) or height (rowsep) the separator box drawn by colsep and
    rowsep as a function of the width (colsep) or height (rowsep) of a
    cell. Defaults to \code{c(0.05, 0.05)}}
  % cell labeling
  \item{cellnote}{(optional) matrix of character strings which will be
    placed within each color cell, e.g. p-value symbols.}
  \item{notecex}{(optional) numeric scaling factor for \code{cellnote}
    items.}
  \item{notecol}{(optional) character string specifying the color for
    \code{cellnote} text.  Defaults to "cyan".}
  \item{na.color}{Color to use for missing value (\code{NA}). Defaults
    to the plot background color.}
  % level trace
  \item{trace}{character string indicating whether a solid "trace" line
    should be drawn across 'row's or down 'column's, 'both' or 'none'.
    The distance of the line from the center of each color-cell is
    proportional to the size of the measurement. Defaults to 'column'.}
  \item{tracecol}{character string giving the color for "trace"
    line. Defaults to "cyan".}
  \item{hline, vline, linecol}{Vector of values within cells where a
    horizontal or vertical dotted line should be drawn.  The color of
    the line is controlled by \code{linecol}.  Horizontal  lines are only
    plotted if \code{trace} is 'row' or 'both'.  Vertical lines are only
    drawn if \code{trace} 'column' or 'both'.   \code{hline} and
    \code{vline} default to the median of the breaks, \code{linecol}
    defaults to the value of \code{tracecol}.}
  % Row/Column Labeling
  \item{margins}{numeric vector of length 2 containing the margins
    (see \code{\link{par}(mar= *)}) for column and row names,
    respectively.}
  \item{ColSideColors}{(optional) character vector of length
    \code{ncol(x)} containing the color names for a horizontal side bar
    that may be used to annotate the columns of \code{x}.}
  \item{RowSideColors}{(optional) character vector of length
    \code{nrow(x)} containing the color names for a vertical side bar
    that may be used to annotate the rows of \code{x}.}
  \item{cexRow, cexCol}{positive numbers, used as \code{cex.axis} in
    for the row or column axis labeling.  The defaults currently only
    use number of rows or columns, respectively.}
  \item{labRow, labCol}{character vectors with row and column labels to
    use; these default to \code{rownames(x)} or \code{colnames(x)},
    respectively.}
  \item{srtRow, srtCol}{angle of row/column labels, in degrees from
    horizontal}
  \item{adjRow, adjCol}{2-element vector giving the (left-right,
    top-bottom) justification of row/column labels (relative to the text
    orientation).}
  \item{offsetRow, offsetCol}{Number of character-width spaces to
    place between row/column labels and the edge of the plotting
    region.}
  \item{colRow, colCol}{color of row/column labels, either a scalar to
    set the color of all labels the same, or a vector providing the
    colors of each label item}
  % Color key and density info
  \item{key}{logical indicating whether a color-key should be shown.}
  \item{keysize}{numeric value indicating the size of the key}
  \item{density.info}{character string indicating whether to superimpose
    a 'histogram', a 'density' plot, or no plot ('none') on the
    color-key.}
  \item{denscol}{character string giving the color for the density
    display specified by \code{density.info}, defaults to the same value
    as \code{tracecol}.}
  \item{symkey}{Boolean indicating whether the color key should be
    made symmetric about 0. Defaults to \code{TRUE} if the data includes
    negative values, and to \code{FALSE} otherwise.}
  \item{densadj}{Numeric scaling value for tuning the kernel width when
    a density plot is drawn on the color key.  (See the \code{adjust}
    parameter for the \code{density} function for details.)  Defaults to
    0.25.}
  \item{key.title}{main title of the color key. If set to NA no title
    will be plotted.}
  \item{key.xlab}{x axis label of the color key. If set to NA no label
    will be plotted.}
  \item{key.ylab}{y axis label of the color key. If set to NA no label
    will be plotted.}
  \item{key.xtickfun}{function computing tick location and labels for
    the xaxis of the color key. Returns a named list containing
    parameters that can be passed to \code{axis}. See examples.}
  \item{key.ytickfun}{function computing tick location and labels for
    the y axis of the color key. Returns a named list containing
    parameters that can be passed to \code{axis}.  See examples.}
  \item{key.par}{graphical parameters for the color key. Named list that
    can be passed to \code{par}.}
  % plot labels
  \item{main, xlab, ylab}{main, x- and y-axis titles; defaults to none.}
  % figure layout
  \item{lmat, lhei, lwid}{visual layout: position matrix, column height,
    column width.  See below for details}
  \item{extrafun}{A function to be called after all other work. See
    examples.}
  \item{...}{additional arguments passed on to \code{\link{image}} }
}
\details{
  If either \code{Rowv} or \code{Colv} are dendrograms they are honored
  (and not reordered).	Otherwise, dendrograms are computed as
  \code{dd <- as.dendrogram(hclustfun(distfun(X)))} where \code{X} is
  either \code{x} or \code{t(x)}.\cr

  If either is a vector (of \dQuote{weights}) then the appropriate
  dendrogram is reordered according to the supplied values subject to
  the constraints imposed by the dendrogram, by \code{\link{reorder}(dd,
    Rowv)}, in the row case.
  %%
  If either is missing, as by default, then the ordering of the
  corresponding dendrogram is by the mean value of the rows/columns,
  i.e., in the case of rows, \code{Rowv <- rowMeans(x, na.rm=na.rm)}.
  %%
  If either is \code{\link{NULL}}, \emph{no reordering} will be done for
  the corresponding side.

  If \code{scale="row"} (or \code{scale="col"}) the rows (columns) are
  scaled to have mean zero and standard deviation one.  There is some
  empirical evidence from genomic plotting that this is useful.

  The default colors range from red to white (\code{heat.colors}) and
  are not pretty.  Consider using enhancements such as the
  \pkg{RColorBrewer} package,
  \url{https://cran.r-project.org/package=RColorBrewer}
  to select better colors.

  By default four components will be displayed in the plot.  At the top
  left is the color key, top right is the column dendrogram, bottom left
  is the row dendrogram, bottom right is the image plot.  When
  RowSideColor or ColSideColor are provided, an additional row or column
  is inserted in the appropriate location.   This layout can be
  overriden by specifiying appropriate values for \code{lmat},
  \code{lwid}, and \code{lhei}.  \code{lmat} controls the relative
  postition of each element, while \code{lwid} controls the column
  width, and \code{lhei} controls the row height. See the help page for
  \code{\link[graphics]{layout}} for details on how to use these
  arguments.
}
\note{
  The original rows and columns are reordered to match the dendrograms
  \code{Rowv} and \code{Colv} (if present).

  \code{heatmap.2()} uses \code{\link{layout}} to arragent the plot
  elements. Consequentially, it can \bold{not} be used in a multi
  column/row layout using \code{\link{layout}(\dots)},
  \code{\link{par}(mfrow=\dots)} or \code{(mfcol=\dots)}.
}
\value{
  Invisibly, a list with components
  \item{rowInd}{row index permutation vector as returned by
    \code{\link{order.dendrogram}}.}
  \item{colInd}{column index permutation vector.}
  \item{call}{the matched call}
  \item{rowMeans, rowSDs}{mean and standard deviation of each row: only
    present if \code{scale="row"}}
  \item{colMeans, colSDs}{mean and standard deviation of each column: only
    present if \code{scale="column"}}
  \item{carpet}{reordered and scaled 'x' values used generate the main
    'carpet'}
  \item{rowDendrogram}{row dendrogram, if present}
  \item{colDendrogram}{column dendrogram, if present}
  \item{breaks}{values used for color break points}
  \item{col}{colors used}
  \item{vline}{center-line value used for column trace, present only if
    \code{trace="both"} or \code{trace="column"} }
  \item{hline}{center-line value used for row trace, present only if
    \code{trace="both"} or \code{trace="row"} }
  \item{colorTable}{A three-column data frame providing the lower and upper
    bound and color for each bin}
  \item{layout}{A named list containing the values used for
    \code{lmat}, \code{lhei}, and \code{lwid}. }
}
\author{Andy Liaw, original; R. Gentleman, M. Maechler, W. Huber,
  G. Warnes, revisions.}

\seealso{\code{\link{image}}, \code{\link{hclust}}}

\examples{
 data(mtcars)
 x  <- as.matrix(mtcars)
 rc <- rainbow(nrow(x), start=0, end=.3)
 cc <- rainbow(ncol(x), start=0, end=.3)

 ##
 ## demonstrate the effect of row and column dendrogram options
 ##
 heatmap.2(x)                    ## default - dendrogram plotted and reordering done.
 heatmap.2(x, dendrogram="none") ##  no dendrogram plotted, but reordering done.
 heatmap.2(x, dendrogram="row")  ## row dendrogram plotted and row reordering done.
 heatmap.2(x, dendrogram="col")  ## col dendrogram plotted and col reordering done.

 heatmap.2(x, keysize=2)         ## default - dendrogram plotted and reordering done.

 heatmap.2(x, Rowv=FALSE, dendrogram="both") ## generates a warning!
 heatmap.2(x, Rowv=NULL, dendrogram="both")  ## generates a warning!
 heatmap.2(x, Colv=FALSE, dendrogram="both") ## generates a warning!

 ## Reorder dendrogram by branch means rather than sums
 heatmap.2(x, reorderfun=function(d, w) reorder(d, w, agglo.FUN = mean) )

 ## Color branches of dendrograms by cluster membership using dendextend:
 library(dendextend)  # for color_branches
 full <- heatmap.2(x) # we use it to easily get the dendrograms
 heatmap.2(x, 
          Rowv=color_branches(full$rowDendrogram, k = 3),
          Colv=color_branches(full$colDendrogram, k = 2))
 # Look at the vignette for more details:
 # https://cran.r-project.org/web/packages/dendextend/vignettes/dendextend.html

 ## plot a sub-cluster using the same color coding as for the full heatmap
 full <- heatmap.2(x)
 heatmap.2(x, Colv=full$colDendrogram[[2]], breaks=full$breaks)  # column subset
 heatmap.2(x, Rowv=full$rowDendrogram[[1]], breaks=full$breaks)  # row subset
 heatmap.2(x, Colv=full$colDendrogram[[2]],
              Rowv=full$rowDendrogram[[1]], breaks=full$breaks)  # both

 ## Show effect of row and column label rotation
 heatmap.2(x, srtCol=NULL)
 heatmap.2(x, srtCol=0,   adjCol = c(0.5,1) )
 heatmap.2(x, srtCol=45,  adjCol = c(1,1)   )
 heatmap.2(x, srtCol=135, adjCol = c(1,0)   )
 heatmap.2(x, srtCol=180, adjCol = c(0.5,0) )
 heatmap.2(x, srtCol=225, adjCol = c(0,0)   ) ## not very useful
 heatmap.2(x, srtCol=270, adjCol = c(0,0.5) )
 heatmap.2(x, srtCol=315, adjCol = c(0,1)   )
 heatmap.2(x, srtCol=360, adjCol = c(0.5,1) )

 heatmap.2(x, srtRow=45, adjRow=c(0, 1) )
 heatmap.2(x, srtRow=45, adjRow=c(0, 1), srtCol=45, adjCol=c(1,1) )
 heatmap.2(x, srtRow=45, adjRow=c(0, 1), srtCol=270, adjCol=c(0,0.5) )


 ## Show effect of offsetRow/offsetCol (only works when srtRow/srtCol is
 ## not also present)
 heatmap.2(x, offsetRow=0, offsetCol=0)
 heatmap.2(x, offsetRow=1, offsetCol=1)
 heatmap.2(x, offsetRow=2, offsetCol=2)
 heatmap.2(x, offsetRow=-1, offsetCol=-1)

 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=0, offsetCol=0)
 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=1, offsetCol=1)
 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=2, offsetCol=2)
 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=-1, offsetCol=-1)


 ## Show how to use 'extrafun' to replace the 'key' with a scatterplot
 lmat <- rbind( c(5,3,4), c(2,1,4) )
 lhei <- c(1.5, 4)
 lwid <- c(1.5, 4, 0.75)

 myplot <- function() {
             oldpar <- par("mar")
             par(mar=c(5.1, 4.1, 0.5, 0.5))
             plot(mpg ~ hp, data=x)
           }

 heatmap.2(x, lmat=lmat, lhei=lhei, lwid=lwid, key=FALSE, extrafun=myplot)

 ## show how to customize the color key
 heatmap.2(x,
           key.title=NA, # no title
           key.xlab=NA,  # no xlab
           key.par=list(mgp=c(1.5, 0.5, 0),
                        mar=c(2.5, 2.5, 1, 0)),
           key.xtickfun=function() {
                 breaks <- parent.frame()$breaks
                 return(list(
                      at=parent.frame()$scale01(c(breaks[1],
                                                  breaks[length(breaks)])),
                      labels=c(as.character(breaks[1]),
                               as.character(breaks[length(breaks)]))
                      ))
           })

 heatmap.2(x,
          breaks=256,
          key.title=NA,
          key.xlab=NA,
          key.par=list(mgp=c(1.5, 0.5, 0),
                       mar=c(1, 2.5, 1, 0)),
          key.xtickfun=function() {
               cex <- par("cex")*par("cex.axis")
               side <- 1
               line <- 0
               col <- par("col.axis")
               font <- par("font.axis")
               mtext("low", side=side, at=0, adj=0,
                     line=line, cex=cex, col=col, font=font)
               mtext("high", side=side, at=1, adj=1,
                     line=line, cex=cex, col=col, font=font)
               return(list(labels=FALSE, tick=FALSE))
          })


 ##
 ## Show effect of z-score scaling within columns, blue-red color scale
 ##
 hv <- heatmap.2(x, col=bluered, scale="column", tracecol="#303030")

 ###
 ## Look at the return values
 ###
 names(hv)

 ## Show the mapping of z-score values to color bins
 hv$colorTable

 ## Extract the range associated with white
 hv$colorTable[hv$colorTable[,"color"]=="#FFFFFF",]

 ## Determine the original data values that map to white
 whiteBin <- unlist(hv$colorTable[hv$colorTable[,"color"]=="#FFFFFF",1:2])
 rbind(whiteBin[1] * hv$colSDs + hv$colMeans,
       whiteBin[2] * hv$colSDs + hv$colMeans )
 ##
 ## A more decorative heatmap, with z-score scaling along columns
 ##
 hv <- heatmap.2(x, col=cm.colors(255), scale="column",
	       RowSideColors=rc, ColSideColors=cc, margin=c(5, 10),
	       xlab="specification variables", ylab= "Car Models",
	       main="heatmap(<Mtcars data>, ..., scale=\"column\")",
         tracecol="green", density="density")
 ## Note that the breakpoints are now symmetric about 0

 ## Color the labels to match RowSideColors and ColSideColors
 hv <- heatmap.2(x, col=cm.colors(255), scale="column",
         RowSideColors=rc, ColSideColors=cc, margin=c(5, 10),
	       xlab="specification variables", ylab= "Car Models",
	       main="heatmap(<Mtcars data>, ..., scale=\"column\")",
         tracecol="green", density="density", colRow=rc, colCol=cc,
         srtCol=45, adjCol=c(0.5,1))



%% want example using the `add.exp' argument!

 data(attitude)
 round(Ca <- cor(attitude), 2)
 symnum(Ca) # simple graphic

 # with reorder
 heatmap.2(Ca, 		 symm=TRUE, margin=c(6, 6), trace="none" )

 # without reorder
 heatmap.2(Ca, Rowv=FALSE, symm=TRUE, margin=c(6, 6), trace="none" )

 ## Place the color key below the image plot
 heatmap.2(x, lmat=rbind( c(0, 3), c(2,1), c(0,4) ), lhei=c(1.5, 4, 2 ) )

 ## Place the color key to the top right of the image plot
 heatmap.2(x, lmat=rbind( c(0, 3, 4), c(2,1,0 ) ), lwid=c(1.5, 4, 2 ) )

 ## For variable clustering, rather use distance based on cor():
 data(USJudgeRatings)
 symnum( cU <- cor(USJudgeRatings) )

 hU <- heatmap.2(cU, Rowv=FALSE, symm=TRUE, col=topo.colors(16),
              distfun=function(c) as.dist(1 - c), trace="none")

 ## The Correlation matrix with same reordering:
 hM <- format(round(cU, 2))
 hM

 # now with the correlation matrix on the plot itself

 heatmap.2(cU, Rowv=FALSE, symm=TRUE, col=rev(heat.colors(16)),
             distfun=function(c) as.dist(1 - c), trace="none",
             cellnote=hM)

 ## genechip data examples
 \dontrun{
 library(affy)
 data(SpikeIn)
 pms <- SpikeIn@pm

 # just the data, scaled across rows
 heatmap.2(pms, col=rev(heat.colors(16)), main="SpikeIn@pm",
              xlab="Relative Concentration", ylab="Probeset",
              scale="row")

 # fold change vs "12.50" sample
 data <- pms / pms[, "12.50"]
 data <- ifelse(data>1, data, -1/data)
 heatmap.2(data, breaks=16, col=redgreen, tracecol="blue",
               main="SpikeIn@pm Fold Changes\nrelative to 12.50 sample",
               xlab="Relative Concentration", ylab="Probeset")
 }
 
 ## You can get an interactive version of heatmap.2 using heatmaply:
 \dontrun{
 data(mtcars)
 x  <- as.matrix(mtcars)

 library(heatmaply)
 # just use heatmaply instead of heatmap.2
 heatmaply(x)
 
 # The default are slightly different, but it supports most of the same arguments.
 # If you want the dendrograms to match perfectly, use this:
 ## Color branches of dendrograms by cluster membership using dendextend:
 full <- heatmap.2(x) # we use it to easily get the dendrograms
 heatmaply(x, 
          Rowv=color_branches(full$rowDendrogram, k = 3),
          Colv=color_branches(full$colDendrogram, k = 2))
 # Look at the vignette for more details:
 # https://cran.r-project.org/web/packages/heatmaply/vignettes/heatmaply.html
 }

}
\keyword{hplot}
