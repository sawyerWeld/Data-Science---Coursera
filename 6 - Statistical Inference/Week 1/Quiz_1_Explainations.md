Statistical Inference Quiz 1
================
Sawyer Welden
August 16, 2017

Question 1
----------

Consider influenza epidemics for two parent heterosexual families. Suppose that the probability is 17% that at least one of the parents has contracted the disease. The probability that the father has contracted influenza is 12% while the probability that both the mother and father have contracted the disease is 6%. What is the probability that the mother has contracted influenza?

``` r
# P(AvB) = .17
# P(B) = .12
# P(A^B) = .06
# ?P(A)
# P(AvB) = P(A) + P(B) - P(A^B)
# .17 = P(A) + .12 - .06
# .17 = P(A) + .06
paste("P(A) =", .17 - .06)
```

    ## [1] "P(A) = 0.11"

Question 2
----------

A random variable, X is uniform, a box from 0 to 1 of height 1. (So that its density is f(x)=1 for 0&lt;=x&lt;=1.) What is its 75th percentile?

``` r
# on x = [0,1], X = 1
# 75-th percentile is just 3/4-ths of the way because uniformity
paste("75-th percentile is", 0.75)
```

    ## [1] "75-th percentile is 0.75"

Question 3
----------

You are playing a game with a friend where you flip a coin and if it comes up heads you give her X dollars and if it comes up tails she gives you Y dollars. The probability that the coin is heads is p (some number between 0 and 1.) What has to be true about X and Y to make so that both of your expected total earnings is 0. The game would then be called "fair".

``` r
# To be fair the expected earnings of both are 0
# So (x * p) - (y * (p-1)) = 0
# To get this in form of the answers we use cross-multipliaction
# x/y = (1-p)/p
paste("Fair outcome when x/y = (1-p)/p")
```

    ## [1] "Fair outcome when x/y = (1-p)/p"

Question 4
----------

A density that looks like a normal density (but may or may not be exactly normal) is exactly symmetric about zero. (Symmetric means if you flip it around zero it looks the same.) What is its median?

``` r
# If it is symmetric around 0, then 0 is the center
paste("Median = 0")
```

    ## [1] "Median = 0"

Question 5
----------

Consider the following PMF shown below in R

``` r
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp
```

    ##      [,1] [,2] [,3] [,4]
    ## X     1.0  2.0  3.0  4.0
    ## Prob  0.1  0.2  0.3  0.4

What is the mean?

``` r
# The mean of a PMF is the sum of x * P(x) for all x
mean <- (1 * .1) + (2 * .2) + (3 * .3) + (4 * .4)
paste("The mean is", mean)
```

    ## [1] "The mean is 3"

Question 6
----------

A web site (www.medicine.ox.ac.uk/bandolier/band64/b64-7.html) for home pregnancy tests cites the following: "When the subjects using the test were women who collected and tested their own samples, the overall sensitivity was 75%. Specificity was also low, in the range 52% to 75%." Assume the lower value for the specificity. Suppose a subject has a positive test and that 30% of women taking pregnancy tests are actually pregnant. What number is closest to the probability of pregnancy given the positive test?

``` r
# Specificty = P(Preg | +) = .75
# Sensitivity = P(!Preg | -) = .52
# Naive P(Preg) = .3
# ?P(Preg | +)
# True Positive * Prevalence / Naive Positive
TPos <- .75 * .3
Prev <- .3
```
