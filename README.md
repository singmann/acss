acss: measures of algorithmic complexity in R. 
====

## Features

* Main functionality is to provide the algorithmic complexity for short strings, an approximation of the Kolmogorov Complexity of a short string using the coding theorem method (see ?acss). The database containing the complexity is provided in the data only package acss.data, this package provides functions accessing the data such as prob_random returning the posterior probability that a given string was produced by a random process. In addition, two traditional (but problematic) measures of complexity are also provided: entropy and change complexity.

## Installation

* From CRAN:
```
install.packages("acss")
```

* Development version from Github:
```
library("devtools"); install_github("acss",user="singmann")
```
