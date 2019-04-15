source("functions.R")
library("testthat")

context("Test for range value") 

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_range(x), 4)
  expect_length(stat_range(x), 1)
  expect_type(stat_range(x), 'double')
})

test_that("range works as expected with NA values", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(stat_range(y), NA_real_)
  expect_length(stat_range(y), 1)
})

test_that("range works as expected with logical values", {
  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(stat_range(z), 1L)
  expect_length(stat_range(z), 1)
  expect_type(stat_range(z), 'integer')
})

test_that("range works throws error on character input", {
  w <- letters[1:5]
  
  expect_error(stat_range(w))
})

context("Test for center value") 

test_that("center works as expected", {
  x <- c(1, 2, 3)
  
  expect_equal(stat_centers(x), 2)
  expect_length(stat_centers(x), 1)
  expect_type(stat_centers(x), 'double')
})

test_that("center works as expected with NA values", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(stat_centers(y), NA_real_)
  expect_length(stat_centers(y), 1)
})

context("Test for spread value") 

test_that("spread works as expected", {
  x <- c(1, 2, 3)
  
  expect_equal(stat_spreads(x), 1)
  expect_length(stat_spreads(x), 1)
  expect_type(stat_spreads(x), 'double')
})

test_that("spread works as expected with NA values", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(stat_spreads(y), NA_real_)
  expect_length(stat_spreads(y), 1)
})


