Development - YYYY-MM-DD
==========================
## New Features:

## Bug Fixes:


gplots 3.2.0 - 2024-10-05
==========================
## New Features:

* New function bubbleplot() draws a scatterplot with varying symbol sizes and
  colors. Provides an alternative to balloonplot().

* New example dataset catch.d containing catch at age for the 2015 Icelandic
  saithe fish stock assessment, and catch.r containing model residuals.

* New function adjust_hsv() to adjust colors in HSV space.

## Bug Fixes:

- Improved heatmap.2() so the 'revC' argument correctly flips the RowSideColors
  and row labels. Code contributed by Jarkko Toivonen.

- Removed escaped LaTeX specials in Rd files (barplot2, colorpanel, qqnorm.aov,
  venn) that were raising R CMD check NOTEs.

- Removed invalid URLs from README.md identified by R CMD check --as-cran.

gplots 3.1.3 - 2022-04-24
==========================
## Bug Fixes:
- Fix warning:

checking Rd files ... [1s/2s] WARNING
checkRd: (7) barplot2.Rd:219: invalid email address: marc\_schwartz@comcast.net
checkRd: (7) venn.Rd:59: invalid email address: steffen\_moeller@gmx.de

- Fix note:

checking Rd cross-references ... NOTE
Undeclared package ‘r2d2’ in Rd xrefs

- Fix note:

Found if() conditions comparing class() to string:
File 'gplots/R/heatmap.2.R': if (class(col) == "function") ...
Use inherits() (or maybe is()) instead.

gplots 3.1.2 - 2021-01-09
==========================
## Bug Fixes:
- heatmap.2: Also use key.title in cases without density #4




gplots 3.1.1 - 2020-11-28
==========================
## Bug Fixes:
- Fix "Error in plot.window(...) : need finite 'ylim' values" in "Running examples in 'gplots-Ex.R' failed"




gplots 3.1.0 - 2020-09-18
==========================
## Major change:
- Removed gdata from imports by bringing into the package the functions nobs and reorder.factor.
  - Removed the gdata package from "imports" since it is currently broken and is scheduled to archive in 2020-09-25 (leading to gplots to be archived as well, unless this is resolved). By removing this connection, gplots will be able to remain safely on CRAN. In prectice, I've moved reorder.factor and nobs into this package, as well as removed the use of 'nobs' from some examples.
  - Added the reorder.factor and nobs function (from gdata)


gplots 3.0.4 - 2020-07-05
==========================
## Bug Fixes:
- Fix "no visible global function definition for '%||%'": The package imports .memberDend and .midDend from stats in an unsafe way (i.e. using :::). I've moved to manually copy-pasting the functions into the package in order to keep it a bit safer. It has the downside of not using whartever improvements/bugfixes are intrudced to these functions moving forward. But for the time being, it's a reasonable solution.

gplots 3.0.3 - 2020-02-26
==========================

## Misc
- Tal Galili took over to make sure the package stays on CRAN.
- Moved to knitr

gplots 3.0.1 - 2016-03-30
==========================

## Bug Fixes:

- An error in plotLowess() prevented it from finding objects in
	the caller's environment.

- The manual page for heatmap.2() stated the incorrect type for
  the 'layout' element of the return list.  It is a named list,
  not a named numeric vector.


gplots 3.0.0 - 2016-03-28
==========================-

## New Features:

- venn():
    - now support matrices of indicator values. Previously indicator
      values were only supported when supplied as a dataframe.
    - The 'intersections' attribute returned from venn() has been
      improved so that goups are labeled using set names instead
      of indicators, and are ordered from simplest to most complex
      set intersection.

- New angleAxis() function to create axis labels with rotated text.

- heatmap.2():
    - heatmap.2() can now be used to plot subsets of a previous
      heatmap.
    - Decrease the granularity of the carpet in heatmap.2()'s
      color key to avoid visual artifacts.
    - Returned object now includes 'layout' element that contains
      layout information. (Patch provided by Jenny Drnevich.)

- lowess():
    - New function plotLowess() to display a scatter plot with a
      superimposed lowess curve.
    - The lowess() functions now returns a list object of class
      'lowess'
    - A new lowess method for plot() method for 'lowess' objects
      that generates a scatterplot of the raw data with a lowess
      curve superimposed.

## Bug Fixes:

- Defunct message for boxplot.n() was recommending the wrong
  function.

- heatmap.2():
  - Remove debugging print() statement.
  - Now properly sets 'srtCol' default if missing and 'colCol' is
    specified.
  - Corrected a bug causing "Error in plot.new() : figure margins
    too large" to occur when 'key=FALSE'.  (Reported and patch
    provided by Sveinung Gundersen.)
  - Corrected a bug causing an error when "Rowv=FALSE" or "Colv=FALSE".
  - Corrected message when "Rowv=FALSE" or "Colv=FALSE" and the the
    "dendrogram" argument requested the corresponding dendrogram.

