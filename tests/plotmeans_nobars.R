## Test that plotmeans works properly when bars=F
## Bug repoted by Alan Yong, Research Geophysicist,
## US DEPARTMENT OF THE INTERIOR

suppressMessages(library(gplots))
data(state)
plotmeans(state.area ~ state.region, bars=FALSE)
