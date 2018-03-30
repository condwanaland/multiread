#' multiread
#'
#' @param filelist A character vector of csv files
#' @param id Logical, whether an id column should be included in the
#' dataframe
#' @param as_df Logical, whether to return a dataframe instead of a list
#' of dataframes
#'
#' @return A list with elements equal to `length(filelist)``
#' @export
#'
#' @examples
#' \dontrun{
#' files <- list.files(pattern = ".csv")
#' mydata <- multiread(files, id = TRUE)
#' }

multiread <- function(filelist, id = TRUE, as_df = FALSE){
  if(is.character(filelist) == FALSE){
    stop("filelist must be a character vector")
  }
  if(length(filelist) == 0){
    stop("filelist must be greater than length zero")
  }
  if(id == TRUE){
    ldata <- lapply(filelist, read_ids)
  }
  else{
    ldata <- lapply(filelist, utils::read.csv)
  }
  if(as_df == FALSE){
    return(ldata)
  }
  else{
    ddata <- do.call(rbind, ldata)
    return(ddata)
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
