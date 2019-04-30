#' @title Number of combinations
#' @description Calculates n choose k.
#' @param n the number of elements
#' @param k the size of the subset
#' @return the number of k-length subsets of a n-length set.
#' @export
#' @examples
#' bin_choose(n = 5, k = 3)
bin_choose <- function(n, k) {
  if (mode(n) != "numeric" || n != floor(n)) {
    stop("n must be numeric integer")
  }
  if (mode(k) != "numeric" || k != floor(k)) {
    stop("k must be numeric integer")
  }
  if (any(k > n)) {
    stop("k cannot be greater than n.")
  }
  if (any(k < 0)) {
    stop("k cannot be negative.")
  }
  return(factorial(n) / (factorial(n - k) * factorial(k)))
}

#' @title Probability of binomial random variable
#' @description Calculates the probability that a binomial random variable with
#'   the specified shape parameters takes on a particular value.
#' @param success a numeric vector indicating the number of successes
#' @param trials the number of I.I.D. Bernoulli trials
#' @param prob the shape paramater of each I.I.D. Bernoulli trial
#' @return the probability that a binomial random variable with the specified
#'   shape parameters take on a particular value.
#' @export
#' @examples
#' bin_probability(success = 3, trials = 10, prob = 0.5)
bin_probability <- function(success, trials, prob) {
  check_success(success, trials)
  check_trials(trials)
  check_prob(prob)
  return (bin_choose(trials, success) * prob ^ success *
            (1 - prob) ^ (trials - success))
}

#' @title Probability mass function of a binomial random variable
#' @describe Constructs a data frame representing the probability mass function
#'   of a binomial random variable with the specified shape parameters.
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial.
#' @return a data frame representing the probability mass function of a binomial
#'   random variable with the specified shape parameters.
#' @export
#' @examples
#' dis = bin_distribution(trials = 10, prob = 0.5)
#' support = dis$success
bin_distribution <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  support = 0:trials

  probability = rep(0, trials)
  for(number in support) {
    probability[number + 1] = bin_probability(number, trials, prob)
  }

  df = data.frame(success = support, probability = probability)
  class(df) = c("bindis", "data.frame")

  return(df)
}

#' @export
plot.bindis <- function(bindis) {
  barplot(
    bindis$probability,
    xlab = "successes",
    ylab = "probability",
    names.arg = bindis$success,
    border = NA)
}

#' @title Cumulative distribution function of a binomial random variable
#' @describe Constructs a data frame representing the cumulative distribution
#'   function of a binomial random variable with the specified shape parameters.
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return a data frame representing the Cumulative distribution function of a
#'   binomial random variable with the specified shape parameters
#' @export
#' @examples
#' cdf = bin_cumulative(trials = 10, prob = 0.5)
#' support = cdf$success
bin_cumulative <- function(trials, prob) {
  support = 0:trials

  probability = rep(0, trials)
  for(number in support) {
    probability[number + 1] = bin_probability(number, trials, prob)
  }
  cumulative = cumsum(probability)

  df = data.frame(
    success = support,
    probability = probability,
    cumulative = cumulative)

  class(df) = c("cumdis", "data.frame")
  return(df)
}

#' @export
plot.cumdis <- function(cumdis) {
  plot(
    x = cumdis$success,
    y = cumdis$cumulative,
    xlab = "successes",
    ylab = "probability")
  lines(cumdis$success, cumdis$cumulative)
}

#' @title Binomial random variable constructor
#' @description Creates a binomial random variable with the specified shape
#'   parameters.
#' @param trials number of I.I.D. Bernoulli trials
#' @param prob the shape parameter of each I.I.D. Bernoulli trial
#' @return an object representing a binomial random variable
#' @export
#' @examples
#' binvar = bin_variable(trials = 10, prob = 0.5)
#' cdf = bin_cumulative(binvar$trials, binvar$prob)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binvar = list(trials = trials, prob = prob)
  class(binvar) = c("binvar", "list")
  return(binvar)
}

#' @export
print.binvar <- function(binvar) {
  cat("\"Binomial Variable\"", "\n\n")
  cat("Parameters", "\n")
  cat("-", "number of trials:", binvar$trials, "\n")
  cat("-", "prob of success :", binvar$prob, "\n")

  return(invisible(binvar))
}

#' @export
summary.binvar <- function(binvar) {
  summary_object = list(
    trials = binvar$trials,
    prob = binvar$prob,
    mean = aux_mean(binvar$trials, binvar$prob),
    variance = aux_variance(binvar$trials, binvar$prob),
    mode = aux_mode(binvar$trials, binvar$prob),
    skewness = aux_skewness(binvar$trials, binvar$prob),
    kurtosis = aux_kurtosis(binvar$trials, binvar$prob)
  )
  class(summary_object) = c("summary.binvar", "list")
  return(summary_object)
}

#' @export
print.summary.binvar <- function(summary_object) {
  cat("\"Binomial Variable\"", "\n\n")
  cat("Parameters", "\n")
  cat("-", "number of trials:", summary_object$trials, "\n")
  cat("-", "prob of success :", summary_object$prob, "\n\n")
  cat("Measures", "\n")
  cat("-", "mean    :", summary_object$mean, "\n")
  cat("-", "variance:", summary_object$variance, "\n")
  cat("-", "mode    :", summary_object$mode, "\n")
  cat("-", "skewness:", summary_object$skewness, "\n")
  cat("-", "kurtosis:", summary_object$kurtosis, "\n")

  return(invisible(summary_object))
}