- venn():
  - Fix warning message that was missing spaces between words.

## Other Changes:

- The smartlegend(), plot.lm2(), and boxplot.n() functions are now
  defunct. Please use grephics::legend(), lmplot2() or boxplot2()
  respectively.


gplots 2.17.0 - 2015-05-01
==========================-

## New Features:

- heatmap.2() has two new arguments, 'colRow' and 'colCol' to control
  the color of row and column text labels. See the man page for
  examples.

- heatmap.2() has been modified to make it easier to extract and plot
  subclusters from a large heatmap. Simply pass the dendrogram of the
  subcluster together with the full data matrix and, optionally, the
  breaks of the full heatmap in order to obtain the same color
  scaling. (Suggestion and patch contributed by Ilia Kats.)

- venn() now returns a list of the members of each set intersection in
  the attribute 'intersections'.  This can be disabled using the
  argument 'intersection=FALSE' (Patch by Steffen Möller.)

## Bug Fixes:

- In heatmap.2(), the color key now properly handles color breaks that
  are not equally spaced. (Issue reported by Tim Richter-Heitmann.)

- In heatmap.2(), row/column traces in could be plotted on the wrong
  row/column.

- plotCI() now properly respects the 'type=' argument.  (Bug report
  and correction by Wiktor Żelazny.)

- Remove stray browser() call from overplot()

- In the balloonplot() examples, explicitly specify the 'neworder'
  argument to gplots:::reorder.factor to prevent errors.

## Other Changes:

- smartlegend() is now deprecated because the relative positioning
  feature ('top', 'right') has been added to graphics::legend().
  Calling smartlegend() will generate a warning.

- boxplot.n() and plot.lm2() are defunct have been removed.  Use of
  these functions will now generate an error.

- Update out-of-date URLs in man pages.

gplots 2.16.0 - 2015-01-02
==========================-

## New Features:

- plotmeans() has a new argument, 'text.n.label' which specifies the
  text used for labeling the number of elements in a group.

## Bug Fixes:

- plotmeans() now respects (optional) graphical arguments captured in
  '...' when drawing the x axis.


gplots 2.15.0 - 2014-12-01
==========================-

## New Features:

- Convert bandplot() to S3-method dispatch and add method for class
  formula, so that 'bandplot( y ~ x, data=dataframe )' now works as
  expected.

## Other Changes:

- heatmap.2() now uses a local *non-byte-compiled* copy of
  plot.dengrogram, because the byte-compiled stats:::plot.dendrogram
  uses a recursive algorithm that generates a 'node stack overflow'
  error for deeply nested dendrograms and the node stack size cannot
  be changed at execution time.  Instead, tne local non-byte-compiled
  gplots:::plot.dendrogram will trigger a recursion limit for such
  dengrograms.  heatmap.2() will detect this error and recommend that
  the user increase the recursion limit (via,
  e.g. 'options("expressions"=20000)' ) and rerun.

gplots 2.14.2 - 2014-09-17
==========================-

## Bug Fixes:

- heatmap.2() was not respecting key.title=NA when density.info="none".

- Correct the man page for heatmap.2 to state that the default color
  for 'notecol' is cyan.

- In heatmap.2(), modify default arguments to 'symbreaks' and 'symkey'
  to make the logic more evident by replacing min(...) with
  any(...). (The previous code executed properly, but relied on
  implicit coercion of logicals to numeric, obscuring the intent.)

- Calling heatmap.2 with deeply nested dendrograms could trigger a
  'node stack overflow' error.  Now, this situation is deteceted, and
  a message is generated indicating how to increase the relevant
  recursion limit via options("expressions"=...).

gplots 2.14.1 - 2014-06-30
==========================-

## Bug Fixes:

- Correct heatmap.2() bug in Colv dendrogram object dimension checking introduced
  in 2.14.0.  (Reported by Yong Fuga Li.)


gplots 2.14.0 - 2014-06-18
==========================-

## Bug Fixes:

- heatmap.2(): Fix typo in heatmap.2() that caused an error when
  'Rowv=FALSE'. (Reported by Yuanhua Liu.)

## Enhancements:

- heatmap.2(): Add new 'reorderfun' argument to allow the user to
  specify an alternative function to reorder rows/columns based on
  row/column dendrogram. (Suggested by Yuanhua Liu.)

- heatmap.2(): Center margin labels.

- heatmap.2(): Check size of user-provided Rowv and Colv dendrogram
  objects to ensure they match the dimensions of the data.

