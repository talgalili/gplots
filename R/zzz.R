

.onAttach <- function(lib, pkg, ...) {
  packageStartupMessage(dendextendWelcomeMessage())
}



dendextendWelcomeMessage <- function() {
  paste0(
    "\n",
    "---------------------\n",
    "gplots ", utils::packageDescription("gplots")$Version, " loaded:\n",
    "  * Use citation('gplots') for citation info.\n",
    "  * Homepage: https://talgalili.github.io/gplots/\n",
    "  * Report issues: https://github.com/talgalili/gplots/issues\n",
    "  * Ask questions: https://stackoverflow.com/questions/tagged/gplots\n",
    "  * Suppress this message with: suppressPackageStartupMessages(library(gplots))\n",
    "---------------------\n"
  )
}




# Make sure to have: 
  # sudo apt-get install texinfo
  # sudo apt-get install texlive

# shell('git log --graph --stat --date=short --pretty=format:"%ad(%an) %s |%h" > ChangeLog', intern = TRUE)
# system('git log --graph --stat --date=short --pretty=format:"%ad(%an) %s |%h" > ChangeLog', intern = TRUE)
# file.copy("NEWS", "NEWS.md",overwrite = TRUE)
# devtools::check_win_devel()
# pkgdown::build_home()
# pkgdown::build_site(run_dont_run = TRUE)
# pkgdown::build_site()
# release()