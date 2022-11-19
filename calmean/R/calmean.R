#' @description
#' The function takes input of the data table, the the property that user would like to group by, and the target column that we want to calculate its mean value, then return a column of calculated mean values.
#'
#' @title Calculate the mean value for different groups
#' @details the function is aimed to firstly group the data by a property and then calculate the mean values of the grouped data.
#' @param data is the data table we will focus on
#' @param group is the property that user would like to group by.
#' @param target is the target column that we want to calculate its mean value
#' @return the mean values of different groups
#'
#'  @examples
#' sample_trees = data.frame(
#' genus_name = c("ACER","FRAXINUS", "HIBISCUS","PYRUS","STYRAX" ,"TILIA","ULMUS","ZELKOVA" ),
#' diameter = c(14.468750,13.166667 , 4.500000 , 5.000000 , 5.333333, 11.875000,10.000000,10.000000)
#' )
#' calmean(sample_trees,"genus_name","diameter")
#' # should return a column of mean diameters of different genus.
#' @export
cal_mean <- function(data,group,target){
  data %>%
    dplyr::group_by(across(all_of(group))) %>%
    dplyr::summarise(across(where(is.numeric),mean))

}