- Add references to man page for hist2d() and ci2d() to the new r2d2
  package which implements an improved algorithm for 2-dimensional
  emprical confidence regions.


gplots 2.13.0 - 2014-04-04
==========================-

## Bug Fixes:

- heatmap.2 was not properly handling row trace reference line ('hline').
  Patch submitted by Ilia Kats.

## Enhancements:

- In heatmap.2, when the row or column trace is enabled, show the
  corresponding reference line in the color key.

- In heatmap.2, a new 'extrafun' argument is provided that allows the
  user to specify a function to be called before the function returns.
  This allows the user to add additional plots to the page.


gplots 2.12.1 - 2013-10-14
==========================-

## API Changes:

- boxplot.n() has been renamed to boxplot2() to avoid potential S3
  method calling issues.

- plot.lm2() has been rename to lmplot2() to avoid potential S3 method
  calling issues.

## Enhancements:

- Add heatmap.2() parameters to control row and column label rotation
  ('srtRow', 'srtCol'), justification ('adjRow', 'adjCol'), and space
  from plot edge ('offsetRow', 'offsetCol').

## Bug Fixes:

- Fix error in in venn() when all groups contained the same number of TRUE cases.

- Correct error in overplot() when that occured when a group-category contained no
  finite values.

## Other Changes:

- Changes to overplot() to avoid warnings from upcoming enhancements to R CMD check.

- Move several packages from Depends to Imports or Suggests.

- Packages caTools and KernSmooth now have namespaces, so import
  needed functions in NAMESPACE.

- Mark one example in manual page for ci2d 'dontrun' to avoid timing
  warning in R CMD check.


gplots 2.11.3 - 2013-06-27
==========================-

## Enhancements:

- Modify sinkplot() to use a local environment rather than the global
  environment, to conform to CRAN policies.

## Bug Fixes:

- Fixed typo/spelling error in plotmeans() man page.


gplots 2.11.2 - 2013-03-24
==========================-

## Enhancements:

- Add ci.width argument to barplot2() to allow varying the length of
  the 't' at the end of confidence interval bars.

## Bug Fixes:

- Fix error in heatmap.2 when colsep argument had length 1.

## Updates:

- Update manual page for lowess.default() to
  match changed argument list for lowess() in R 3.0.0


gplots 2.11.1 - 2012-12-14
==========================-

## Bug Fixes:

- Replace corrupted BalloonPlot.pdf in inst/doc.


gplots 2.11.0 - 2012-06-08
==========================-

## New Features:

- Objects returned by hist2d() have been changed:
  1) $x and $y now contain the n midpoints of the bins in each direction
  2) $x.breaks, $y.breaks now contain the n+1 limits of the bins in
  each direction.

- Add lwd argument to plotmeans().

## Bug Fixes:

- Correct error in handling binning in hist2d(): (N+1)x(N+1) bins were
   being created instead of NxN bins, and the highest row/column in
   each direction was being omitted from the results and plot.

- Changes to fix R CMD check warnings


gplots 2.10.1 - 2011-09-02
==========================-

## New Features:

- Make results of hist2d() and ci2d() into objects, and add print()
  methods to display them.

gplots 2.10.0 - 2011-08-26
==========================-

## New Features:

- New ci2d() function to create 2-dimensional empirical confidence
  intervals utilizing KernSmooth:bkde2D and gplots::hist2d().
  See ?ci2d for details.

- Add 'alpha' argument to rich.colors() to control transparency.

## Improvements:

- Accellerate hist2d by replacing for() loop with tapply(), and allow
  user to specify summary function applied (per suggestion by Peter
  Hagedorn).

## Bug Fixes:

- Correct error in heatmap.2() that arises when data includes NA values
  (identified by Melissa Key).


gplots 2.8.0 - 2010-06-10
==========================

## Improvements:

- venn() now returns an object of class venn() and a plot method for
  this class is provided.

- Manual page for venn has been improved, based on contributions by
  Steffen Moeller


gplots 2.7.5 - ??
==========================

## Improvements:

- Performance of 'hist2d' improved thanks to a suggestion from
  Joerg van den Hoff.

gplots 2.7.4 - 2009-11-12
==========================

## Bug Fixes:

- Correct bug reported by Alan Yong:  plotmeans() failed when bars=FALSE.

gplots 2.7.3 - 2009-10-22
==========================

## Bug Fixes:

- Correct bug reported by Rudolf Talens: heatmap.2() incorrectly
  transposed the displayed matrix when the option symm=TRUE.


gplots 2.7.2 - 2009-05-08
==========================

## Bug Fixes:

- Correct bug reported by Ken Lo:  cox2hex() had blue and green
  components swapped.


