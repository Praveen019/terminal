pollutantmean <- function(directory, pollutant, id = 1:332){
  if(grep("specdata", directory)==1){
    ##setwd("~/specdata/")
    file_vector <- as.character( list.files("~/specdata/") )
    file_path <- paste("~/specdata/", file_vector, sep="")
    mean_value <- c()
    for(i in id) {
    file_name <- read.csv(file_path[i])
    transformed_file <- file_name[!is.na(file_name[, pollutant]), pollutant]
    mean_value <- c(mean_value, transformed_file)
  }
  }
  return(mean(mean_value))
}
