# Final Questions
Sneha Krishna

## Lecture 08a

A principal component analysis is done on a data matrix, `data`, and a summary of results of this analysis is shown below. How many components are sufficient to summarize `data`?

```r
> x <-princomp(data)
> summary(x)
Importance of components:
                        Comp.1     Comp.2     Comp.3      Comp.4
Standard deviation     2.0494032 0.49097143 0.27872586 0.153870700
Proportion of Variance 0.9246187 0.05306648 0.01710261 0.005212184
Cumulative Proportion  0.9246187 0.97768521 0.99478782 1.000000000
```

* 1
* 2
* 3
* 0

## Lecture 08b

The `sweep` function returns an array obtained from an input array by sweeping out a summary statistic. Which of following lines of code will succesfully modify matrix `m`to generate matrix `x`?

```r
> m
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```

```r
> x
     [,1] [,2]
[1,]   -1   -1
[2,]    0    0
[3,]    1    1
```

* `x <- sweep(m, 2, colMeans(m), "-")`
* `x <-sweep(m, colMeans(m), "-")`
* `x <- sweep(colMeans(m), "-")`
* `x <- sweep(m, 1, colMeans(m), "-")`

## Lecture 09a

Which of following lines of code will initialize a `ggplot` object for a data frame `df`?

* `ggplot() + geom_point(data = df, aes(x =x, y = y))`
* `ggplot(df) + geom_point(aes(x = x, y = y))`
* `ggplot(df, aes(x = x, y = y)) + geom_point()`
* All answers are correct

## Lecture 09b

If a scatterplot, `g`, is generated as shown below, which the following lines of code will succcesfully add a linear regression fit line to `g`?

```r
> g <- ggplot(data, aes(x=x, y=y) ) +   geom_point()
```

* `g + geom_smooth(method=lm)`
* `g + geom_smooth()`
* `g$geom_smooth()`
* None are correct

## Lecture 10a

Which of the following files are minimally necessary to create a Shiny app in R?

* `ui.R` and `server.R`
* Only `server.R` is necessary
* Only `ui.R` is necessary
* `image.R` and `server.R`

## Lecture 10b

The `rgl1` package:

* is used to produce interactive 3-D plots
* contain the `plot3d` function that plots points within an rgl window
* can be used to construct geometric objects using functions such as `cube3d`
* All answers are correct.

## Lecture 11a

Which of the following statement regarding the `hclust` function is FLASE?

* The `hclust` function requires that the number of clusters to be extracted is specified.
* The `hclust` function performs hierarchical cluster analysis.
* The algorithm used in `hclust` proceeds iteratively. At each stage distances between clusters are recomputed.
*  The `hclust` function in R uses defines the cluster distance between two clusters to be the maximum distance between their individual components.

## Lecture 11b

The `closeness()` functions in the `igraph` packages measures:

* how many steps is required to access every other vertex from a given vertex
* the number of geodesics (shortest paths) going through a vertex or an edge
* the eigenvector centralities of positions v within it
* None of the choices are correct

## Lecture 12a

A simple inear regression analysis is done on a data set containing vaiables `x` and `y.` Given the cofficent results below, which equation best fits this data set?

```r
> fit <- lm(y ~ x)
> coef(fit)
(Intercept)           x 
       36.0         1.94 
```

* y=3.60+1.94*x
* x=3.60+1.94*y
* y=1.94+3.60*x
* x=1.94+3.60*y

## Lecture 12b 

What does the following code do?

```r
library(manipulate)
manipulate(plot(1:x), x = slider(1, 100))
```

* Generates an interactive plot with "x" number of points where "x" can be manipulated to an interger value between 1 and 100.
* Generates a plot with 100 points.
* Generates an random number of points between 1 and 100. 
* None of the choices are correct. 

## Lecture 13a

Which of following statement about Simpson's Paradox is true?

*  Simpson's Paradox demonstates that a great deal of care has to be taken when combining small data sets into a large one. 
*  Simpson's Paradox can be caused by a lurking variable.
*  Simpson's Paradox can be caused from unequal sized groups being combined into a single data set.
* All choices are correct.

## Lecture 13b

A logisitic function can be used to model:

* population growth
* the relationship between a scalar dependent variable and one or more explanatory variables
* the relationship between a Poisson distributed response variable and one or more explanatory variables
* Nones of these choices are correct.

## Lecture 14a

What does the `cut()` function do in the code below?

```r
> x <- c(1:10)
> cut(x,breaks=2)
```

* It divides `x` into 2 intervals and codes the values in `x` according to which interval they fall.
* It returns two values from 'x'.
* It divides all values in `x` by 2.
* It return all values of x that are divisible by 2.

## Lecutre 14b

What does the following code do?

```r
a <- c(5,10,15,20)
b <- c(2,4,6,8)
df<- data.frame(a,b)
with (df, {df$a <- df$a+ 10; print(df)})
```

* modifies values of `a` in data frame `df` by adding 10 to each value in column `a`, then prints out `df`
* modifies column `a` in data frame `df` by adding the value 10 to the column, then prints out `df`
* modifies all values in data frame `df` by adding 10 to each value, then prints out `df`
* None of the above

## Lecture 15a

True or false: one of the assumptions of the linear regression model is that there is no heteroscedasticity.

* True
* False
* Depend on the specific data set
* heteroscedasticity doesn't have anything to do with linear regression modelling. 












