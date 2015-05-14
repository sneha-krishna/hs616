Web Scraping

=======================================================
author: Sneha Krishna

Read HTML Table
========================================================
```{r life_expectancy}
site <- "http://en.wikipedia.org/wiki/List_of_countries_by_life_expectancy"
mydf <- XML::readHTMLTable(site, which=3, stringsAsFactors=F)
kable(head(mydf))
```


|Rank |state/territory    |Overall |Male  |Female |
|:----|:------------------|:-------|:-----|:------|
|1    |Japan              |82.73   |79.29 |86.96  |
|2    |Switzerland        |81.81   |79.31 |84.12  |
|3    |Hong Kong ( China) |81.61   |79.04 |84.30  |
|4    |Australia          |81.44   |79.12 |84     |
|5    |Italy              |81.37   |78.58 |83.98  |
|6    |Iceland            |81.28   |79.49 |83.05  |


rvest: easy web scraping with R
========================================================
rvest is a R package that makes it easy to scrape (or harvest) data from html web pages.
Currently, rvest is not available on CRAN, the official repository of R packages. You will need to download the source code directly from the GitHub repository.

Install rvest: 
`packages("devtools") devtools::install_github("hadley/rvest") library(rvest)`


Some useful functions in rvest
========================================================

You can use xpath selectors instead of css: `html_nodes(doc, xpath = "//table//td")`.

Extract the tag names with `html_tag()`, text with `html_text()`, a single attribute with `html_attr()` or all attributes with `html_attrs()`.

Navigate around a website as if you’re in a browser with `html_session()`, `jump_to()`, `follow_link()`, `back()`, and `forward()`. 

demos for the above functions (and more): demo(package = "rvest"). 

    
Selector Gadget
========================================================

Install selectorgadget== tool allows you to interactively click on parts of a web page and use a process of positive nad negative seletcion to generate CSS selectors for targeted information.
    
Selectorgadget can be used to figure out which css selector matches the data we want. 

Usefulle tutorial: http://selectorgadget.com/

How does it work?
Install tool  here: http://selectorgadget.com/
Go website for parsing.
1. Click on the selectorgagdget link in the bookmarks. 
2. Click on the element you want to select. Selectorgadget guesses which css selector you want.
3. Scroll around the document to find elements that you don’t want to match and click on them.
4. Once we’ve determined the css selector, we can use it in R to extract the values we want

Example here: http://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html

 
magrittr:: Simplifying R code with pipes
========================================================
  
  <table>
  <tr><td>
  !["Ceci n'est pas un pipe](http://upload.wikimedia.org/wikipedia/en/b/b9/MagrittePipe.jpg)
    </td><td>
    [%>%](http://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html)
    
    </td></tr>
    </table>

    
Example
========================================================

```r
# devtools::install_github("hadley/rvest")
library(magrittr)
library(rvest)
cigcancerpage <- html("http://lib.stat.cmu.edu/DASL/Datafiles/cigcancerdat.html")
txt_con <- cigcancerpage %>% 
  html_nodes("pre") %>% .[2] %>% 
  html_text() %>% textConnection()
headers <- readLines(txt_con,2) %>% .[2] %>% 
  gsub("^\\s+", "", .) %>%
  strsplit("\\s+") %>% .[[1]]
cigcancer <- read.delim(txt_con, header=F)
colnames(cigcancer) <- headers
```

========================================================


|STATE |   CIG| BLAD|  LUNG|  KID| LEUK|
|:-----|-----:|----:|-----:|----:|----:|
|AL    | 18.20| 2.90| 17.05| 1.59| 6.15|
|AZ    | 25.82| 3.52| 19.80| 2.75| 6.61|
|AR    | 18.24| 2.99| 15.98| 2.02| 6.94|
|CA    | 28.60| 4.46| 22.07| 2.66| 7.06|
|CT    | 31.10| 5.11| 22.83| 3.35| 7.20|
|DE    | 33.60| 4.78| 24.55| 3.36| 6.45|

[Cigarette Cancer Data](http://lib.stat.cmu.edu/DASL/Datafiles/cigcancerdat.html)

    
    Interesting Tables in Wikipedia
    ===
    
    http://en.wikipedia.org/wiki/List_of_cancer_mortality_rates_in_the_United_States
    http://en.wikipedia.org/wiki/List_of_countries_by_cancer_rate
    http://en.wikipedia.org/wiki/Prevalence_of_tobacco_consumption
    http://stats.wikimedia.org/EN/TablesWikipediaEN.htm
    