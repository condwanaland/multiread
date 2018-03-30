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
  utils::read.csv(filelist) %>%
    dplyr::mutate(.id_col = filelist)
}
