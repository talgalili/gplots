# Make sure to have: 
  # sudo apt-get install texinfo
  # sudo apt-get install texlive

# shell('git log --graph --stat --date=short --pretty=format:"%ad(%an) %s |%h" > ChangeLog', intern = TRUE)
# system('git log --graph --stat --date=short --pretty=format:"%ad(%an) %s |%h" > ChangeLog', intern = TRUE)
# file.copy("NEWS", "NEWS.md",overwrite = TRUE)
# devtools::check_win_devel()
# pkgdown::build_home()
# pkgdown::build_site(run_dont_run = TRUE)
# release()