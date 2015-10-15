complete <- function(directory, id = 1:332) {
  #initialize nobs vector
  nobs <- numeric(0)
  #loop for selected ids
  for(i in id) {
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", 
                     sep = "")
    pollutantdata <- read.csv(fileStr)
    nobs <- c(nobs, nrow(na.omit(pollutantdata)))
  }
  #return count
  data.frame(id = id, nobs = nobs)
}