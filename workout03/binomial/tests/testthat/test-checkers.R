context("Checker functions")

test_that("check_prob fails with invalid arguments", {
  expect_error(check_prob(1:2))
  expect_error(check_prob(2))
  expect_error(check_prob(-1))
  expect_error(check_prob("a"))
})

test_that("check_prob returns true with valid arguments", {
  expect_true(check_prob(0.5))
})

test_that("check_trials fails with invalid arguments", {
  expect_error(check_trials(1:2))
  expect_error(check_trials("a"))
  expect_error(check_trials(0.5))
  expect_error(check_trials(-1))
})

test_that("check_trials returns true with valid arguments", {
  expect_true(check_trials(1))
})

test_that("check_success fails with invalid arguments", {
  expect_error(check_success("a", 2))
  expect_error(check_success(0.5, 2))
  expect_error(check_success(3, 2))
  expect_error(check_success(-1, 2))
})

test_that("check_success returns true with valid arguments", {
  expect_true(check_success(c(1, 2), 2))
})
