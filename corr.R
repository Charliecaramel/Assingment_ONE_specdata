# Create a function that will calculate the corr of sulafte and nitrate

complete = function(directory, id = 1:332){
  com_data <- data.frame(matrix(ncol = 2, nrow = 0,dimnames = list(NULL,c("id","obs"))))
  files = list.files(directory, full.names = T)
  for (i in id){
    dat = na.omit(read.csv(files[i]))
    com_data[i, ] = c(i, nrow(dat))
  }
  na.omit(com_data)
}


corr <- function(directory, threshold = 0){
  t_v = complete("specdata",1:332)[complete("specdata",1:332)$obs > threshold, 1]
  Corrleation = vector("numeric", 332)
  fiels_list = list.files(directory, full.names = TRUE)
  for(i in t_v){
    dat = na.omit(read.csv(fiels_list[i]))
    Corrleation[i] = cor(dat$sulfate, dat$nitrate)
  }
  Corrleation = na.omit(Corrleation)
  Corrleation = Corrleation[!Corrleation == 0]
}

