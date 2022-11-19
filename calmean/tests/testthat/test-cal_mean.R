library(dplyr)
library(tidyverse)
library(testthat)
library(calmean)
library(datateachr)

# To started with, I randomly selected 20 samlples from the dataset to conveniently compute.
sample_tree = slice_head(vancouver_trees,n=20)
#Vector with no NA’s
res = cal_mean(sample_tree,"genus_name","diameter")
expected_res = data.frame(
  genus_name = c("ACER","FRAXINUS", "HIBISCUS","PYRUS","STYRAX" ,"TILIA","ULMUS","ZELKOVA" ),
  diameter = c(14.468750,13.166667 , 4.500000 , 5.000000 , 5.333333, 11.875000,10.000000,10.000000)
)
real_res = data.frame(
  genus_name =res$genus_name,
  diameter= round(res$diameter,6))


test_that("calculate the average diameters of different genuses", {
  expect_equal(real_res,expected_res)
})

#Vector with NA’s
#This time we calculate the mean longitudes for different genuses
#There are NA values in the longitudes

expected_res = data.frame(
  genus = c("ACER","FRAXINUS", "HIBISCUS","PYRUS","STYRAX" ,"TILIA","ULMUS","ZELKOVA"),
  longitude = c(-123.1017 ,-123.0872, -123.0932, -123.1196, -123.0874, -123.0887,-123.1161 ,-123.1147)
)
res = cal_mean(sample_tree, "genus_name","longitude")
real_res = data.frame(
  genus = res$genus_name,
  longitude = round(res$longitude,4)
)

test_that("calculate the average longitudes of different genuses", {
  expect_equal(real_res,expected_res)
})

#Vector of length 0, like numeric(0).
#This time we check if there would be an error when we try to calculate a vector of length 0

tests = data.frame(
  x = numeric(0),
  col1 = numeric(0)
)
test_that("check non-numeric numbers", {
  expect_error(cal_mean(sample_tree, "xe","col1"))
})
