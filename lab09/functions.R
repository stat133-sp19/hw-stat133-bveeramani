#' @title Range
#' @description computes the range of a numeric vector (i.e. max - min)
#' @param x a numeric vector
#' @return the range value (max - min)
stat_range <- function(x) {
  max(x) - min(x)
}

#' @title Measures of center
#' @description computes measures of center such as Median and Mean
#' @param x a numeric vector
#' @return a numeric vector with median and mean
stat_centers <- function(x) {
  mean(x)
}

#' @title Measures of spread
#' @description computes measures of spread such as Range, IQR, Standard Deviation
#' @param x a numeric vector
#' @return a numeric vector with range, iqr, and stdev
stat_spreads <- function(x) {
  sd(x)
}