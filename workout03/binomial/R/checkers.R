# Returns true if prob is a number in the interval [0, 1].
check_prob <- function(prob) {
  if (length(prob) != 1) {
    stop("Probability vector must be a singleton.")
  }
  if (mode(prob) != "numeric") {
    stop("Proababilities must be numeric.")
  }
  if (prob < 0 || prob > 1) {
    stop("Probabilities must be in the interval [0, 1].")
  }
  return(TRUE)
}

# Returns true if trials is a non-negative number.
check_trials <- function(trials) {
  if (length(trials) != 1) {
    stop("Trials vector must be a singleton.")
  }
  if (mode(trials) != "numeric") {
    stop("Number of trials must be numeric.")
  }
  if (!is_integer_valued(trials)) {
    stop("Number of trials must be integer-valued.")
  }
  if (trials < 0) {
    stop("Number of trials must be non-negative.")
  }
  return(TRUE)
}

# Returns true if all elements of success are in the set {0, ..., trials}.
check_success <- function(success, trials) {
  check_trials(trials)
  if (mode(success) != "numeric") {
    stop("Success vector must be numeric.")
  }
  if (any(!is_integer_valued(success))) {
    stop("Success values cannot contain decinal parts.")
  }
  if (any(success > trials)) {
    stop("Number of successes cannot exceed the number of trials.")
  }
  if (any(success < 0)) {
    stop("Success values must be non-negative.")
  }
  return(TRUE)
}

# Returns true if x has no decimal part
is_integer_valued <- function(x) {
  return(x %% 1 == 0)
}
