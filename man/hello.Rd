\name{FNGr}
\alias{fngr}
\title{Fish and Game ggplot figure style}
\usage{
theme_sleek()
tickr()
}
\description{
This is a style generator so that figures have the same general appearance within the Alaska Department of Fish and Game.
theme_sleek() is directly stolen from Sean Anderson! http://seananderson.ca/
}
\examples{
data.frame(year = 1973:2017) %>%
  mutate(y = rnorm(n(), 10,5)) -> df

  The basic ggplot figure spaces years about every 5-10, depending on the timeseries length.

ggplot(df, aes(year, y)) + geom_point()

  This makes for a rather crappy axis, for our typical presentation needs.
  We can clean this up somewhat by using breaks or the pretty_breaks function from the scales package

ggplot(df, aes(year, y)) + geom_point() +
scale_x_continuous(breaks = seq(1973, 2016, 3))

ggplot(df, aes(year, y)) + geom_point() +
  scale_x_continuous(breaks = pretty_breaks(n = 15))

  However this does not show a tick for each year, something that has been regularly requested.
  tickr will add a tick mark to each year and provide a label for the interval designated.

Labels every 10 years.

axis = tickr(df$year, 10)

ggplot(df, aes(year, y )) + geom_point() +
  scale_x_continuous(breaks = axis$breaks, labels = axis$labels)
}
