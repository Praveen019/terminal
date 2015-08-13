complete <- function(directory, id = 1:332) {
  nobs <- function(id) {
    file_vector <- as.character( list.files("~/specdata/") )
    file_path <- paste("~/specdata/", file_vector, sep="")
    return (sum(complete.cases(read.csv(file_path[id]))))
  }
  return (data.frame(id=id, nobs=sapply(id, nobs)))
}
