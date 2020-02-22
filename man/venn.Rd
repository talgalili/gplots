\name{venn}
\alias{venn}
\alias{plot.venn}
\title{Plot a Venn diagram}
\description{
  Plot a Venn diagrams for up to 5 sets
}
\usage{
venn(data, universe=NA, small=0.7, showSetLogicLabel=FALSE,
     simplify=FALSE, show.plot=TRUE, intersections=TRUE, names,
     ...)

\method{plot}{venn}(x, y, ..., small=0.7, showSetLogicLabel=FALSE,
     simplify=FALSE)
}
\arguments{
  \item{data,x}{Either a list list containing vectors of names or indices
    of group intersections, or a data frame containing boolean indicators of
    group intersectionship (see below)}
  \item{universe}{Subset of valid name/index elements. Values  ignore values
    in code{data} not in this list will be ignored. Use \code{NA} to
    use all elements of \code{data} (the default).}
  \item{small}{Character scaling of the smallest group counts}
  \item{showSetLogicLabel}{Logical flag indicating whether the internal
    group label should be displayed}
  \item{simplify}{Logical flag indicating whether unobserved groups
    should be omitted.}
  \item{show.plot}{Logical flag indicating whether the plot should be
    displayed.  If false, simply returns the group count matrix.}
  \item{intersections}{Logical flag indicating
    if the returned object should have the attribute
    "individuals.in.intersections" featuring for every set a list of
    individuals that are assigned to it.}
  \item{y}{Ignored}
  \item{...}{Optional graphical parameters.}
  \item{names}{Optional vector of group names.}
}
\details{
  \code{data} should be either a named list of vectors containing
  character string names ("GeneAABBB", "GeneBBBCY", .., "GeneXXZZ") or
  indexes of group intersections (1, 2, .., N), or a data frame containing
  indicator variables (TRUE, FALSE, TRUE, ..) for group intersectionship.
  Group names will be taken from the component list element or column
  names.
}
\value{
  Invisibly returns an object of class "venn", containing:
  \itemize{
    \item A matrix of all possible sets of groups, and the observed count
      of items belonging to each The fist column contains observed
      counts, subsequent columns contain 0-1 indicators of group
      intersectionship.
    \item If \code{intersections=TRUE}, the attribute \code{intersections}
      will be a list of vectors containing the names of the elements
      belonging to each subset.
  }
}
\author{
  Steffen Moeller \email{steffen\_moeller@gmx.de},
  with cleanup and packaging by Gregory R. Warnes
  \email{greg@warnes.net}.}
\examples{

##
## Example using a list of item names belonging to the
## specified group.
##

## construct some fake gene names..
oneName <- function() paste(sample(LETTERS,5,replace=TRUE),collapse="")
geneNames <- replicate(1000, oneName())

##
GroupA <- sample(geneNames, 400, replace=FALSE)
GroupB <- sample(geneNames, 750, replace=FALSE)
GroupC <- sample(geneNames, 250, replace=FALSE)
GroupD <- sample(geneNames, 300, replace=FALSE)
input  <-list(GroupA,GroupB,GroupC,GroupD)
input

tmp <- venn(input)
attr(tmp, "intersections")

##
## Example using a list of item indexes belonging to the
## specified group.
##
GroupA.i <- which(geneNames \%in\% GroupA)
GroupB.i <- which(geneNames \%in\% GroupB)
GroupC.i <- which(geneNames \%in\% GroupC)
GroupD.i <- which(geneNames \%in\% GroupD)
input.i  <-list(A=GroupA.i,B=GroupB.i,C=GroupC.i,D=GroupD.i)
input.i

venn(input.i)

##
## Example using a data frame of indicator ('f'lag) columns
##
GroupA.f <- geneNames \%in\% GroupA
GroupB.f <- geneNames \%in\% GroupB
GroupC.f <- geneNames \%in\% GroupC
GroupD.f <- geneNames \%in\% GroupD
input.df <- data.frame(A=GroupA.f,B=GroupB.f,C=GroupC.f,D=GroupD.f)
head(input.df)
venn(input.df)

## smaller set to create empty groupings
small <- input.df[1:20,]

venn(small, simplify=FALSE) # with empty groupings
venn(small, simplify=TRUE)  # without empty groupings

## Capture group counts, but don't plot
tmp <- venn(input, show.plot=FALSE)
tmp

## Show internal binary group labels
venn(input, showSetLogicLabel=TRUE)

## Limit  universe
tmp <- venn(input, universe=geneNames[1:100])
tmp

##
## Example to determine which elements are in A and B but not in
## C and D using the 'intersections' attribute.
##
tmp <- venn(input, intersection=TRUE)
isect <- attr(tmp, "intersection")

# Look at all of the subsets
str(isect)

# Extract and combine the subsets of interest..
AandB <- unique(c(isect$A, isect$B, isect$'A:B'))

# and look at the results
str(AandB)

##
## The full set of elements of each intersection is provided in the
## "interesections" attribute.
##
a<-venn(list(1:5,3:8), show.plot=FALSE)
intersections<-attr(a,"intersections")
print(intersections)
# $A
# [1] "1" "2"
#
# $B
# [1] "6" "7" "8"
#
# $`A:B`
# [1] "3" "4" "5"
}
\keyword{hplot}
