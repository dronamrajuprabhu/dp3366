    data <- "./Desktop/activity.csv"
    da <- read.csv(data,header = TRUE, sep = ",")
    dp <- aggregate(da$steps~da$date,da,sum, na.rm=TRUE)
    histogram1 <- hist(dp$`da$steps`, breaks=50, main = "Total number of steps", xlab = "steps", col = "blue")

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-1-1.png)<!-- -->

    da_mean <- mean(da$steps, na.rm = TRUE)
    da_mean

    ## [1] 37.3826

    ds <- aggregate(da$steps~da$interval,da, mean, na.rm=TRUE)
    plotting <-plot(ds$`da$interval`,ds$`da$steps`,type = "l", xlab = "steps", ylab = "interval", main = "Time series plot of the average number of steps taken")

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-2-1.png)<!-- -->

    plotting

    ## NULL

    maxsteps <- max(ds$`da$steps`)
    maxsteps

    ## [1] 206.1698

    md <- sum(is.na(da$steps))
    md

    ## [1] 2304

    sdata <- aggregate(da$steps ~ da$interval, da, mean, na.rm=TRUE)
    mdata <- sum(is.na(da$steps))
    da$steps[is.na(da$steps)] <- median(da$steps, na.rm=TRUE)
    betdat<- aggregate(steps ~ date, da, sum, na.rm=TRUE)
    histogram2 <-hist(betdat$steps, breaks=30, main="Total Steps per Day with NA adjusted", xlab="Steps",col = "red")

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-3-1.png)<!-- -->

    histogram2

    ## $breaks
    ##  [1]     0  1000  2000  3000  4000  5000  6000  7000  8000  9000 10000
    ## [12] 11000 12000 13000 14000 15000 16000 17000 18000 19000 20000 21000
    ## [23] 22000
    ## 
    ## $counts
    ##  [1] 10  0  1  1  1  2  1  2  5  2 10  6  6  4  2  5  0  1  0  0  1  1
    ## 
    ## $density
    ##  [1] 1.639344e-04 0.000000e+00 1.639344e-05 1.639344e-05 1.639344e-05
    ##  [6] 3.278689e-05 1.639344e-05 3.278689e-05 8.196721e-05 3.278689e-05
    ## [11] 1.639344e-04 9.836066e-05 9.836066e-05 6.557377e-05 3.278689e-05
    ## [16] 8.196721e-05 0.000000e+00 1.639344e-05 0.000000e+00 0.000000e+00
    ## [21] 1.639344e-05 1.639344e-05
    ## 
    ## $mids
    ##  [1]   500  1500  2500  3500  4500  5500  6500  7500  8500  9500 10500
    ## [12] 11500 12500 13500 14500 15500 16500 17500 18500 19500 20500 21500
    ## 
    ## $xname
    ## [1] "betdat$steps"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

    bmean <- mean(betdat$steps)
    bmedian <- median(betdat$steps)
    da$date <- as.Date(da$date)
    da$dayname <- weekdays(da$date)
    da$weekend <- as.factor(ifelse(da$dayname == "Saturday" |da$dayname == "Sunday", "weekend", "weekday"))
    library(lattice)
    plotdata <- aggregate(steps ~ interval + weekend, da, mean)
    plotting2 <- xyplot(steps ~ interval | factor(weekend), data=plotdata, aspect=1/3, type="l")
    plotting2

![](PA1_template_files/figure-markdown_strict/unnamed-chunk-4-1.png)<!-- -->

    plot(plotting2)

![](PA1_template_files/figure-markdown_strict/plotting2-1.png)<!-- -->

MADE BY:
--------

### Dronamraju Prabhu
