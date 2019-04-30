context("Binomial functions")

test_that("bin_choose fails with invalid arguments", {
  expect_error(bin_choose(3, 5))
  expect_error(bin_choose(0.3, 5))
  expect_error(bin_choose(3, 0.5))
  expect_error(bin_choose("a", 5))
})

test_that("bin_choose returns correct value with valid arguments", {
  expect_equal(bin_choose(3, 1), 3)
  expect_equal(bin_choose(5, 0), 1)
})

test_that("bin_probability fails with invalid arguments", {
  expect_error(bin_probability(-1, 5, 0.5))
  expect_error(bin_probability(0.3, 5, 0.5))
  expect_error(bin_probability("a", 5, 0.5))
})

test_that("bin_probability returns correct value with valid arguments", {
  expect_equal(bin_probability(1, 2, 0.5), 0.5)
  expect_equal(bin_probability(0, 2, 0.5), 0.25)
})

test_that("bin_distribution fails with invalid arguments", {
  expect_error(bin_distribution(-1, 0.5))
  expect_error(bin_distribution(5, -1))
})

test_that("bin_distribution has correct output format", {
  expect_s3_class(bin_distribution(5, 0.5), "data.frame")
  expect_s3_class(bin_distribution(5, 0.5), "bindis")
  expect_true(mode(bin_distribution(5, 0.5)$probability) == "numeric")
  expect_true(mode(bin_distribution(5, 0.5)$success) == "numeric")
})

test_that("bin_distribution has values", {
  expect_equal(bin_distribution(1, 0.5)$probability, c(0.5, 0.5))
  expect_equal(bin_distribution(1, 0.5)$success, c(0, 1))
})

test_that("bin_probability returns correct value with valid arguments", {
  expect_equal(bin_probability(1, 2, 0.5), 0.5)
  expect_equal(bin_probability(0, 2, 0.5), 0.25)
})

test_that("bin_cumulative fails with invalid arguments", {
  expect_error(bin_cumulative(-1, 0.5))
  expect_error(bin_cumulative(5, -1))
})

test_that("bin_cumulative has correct output format", {
  expect_s3_class(bin_cumulative(5, 0.5), "data.frame")
  expect_s3_class(bin_cumulative(5, 0.5), "cumdis")
  expect_true(mode(bin_cumulative(5, 0.5)$probability) == "numeric")
  expect_true(mode(bin_cumulative(5, 0.5)$success) == "numeric")
  expect_true(mode(bin_cumulative(5, 0.5)$cumulative) == "numeric")
})

test_that("bin_cumulative has values", {
  expect_equal(bin_cumulative(1, 0.5)$cumulative, c(0.5, 1))
  expect_equal(bin_cumulative(1, 0.5)$probability, c(0.5, 0.5))
  expect_equal(bin_cumulative(1, 0.5)$success, c(0, 1))
})
