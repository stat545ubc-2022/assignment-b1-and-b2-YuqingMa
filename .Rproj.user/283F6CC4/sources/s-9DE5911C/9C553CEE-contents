
<!-- README.md is generated from README.Rmd. Please edit that file -->

# calmean

<!-- badges: start -->
<!-- badges: end -->

The calmean package takes input of the data table, the the property that
user would like to group by, and the target column that we want to
calculate its mean value, then return a column of calculated mean
values.

## Installation

You can install the development environment of calmean by:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-YuqingMa/calmean")
```

Before get started, you need to install the following libraries.

``` r
library("dplyr")
library("testthat")
library("tidyverse")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(calmean)

sample_trees = data.frame(
 genus_name = c("ACER","FRAXINUS", "HIBISCUS","PYRUS","STYRAX" ,"TILIA","ULMUS","ZELKOVA" ),
 diameter = c(14.468750,13.166667 , 4.500000 , 5.000000 , 5.333333, 11.875000,10.000000,10.000000)
 )
 cal_mean(sample_trees,"genus_name","diameter")
#> # A tibble: 8 × 2
#>   genus_name diameter
#>   <chr>         <dbl>
#> 1 ACER          14.5 
#> 2 FRAXINUS      13.2 
#> 3 HIBISCUS       4.5 
#> 4 PYRUS          5   
#> 5 STYRAX         5.33
#> 6 TILIA         11.9 
#> 7 ULMUS         10   
#> 8 ZELKOVA       10
 # should return a column of mean diameters of different genus.
```
