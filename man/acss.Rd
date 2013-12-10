\name{acss}
\alias{acss}
\alias{local_complexity}
\alias{prob_random}
\title{ACSS complexity}
\usage{
acss(string, n)

prob_random(string, n = 9, prior= 0.5)

local_complexity(string, span = 5, n = 9)
}
\arguments{
  \item{string}{\code{character} vector containing the to
  be analyzed strings (can contain multiple strings).}

  \item{n}{\code{numeric}, the number of possible symbols
  (not necessarily actually appearing in str). Must be one
  of \code{c(2, 4, 5, 6, 9)}. Default is 9.}

  \item{prior}{\code{numeric}, the prior probability that
  the underlying process is randomness.}

  \item{span}{size of substrings to be created from
  \code{string}.}
}
\description{
Functions to conveniently compute algorithmic complexity
for short string, an approximation of the Kolmogorov
Complexity of a short string using the coding theorem
method.
}
\note{
The first time per session one of the functions described
here is used, a relatively large dataset is loaded into
memory which can take a considerable amount of time (> 10
seconds).
}
\examples{
acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"))
##              K.9              D.9
## 010011     23.39 0.00000009106564
## 011001011  33.50 0.00000000008222
## 0101001011 35.15 0.00000000002619

acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"))$K
## [1] 23.39 33.50 35.15

acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"), n = 2)
##              K.2            D.2
## 010011     14.97 0.000031175806
## 011001011  25.60 0.000000019634
## 0101001011 26.91 0.000000007935

acss(c("HEHHEE", "GHHGGHGHUE", "HSHSHHSHSS"), NULL)
##              K.2   K.4   K.5   K.6   K.9            D.2
## 010011     14.97 18.55 19.70 20.76 23.39 0.000031175806
## 0110010123    NA 31.76 33.01 34.27 37.79             NA
## 0101001011 26.91 29.38 30.53 31.76 35.15 0.000000007935
##                        D.4             D.5              D.6
## 010011     0.0000026014212 0.0000011711762 0.00000056407225
## 0110010123 0.0000000002753 0.0000000001158 0.00000000004812
## 0101001011 0.0000000014328 0.0000000006469 0.00000000027454
##                         D.9
## 010011     0.00000009106564
## 0110010123 0.00000000000421
## 0101001011 0.00000000002619

prob_random(c("HEHHEE", "GHHGGHGHUE", "HSHSHHSHSS"))
## [1] 0.31223 0.09675 0.01693
prob_random(c("HEHHEE", "GHHGGHGHUE", "HSHSHHSHSS"), n = 5)
## [1] 0.39406 0.30999 0.07441

local_complexity(c("01011010111" ,"GHHGGHGHUE"), span=5, n = 5)
## $`01011010111`
## [1] 16.22 16.25 16.25 16.22 16.24 16.22 15.94
##
## $GHHGGHGHUE
## [1] 16.45 16.45 16.25 16.22 16.59 16.86

local_complexity(c("01011010111" ,"GHHGGHGHUE"), span=7)
## $`01011010111`
## [1] 26.52 26.52 26.48 26.62 26.29
##
## $GHHGGHGHUE
## [1] 27.05 26.87 27.31 27.84
}

