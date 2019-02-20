# Tinifyr

Compress your plot using Tinypng.

## Cloning the repo
The first thing you need to do is clone this repository by running `git clone https://github.com/willdahlgreen/tinifyr.git` in your terminal. 

After you have done that, you should have all the files needed for the package on your machine locally, however this does not mean the package has installed and you are not yet able to call on it in `R`. To do this, you need to go into this repo you have just cloned and open the `tinifyr.Rproj` in `R Studio`.  

## Installing the tinifyr package
Once you are in the `tinifyr.Rproj` project in your R console or in an R script, you need to run the following two commands in order to install the `tinifyr` package as one of your R packages

## Usage

```
devtools::install(".")
library('tinifyr')
```

If you then go to your package tab in `R Studio` , you should be able to see `tinifyr` in there and ticked. To make sure it is there, if you type `?tinify` in your package console, you will get a description of the function in the right hand side.  

## Using the function

Running the `tinify` function will compress your png using the Tinypng API (https://tinypng.com).

The function requires a Tinypng API key to work. Rather than expecting it as an argument which you would have to remember every time, the function reads it from an environment variable so you can set it once and then leave it be.

To set your Tinypng API key as an environment variable run the following in R and then restart **every** R session to save it:

```
readr::write_lines('TINYPNG_KEY = "your-api-key"', "~/.Renviron")
```

Keep in mind not to make this key public anywhere on Github and that you have just 500 free image compressions per month using the free Tinypng account.

Call the function like this:

```
tinify(file_path)
```

The function will save out a compressed version of your plot in its current location, with 'optimised-' in the file name.
