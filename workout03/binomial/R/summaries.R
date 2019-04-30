# Calculates the mean of a binomial random variable with shape parameters trials
# and prob.
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# Calculates the variance of a binomial random variable with shape parameters
# trials and prob.
aux_variance <- function(trials, prob) {
  return(trials * prob * (1 - prob))
}

# Calculates the mode of a binomial random variable with shape parameters trials
# and prob.
aux_mode <- function(trials, prob) {
  m = trials * prob + prob
  if (is_integer_valued(m) && m > 0) {
    return(floor(m) - 1)
  } else {
    return(floor(m))
  }
}

# Calculates the skewness of a binomial random variable with shape parameters
# trials and prob.
aux_skewness <- function(trials, prob) {
  if (sqrt(trials * prob * (1 - prob)) == 0) {
    return(0)
  }
  return((1 - 2 * prob) / sqrt(trials * prob * (1 - prob)))
}

# Calculates the kurtosis of a binomial random variable with shape parameters
# trials and prob.
aux_kurtosis <- function(trials, prob) {
  if (trials * prob * (1 - prob) == 0) {
    return(0)
  }
  return((1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob)))
}

#' @title Mean of binomial random variable
#' @description calculates the mean of a binomial random variable defined by the
#'   specified shape parameters
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return the mean of a binomial random variable defined by the specified shape
#'   specified shape parameters
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, mean))
}

#' @title Variance of binomial random variable
#' @description calculates the variance of a binomial random variable defined by
#'  the specified shape parameters
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return the variance of a binomial random variable defined by the specified
#'   shape specified shape parameters
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, mean))
}

#' @title Mode of binomial random variable
#' @description calculates the mode of a binomial random variable defined by the
#'   specified shape parameters
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return the mode of a binomial random variable defined by the specified shape
#'   specified shape parameters
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, mean))
}

#' @title Skewness of binomial random variable
#' @description calculates the skewness of a binomial random variable defined by
#'  the specified shape parameters
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return the skewness of a binomial random variable defined by the specified
#'   shape specified shape parameters
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, mean))
}

#' @title Kurtosis of binomial random variable
#' @description calculates the kurtosis of a binomial random variable defined by
#'  the specified shape parameters
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return the kurtosis of a binomial random variable defined by the specified
#'   shape specified shape parameters
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, mean))
}
