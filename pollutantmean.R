# - Create a function, named "pollutantmean"


pollutantmean = function(directory, pollutant, id = 1:332){
  files = list.files(directory, full.names = TRUE)
  data = data.frame()
  for(i in id){
    data = rbind(data, read.csv(files[i]))
  }
  subset = data[ ,pollutant]
  mean(subset, na.rm = TRUE)
}


