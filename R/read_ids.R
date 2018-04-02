#' read_ids
#'
#' @param filelist
#'
#' @importFrom magrittr %>%
#'
#' @return NULL
#' @noRd
#'
#' @examples
#' \dontrun{
#' filelist <- list.files()
#' lapply(filelist, read_ids)
#' }

read_ids <- function(filelist){
  filelist <- as.character(strsplit(filelist, ".csv"))
  utils::read.csv(paste0(filelist, ".csv")) %>%
    dplyr::mutate(.id_col = filelist)
}
