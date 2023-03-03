#' @title Leaf area calculation loop
#'
#' @description
#'
#' Loop through a list of files and run ImageJ to measure leaf area.
#'
#' @param files A character vector of file paths
#' @param temp.folder The folder where the files should be copied to
#' @param output.folder The folder where the output files should be saved
#' @param imagej.path The path to the ImageJ program. On Windows this will always be "C:\\Program Files\\ImageJ\\".
#' @param pixel The number of pixels in a known distance
#' @param know.pixel.distance The known distance in cm
#' @param low.size The minimum size of a leaf in cm2
#' @param trim.pixel The number of pixels to trim
#' @param trim.pixel2 The number of pixels to trim
#' @return A dataframe containing the ID and LeafArea
#' @export
#' @examples
#' map_leaf_area(files = c("file1.tif", "file2.tif"),
#' temp.folder = NULL, output.folder = NULL,
#' imagej.path = NULL,
#' pixel = 300, know.pixel.distance = 2.54, low.size = 0.005,
#' trim.pixel = 100, trim.pixel2 = 150)
map_leaf_area <- function( files,
                           temp.folder = NULL,
                           output.folder = NULL,
                           imagej.path = NULL,
                           pixel = 300,
                           know.pixel.distance = 2.54, low.size = 0.005,
                           trim.pixel = 100, trim.pixel2 = 150) {

  # create temp folder
  if(is.null(temp.folder) == TRUE){
    temp_path <- gsub("/", "\\\\", paste0(getwd(), "/temp_folder"))
    if(dir.exists(temp_path) == TRUE){
      temp_path <- temp_path
    } else{
      dir.create(temp_path)
    }
    #dir.create(temp_path)
  } else{
    temp_path <- temp.folder
  }

  # create a copy of img scans
  file.copy(files, temp_path)
  print(files)

  # output folder, to save binary files

  if(is.null(output.folder) == TRUE){
    return("Create a output folder!!.")
  } else{
    output.folder <- normalizePath(output.folder, mustWork = FALSE)
  }

  # ImageJ path specification
  if (is.null(imagej.path) == TRUE){
    imagej <- areafoliar::find_ij(ostype = .Platform$OS.type)
    if (imagej == "ImageJ not found"){
      return("ImageJ not found. Save ImageJ on C:\\Program Files\\ImageJ\\ ")
    }  else {
      imagej.path <- imagej
    }
  } else{
    imagej.path <- imagej.path
  }

  ###
  area <- try(areafoliar::run.ij(
    set.directory = temp_path,
    distance.pixel = pixel, # !!!
    known.distance =  know.pixel.distance, # !!!
    log = TRUE,
    low.size = low.size, # !!!
    trim.pixel = trim.pixel, trim.pixel2 = trim.pixel2, # !!!
    save.image = TRUE,
    path.imagej = imagej.path # !!!
  ))

  if (inherits(area, "try-error")) {
    return(data.frame(LeafArea = NA))
  }

  file.copy(dir(temp_path,
                full.names = TRUE,
                pattern = "\\.tif"),
            output.folder)
  Sys.sleep(0.1)
  if (any(!file.remove(dir(temp_path,
                           full.names = TRUE)))) stop()
  res <- data.frame(id = names(unlist(area[[2]])),
                    leaf_area_cm2 = (unlist(area[[2]]))
  )
  rownames(res) <- NULL
  return(res)
}
