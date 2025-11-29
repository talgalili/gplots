# $Id: boxplot2.R 2052 2015-06-02 19:03:20Z warnes $

boxplot2  <- function( ..., top=FALSE, shrink=1.0, textcolor=NULL )
  {
    boxcall <- match.call()           # get call
    boxcall$top  <- boxcall$shrink  <- boxcall$textcolor  <- NULL
    boxcall[[1]]  <- as.name("boxplot")

    box <- eval(boxcall, parent.frame())
    mids <- 1:length(box$n)

    if(top)
      {
        where  <- par("usr")[4]
        adj  <- c(0.5,1)
      }
    else
      {
        where  <- par("usr")[3]
        adj  <- c(0.5,0)
      }
    tcex <- par("cex")
    par(cex=shrink*tcex)

    text(x=mids, y=where, labels=paste("n=",box$n,sep=""), adj=adj,
         col=textcolor)

    par(cex=tcex)

    invisible(box)
  }

