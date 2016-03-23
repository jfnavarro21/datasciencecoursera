corr <- function(directory, threshold = 0) {
  
  files <- list.files(directory, pattern=".csv", full.names=TRUE)
  
  ## make a loop ?? for (i in 332)
  
  ## read.csv on each individual file
  
  dat <- read.csv(id, header = TRUE)
  ## sum the complete cases to see if above "threshold"
  
  nobs <- sum(as.numeric(complete.cases(dat)))
  if (nobs > threshold) {
    
    ## Remove NAs from each csv
    
    dat.comp <- dat[complete.cases(dat), ]
    
    ##cor(nitrate, sulfate)
    return(cor(dat.comp$sulfate, dat.comp$nitrate))
    
    else
      numeric()
            }
  
  }
 
  

  