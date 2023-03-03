#' Summarise Leaf Area
#'
#' @param df A dataframe containing two columns (scan_id and leaf_area_cm2)
#'
#' @return A dataframe containing two columns (id and leaf_area_cm2)
#'
#' @export
#'
#' @examples
#' # summarise_leaf_area(df)
summarise_leaf_area <- function(df) {
  # remove the extencion and document type
  df[, 1] <- gsub("\\..*$", "", as.character(df[, 1]))
  #greoup by scans id
  res <- by(df,
            INDICES = list(df[,1]),
            FUN = function(x){
              data.frame(numb_part = length(x[,1]),
                         leaf_area_cm2 = sum(x[,2]))
            })
  #bind rows
  res <- do.call(rbind, res)
  #arrange the columns of dataframe
  out <- cbind(id = rownames(res), res)
  #remove rownames
  rownames(out) <- NULL
  return(out)
}
