tinifyr <- function(file, key){
  
  if (!require(jsonlite)) install.packages('jsonlite')

  library(jsonlite)
  
  file <- paste0(dirname(file), "/", basename(file))
  
  request <- paste0("curl https://api.tinify.com/shrink --user api:", 
                    key, 
                    " --data-binary @", 
                    file, 
                    " --dump-header /dev/stdout")
  
  response <- system(request, intern = T)
  
  url <- jsonlite::fromJSON(response[9])$output$url
  
  download.file(url, paste0(dirname(file), "/optimised-", basename(file))) 
  
}
