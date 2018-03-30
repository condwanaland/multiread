#' multiread
#'
#' @param filelist A character vector of csv files
#' @param id Logical, whether an id column should be included in the
#' dataframe
#'
#' @return A list with elements equal to `length(filelist)``
#' @export
#'
#' @examples
#' \dontrun{
#' files <- list.files(pattern = ".csv")
#' mydata <- multiread(files, id = TRUE)
#' }

multiread <- function(filelist, id = NULL){
  if(is.character(filelist) == FALSE){
    stop("filelist must be a character vector")
  }
  if(length(filelist) == 0){
    stop("filelist must be greater than length zero")
  }
  if(id == TRUE){
    lapply(filelist, read_ids)
  }
  else{
    lapply(filelist, read.csv)
  }
}


#' convert_df
#'
#' @param df_list A list of dataframes
#'
#' @return A dataframe
#' @export
#'
#' @examples
#' \dontrun{
#' mydf <- convert_df(files)
#' }

convert_df <- function(df_list){
  do.call(rbind, df_list)
}
