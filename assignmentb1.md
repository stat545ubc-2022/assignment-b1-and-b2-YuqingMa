assignment_b1
================
Yuqing Ma
11/1/2022

## Exercise 1: Make a Function

``` r
library(datateachr)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.5     ✓ dplyr   1.0.7
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   2.0.2     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches

    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null

    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

``` r
library(dplyr)
library(digest)
```

## Exercise 1: Make a Function

``` r
cal_mean <- function(data,group,target){
  data %>%
   dplyr::group_by(across(all_of(group))) %>% 
   dplyr::summarise(across(where(is.numeric),mean))
 
}
```

## Exercise 2: Document your Function

``` r
#' Calculate the mean value for different groups
#' @details the function is aimed to firstly group the data by a property and then calculate the mean values of the grouped data.
#' @param data is the data table we will focus on
#' @param group is the property that user would like to group by.
#' @param target is the target column that we want to calculate its mean value
#' @return the mean values of different groups
```

## Exercise 3: Include examples

``` r
# for example: we would like to calculate the mean diameter for different tree species
cal_mean(vancouver_trees,"genus_name","diameter")
```

    ## # A tibble: 97 × 8
    ##    genus_name  tree_id civic_number on_street_block height_range_id diameter
    ##    <chr>         <dbl>        <dbl>           <dbl>           <dbl>    <dbl>
    ##  1 ABIES       149149.        2787.           2687.            3.21    12.9 
    ##  2 ACER        136561.        2867.           2810.            2.73    10.6 
    ##  3 AESCULUS     77477.        2835.           2782.            4.60    23.7 
    ##  4 AILANTHUS    99330.        1767.           3650             3.5     15.9 
    ##  5 ALBIZIA     178047         1175            1100             2        6   
    ##  6 ALNUS       117600.        4581.           4104.            3.99    17.5 
    ##  7 AMELANCHIER 200567.        3007.           3306.            1.11     3.21
    ##  8 ARALIA       77886.        2015            1425             1.75     6.81
    ##  9 ARAUCARIA   140802.        3349.           3300             2.5     11.4 
    ## 10 ARBUTUS     169020.        2731.           2850             3.2     18.4 
    ## # … with 87 more rows, and 2 more variables: longitude <dbl>, latitude <dbl>

## Exercise 4: Test

``` r
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
```

    ## Test passed 😀

``` r
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
```

    ## Test passed 🌈

``` r
#Vector of length 0, like numeric(0).
#This time we check if there would be an error when we try to calculate a vector of length 0

tests = data.frame(
  x = numeric(0),
  col1 = numeric(0)
)
test_that("check non-numeric numbers", {
    expect_error(cal_mean(sample_tree, "xe","col1"))
})
```

    ## Test passed 🥳
