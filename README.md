[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/acss)](http://cran.r-project.org/package=acss)
[![Travis-CI Build Status](https://travis-ci.org/singmann/acss.svg?branch=master)](https://travis-ci.org/singmann/acss)
[![Coverage Status](https://img.shields.io/codecov/c/github/singmann/acss/master.svg)](https://codecov.io/github/singmann/acss?branch=master)


acss: measures of algorithmic complexity in R. 
====

## Features

* Main functionality is to provide the algorithmic complexity for short strings, an approximation of the Kolmogorov Complexity of a short string using the coding theorem method (see ?acss). The database containing the complexity is provided in the data only package acss.data, this package provides functions accessing the data such as prob_random returning the posterior probability that a given string was produced by a random process. In addition, two traditional (but problematic) measures of complexity are also provided: entropy and change complexity.

For a full introduction see our introductory package:
Gauvrit, N., Singmann, H., Soler-Toscano, F., & Zenil, H. (2016). Algorithmic complexity for psychology: a user-friendly implementation of the coding theorem method. Behavior Research Methods, 48(1), 314-329. [http://doi.org/10.3758/s13428-015-0574-3](http://doi.org/10.3758/s13428-015-0574-3)

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.


## Installation

* From CRAN:
```
install.packages("acss")
```

* Development version from Github:
```
library("devtools"); install_github("acss",user="singmann")
```

