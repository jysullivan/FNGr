# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

theme_sleek <- function(base_size = 11, base_family = "") {
  half_line <- base_size/2
  theme_light(base_size = 11, base_family = "") +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.ticks.length = unit(half_line / 2.2, "pt"),
      strip.background = element_rect(fill = NA, colour = NA),
      strip.text.x = element_text(colour = "grey30"),
      strip.text.y = element_text(colour = "grey30"),
      axis.text = element_text(colour = "grey30"),
      axis.title = element_text(colour = "grey30"),
      legend.title = element_text(colour = "grey30", size = rel(0.9)),
      panel.border = element_rect(fill = NA, colour = "grey70", size = 1),
      legend.key.size = unit(0.9, "lines"),
      legend.text = element_text(size = rel(0.7), colour = "grey30"),
      legend.key = element_rect(colour = NA, fill = NA),
      legend.background = element_rect(colour = NA, fill = NA),
      plot.title = element_text(colour = "grey30", size = rel(1)),
      plot.subtitle = element_text(colour = "grey30", size = rel(.85))
    )
}

tickr <- function(x, to){

  n = length(x)
  strtyr = min(x)
  begin = to * round(strtyr / to)
  endyr = max(x)
  label_breaks = seq(begin, endyr, to)

  if(strtyr %% 10 < 3 ){

    labs = as.vector(c(sapply(label_breaks, function(x) c(rep( NA, to), x))))
    drop = max(to - (begin - strtyr))-1

  } else {

    labs = as.vector(c(sapply(label_breaks, function(x) c(rep( NA, to-1), x))))
    drop = max(to - (begin - strtyr))-1
  }

  labs = labs[-c(1:drop)]
  extrana = n - length(labs)
  labs = c(labs, rep(NA, extrana))
  labs[is.na(labs)] <- " "
  data.frame(labels = labs, breaks = strtyr:endyr)

}
