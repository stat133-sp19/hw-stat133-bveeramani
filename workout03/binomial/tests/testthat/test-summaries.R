context("Summary functions")

test_that("aux_mean returns correct value on general cases", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(20, 0.5), 10)
})

test_that("aux_mean returns correct value on edge cases", {
  expect_equal(aux_mean(0, 0.3), 0)
  expect_equal(aux_mean(10, 0), 0)
  expect_equal(aux_mean(10, 1), 10)
})

test_that("aux_variance returns correct value on general cases", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(20, 0.5), 5)
})

test_that("aux_variance correct value on edge cases", {
  expect_equal(aux_variance(0, 0.3), 0)
  expect_equal(aux_variance(10, 0), 0)
  expect_equal(aux_variance(10, 1), 0)
})

test_that("aux_mode returns correct value on general cases", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(20, 0.5), 10)
})

test_that("aux_mode returns correct value on edge cases", {
  expect_equal(aux_mode(0, 0.3), 0)
  expect_equal(aux_mode(10, 0), 0)
  expect_equal(aux_mode(10, 1), 10)
})

test_that("aux_skewness returns correct value on general cases", {
  expect_equal(aux_skewness(10, 0.3), 0.2760262, tolerance = 0.0001)
  expect_equal(aux_skewness(20, 0.5), 0)
})

test_that("aux_skewness correct value on edge cases", {
  expect_equal(aux_skewness(0, 0.3), 0)
  expect_equal(aux_skewness(10, 0), 0)
  expect_equal(aux_skewness(10, 1), 0)
})

test_that("aux_kurtosis returns correct value on general cases", {
  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tolerance = 0.0001)
  expect_equal(aux_kurtosis(20, 0.5), -0.1)
})

test_that("aux_kurtosis returns correct value on edge cases", {
  expect_equal(aux_kurtosis(0, 0.3), 0)
  expect_equal(aux_kurtosis(10, 0), 0)
  expect_equal(aux_kurtosis(10, 1), 0)
})
