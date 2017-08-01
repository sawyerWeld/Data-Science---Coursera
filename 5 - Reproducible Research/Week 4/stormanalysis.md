Effects of Storms on Population Health and Economics, 1950 - 2011
================

Synopsis
--------

Synopsis: Immediately after the title, there should be a synopsis which describes and summarizes your analysis in at most 10 complete sentences.

Data Processing
---------------

There should be a section titled Data Processing which describes (in words and code) how the data were loaded into R and processed for analysis. In particular, your analysis must start from the raw CSV file containing the data. You cannot do any preprocessing outside the document. If preprocessing is time-consuming you may consider using the cache = TRUE option for certain code chunks.

First the data are loaded in from the bz2 compressed csv provided. This operation is large and should be cached.

``` r
stormdata <- read.csv("StormData.csv.bz2")
```

To see an over To see how specific event types affect population health, fatalities and injuries should be aggregated against event types:

``` r
fatalities <- aggregate(FATALITIES ~ EVTYPE, data = stormdata, FUN = "sum")
injuries <- aggregate(INJURIES ~ EVTYPE, data = stormdata, FUN = "sum")
#colnames(fatalities) <- c('event.type','total.fatalities')

str(injuries)
```

    ## 'data.frame':    985 obs. of  2 variables:
    ##  $ EVTYPE  : Factor w/ 985 levels "   HIGH SURF ADVISORY",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ INJURIES: num  0 0 0 0 0 0 0 0 0 0 ...

Results
-------

Present results At least one plot, no more than 3
