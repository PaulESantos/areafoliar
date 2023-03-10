#' File management
#'
#' File management function. The output file contains sample names in the first column and total leaf area (cm2) of the sample (e.g., one individual plant or one ramet) in the second column.
#'
#' @importFrom stats aggregate
#' @author Masatoshi Katabuchi \email{mattocci27@gmail.com}
#' @export
#' @param path Path to the target directory
#' @param prefix Regular expression to manage file names
#' @return A data frame of total leaf area for each sample
#' @return \item{sample}{Name of sample}
#' @return \item{total.leaf.area}{Total leaf area of the sample (cm2)}
resmerge.ij <- function(path, prefix = "\\.|-") {
  temp0 <- readtext.ij(path)
  temp <- sapply(temp0, sum)
  temp.data <- data.frame(file.name = names(temp), size = temp)
  # temp.data$file.name <- factor(sapply(strsplit(as.character(temp.data$file.name), prefix), "[", 1))

  tmp1 <- strsplit(as.character(temp.data$file.name), prefix)
  tmp1 <- sapply(tmp1, "[", 1)
  temp.data$file.name <- factor(tmp1)
  res <- aggregate(temp.data["size"], temp.data["file.name"], sum)
  names(res) <- c("sample", "total.leaf.area")
  return(res)
}
