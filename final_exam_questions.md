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

##Lecture 08b

Give matrix `m', what does `x` look like?

```r
> m <- matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)
> m
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

> x <- sweep(m, 2, colMeans(m), "-")
```

* &nbsp;&nbsp; `-1   -1`
&nbsp;&nbsp; `0    0`
&nbsp;&nbsp; `1    1`
&nbsp;
* &nbsp;&nbsp; ` -1   -1   0    0    1    1`
&nbsp;
* &nbsp;&nbsp; `-1   2`
&nbsp;&nbsp; `0    3`
&nbsp;&nbsp; `1    4`
&nbsp;
* &nbsp;&nbsp; `-1.5   1.5`
&nbsp;&nbsp; `-1.5   1.5`
&nbsp;&nbsp; `-1.5   1.5`

