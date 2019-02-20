#' Compress your plot using Tinypng
#'
#' Running this function will compress your png using the Tinypng API (https://tinypng.com).
#' You will need to have a Tinypng API key set as an environment variable.
#' When run the function will save out your plot in its current location, with 'optimised-' in the file name.
#'
#' To set your Tinypng API key as an environment variable write the following in R and then restart R to save it:
#' write_lines('TINYPNG_KEY = "your-api-key"', "~/.Renviron")
#'
#' Keep in mind not to make this key public anywhere on Github and that you have just 500 free image compressions per month using the free Tinypng account.
#' @param file The filepath for the plot you want to compress (in PNG format)
#' @keywords tinify
#' @export
#' @examples
#' tinify(filepath)

tinify <- function(file){

  request <- paste0("cd '", dirname(file), "' && curl https://api.tinify.com/shrink --user api:",
                    Sys.getenv("TINYPNG_KEY"), " --data-binary @", basename(file),
                    " --dump-header /dev/stdout")

  response <- system(request, intern = T)

  url <- jsonlite::fromJSON(response[length(response)])$output$url

  download.file(url, paste0(dirname(file), "/optimised-", basename(file)))

}
