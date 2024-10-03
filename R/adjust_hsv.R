adjust_hsv <- function(col, h=NULL, s=NULL, v=NULL, alpha=NULL)
{
  # Recursion if vector of colors is passed
  if(length(col) > 1)
  {
    unname(sapply(col, adjust_hsv, h=h, s=s, v=v, alpha=alpha))
  }
  else
  {
    # Convert color to HSV space
    col.rgb <- col2rgb(col, alpha=TRUE)
    col.hsv <- rgb2hsv(col.rgb[1:3,])

    # Adjust h, s, v, a
    h <- if(is.null(h)) col.hsv["h",] else h
    s <- if(is.null(s)) col.hsv["s",] else s
    v <- if(is.null(v)) col.hsv["v",] else v
    a <- if(is.null(alpha)) col.rgb["alpha",]/255 else alpha

    # Convert new color to hexadecimal RGB format
    col.new <- hsv(h, s, v, a)

    # Remove alpha if original color did not have it and user didn't specify one
    if(!grepl("#.{8}", col) && is.null(alpha))
      col.new <- substring(col.new, 1, 7)

    col.new
  }
}
