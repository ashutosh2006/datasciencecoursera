corr <- function(directory, threshold = 0) {
  #fetch completed cases
  completeCase <- complete(directory)
  #fetch all ids
  ids <- subset(completeCase, nobs > threshold )$id
  #initialize corrData
  corrData <- numeric(0)
  #loop for ids
  for(i in ids) {
    #select the repsective files
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", 
                     sep = "")
    #load data frame
    monDfr <- read.csv(fileStr)
    #fetch the correlation
    corrData <- c(corrData, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))
  }
  return(corrData)
}