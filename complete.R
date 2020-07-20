# - Create a function that will observe the number of complete cases

complete = function(directory, id = 1:332){
  com_data <- data.frame(matrix(ncol = 2, nrow = 0,dimnames = list(NULL,c("id","obs"))))
  files = list.files(directory, full.names = T)
  for (i in id){
    dat = na.omit(read.csv(files[i]))
    com_data[i, ] = c(i, nrow(dat))
  }
  na.omit(com_data)
}