gplots 2.7.1 - 2009-05-08
==========================

## New Features:


- Enhancements to heatmap.2()

    - New arguments 'lmat', 'lhei', and 'lwid' that allow controlling
      component plot layout.  Users can now resize and rearrange plot
      components.

    - heatmap.2() will now compute color breakpoints that are
      symmetric about 0 when the new 'symbreak' parameter is TRUE.  This
      parameter, as well as the symkey parameter now default to TRUE
      whenever negative values of x are present, and to FALSE othewise.

    - the heatmap.2() return value now includes additional useful
      information, including: call, rowMeans, rowSDs, colMeans,
      colSDs, carpet (reordered and scaled 'x' values), rowDendrogram,
      colDendrogram, breaks, col, vline, hline, and colorTable. Of
      these, the most useful are breaks, col, and colorTable.  The
      latter is a three-column data frame providing the lower and
      upper bound and color for each bin.

  See the manual page for complete details and examples.


- New function venn(), contributed by Steffen Moeller (Thanks
  Steffen!) to generate Venn diagrams for up to 5 sets. See ?venn for
  details.

- Performance of bandplot() has been dramatically improved, in part by
  using runsd() and runmean() from the caTools package.  As a
  consequence, gplots now depends on the caTools package.

- Improved performance of gplots::plot.lm for large lm objects by
  using the new bandplot() and by using fitted() instead of predict()
  to obtain y-hat.

- Add 'scale.range' argument to balloonplot(), option to scale
  balloons so [min,max]->[0,1] ('relative') or [0,max] -> [0,1]
  ('absolute').


## Bug Fixes:

- balloonplot() now properly handles dimension labels provided by
  'xlab' and 'ylab'

- plotCI now properly handles 'NULL' and 'NA' values for ui, li, uiw,
  and liw.

- Corrections of minor typos in man pages

- Update Greg's email address to 'greg@random-technologies-llc.com'


gplots 2.6.0 - 2008-04-07
==========================

## New Features:

- heatmap() now allows control of the location of individual plot components
   (e.g. color key)

## Bug Fixes:

- Fix bug in handling rowsep, per suggestion by Steven Paugh

- Fix examples for overplot()

- Two letter clarification of help text for heatmap.2()

- Restore plot layout settings to default state at end of ooplot() example

- Various typo fixes

gplots 2.5.0 - 2007-11-02
==========================

## New Features:

- textplot() now converts tab characters to spaces before processing to
  avoid problems with computing height and width of text that includes
  tabs.

- Add col2hex() function to convert color names to rgb hex codes

## Bug Fixes:

- Correct balloonplot.default to properly show specified x and y axis
  labels when explicitly provided

- R/balloonplot.R: Correct error in balloonplot when z contains NA values.

- Fix typos and code/doc mismatches identified by the latest R CMD check

## Other:

- Clarify GPL version

gplots 2.4.0 - 2007-02-08
==========================

## New Features:

- Add parameters to bandplot() to control line width and type.

- Add paramaeters to textplot.matrix() to allow specification of the
   color of the matrix data, rows, and column

## Bug Fixes:


## Other:


gplots 2.3.2 - 2006-11-14
==========================

- heatmap.2.Rd: Fix example that was broken by changes in 2.3.0.


gplots 2.3.1
==========================

- Changed maintainer back to Greg Warnes

- Updated Greg's email address

- heatmap.2.R: Fixed a bug which displayed warnings when Rowv and Colv
  were specified as dendrograms


gplots 2.3.0
==========================

 - heatmap.2.R, heatmap.2.Rd:

          Updated the code and man page to make sure the Rowv and Colv
          values are properly handled

 - Added the tests directory



gplots 2.2.0
==========================

 - plotmeans.R: Fixed bug in plotmeans - based on Stefano Calza's
	        suggestion (the function didn't account for factors
		unused levels, returning an error.)

 - exported plot.lm to NAMESPACE, Remove .Alias calls in plot.lm.R
 		since .Alias is defunct.

 - barplot2.R: Changed the default grey colors to heat colors, if
	       height is matrix

 - Updated Greg's email address

 - balloonplot.R: Recent changes to align row totals with the
	  	  overall total broke how the marginal cumulative
	  	  fractions were displayed. Added example using
	  	  Titanic data that exercises the multi-factor display.
 		  Added -.tex, .pdf files and figuers, and RNEWS article
		  in inst/doc

 - colorpanel.R: colorpanel now allows only 2 colors to be specified
		 if no 'middle' color is desired.


gplots 2.0.8
==========================

 - Added DESCRIPTION and removed DESCRIPTION.in

 - Updated barplot2

 - Updated heatmap.2

