
<!-- README.md is generated from README.Rmd. Please edit that file -->
multiread
=========

The goal of multiread is to wrap the process of reading in multiple csv files into R, and work with them in either list or dataframe format

Most people are accustomed to the process that follows

``` r
myfiles <- list.files(pattern = ".csv")
mydata <- lapply(myfiles, read.csv)
do.call(rbind, mydata)
```

Rather than overload beginners with concepts like `lapply` and `do.call`, which can be confusing at first, `multiread` simplifies this process by providing functions that wrap this process, and can optionally add an identifier column to each dataframe that shows the filename that it came from. If the list is later converted to a dataframe, this addition of an id column becomes invaluable.

Under `multiread`, the above code is replaced with

``` r
library(multiread)
myfiles <- list.files(pattern = ".csv")
mydata <- multiread(myfiles, as_df = TRUE)
```

Alternatively, if you would rather leave your dataframes in list format, simply use

``` r
my_data <- multiread(myfiles, as_df = FALSE)
```

Later, if you want to convert them to a dataframe, you can use `convert_df`

``` r
my_data <- convert_df(my_data)
```
