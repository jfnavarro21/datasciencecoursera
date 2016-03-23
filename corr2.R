corr <- function(directory, threshold = 0) {
   
    filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
    comp <- complete(directory)
    comp2 <- subset(comp,  comp$nobs > threshold)
    ##how do i keep comp2 from printing
    values = numeric()
   
   for (i in comp2$id) {
       
       data <- read.csv(filelist[i])
       values <- c(values, cor(data[["sulfate"]], data[["nitrate"]], use ="complete.obs"))
       
      
    }
  print(values)
}

       
  
    
  
 
  

  