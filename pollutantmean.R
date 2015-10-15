pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  pollutantMean <- c()
  for(i in id) {
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", sep = "")
    pollutantdata <- na.omit(read.csv(fileStr, header=T, sep=","))
    pollutantdataNaRemoved <- pollutantdata[!is.na(pollutantdata[, pollutant]), pollutant]
    pollutantMean <- c(pollutantMean, pollutantdataNaRemoved)
  }
  
  mean(pollutantMean)
}