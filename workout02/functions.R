#' @title Future Value
#' @description Calculates the future value with no annuity
#' @param amount the initial deposit
#' @param rate the annual return rate
#' @param years the number of years compounded
#' @return the future value of the investment
future_value = function(amount, rate, years) {
  return(amount * (1 + rate)^years)
}

#' @title Future Value of Annuity
#' @description Calculates the future value of annuity
#' @param contrib the initial deposit
#' @param rate the annual return rate
#' @param years the number of years compounded
#' @return the future value of the annuity
annuity = function(contrib, rate, years) {
  if (rate == 0) {
    return(0)
  }
  return(contrib * (((1 + rate)^years - 1) / rate))
}

#' @title Future Value of Growing Annuity
#' @description Calculates the future value of growing annuity
#' @param contrib the initial deposit
#' @param rate the annual return rate
#' @param growing the annual growth rate
#' @param years the number of years compounded
#' @return the future value of growing annuity
growing_annuity = function(contrib, rate, growth, years) {
  if (rate - growth == 0) {
    return(0)
  }
  return(contrib * (((1 + rate)^years - (1 + growth)^years) / (rate - growth)))
}