#' Read image scans from a folder
#'
#' @param img_folder A character string giving the path to the root folder containing the image scans.
#' @return Returns a vector containing the normalized path to all image scans.
#' @export
#'
#' @examples
#' read_img_scans("/home/user/data/")
read_img_scans <- function(img_folder){
  # check the root directori
  x <- normalizePath(img_folder, mustWork = FALSE)
  # made the normalized path to all scans img
  normalizePath(dir(path = x,
                    pattern = "\\.jpeg$|\\.jpg$",
                    recursive = TRUE,
                    full.names = TRUE),
                mustWork = FALSE)
}
