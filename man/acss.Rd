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
  of \code{c(2, 4, 5, 6, 9)} (can also be \code{NULL} or
  contain multiple values for \code{acss}). Default is 9.}

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
\details{
The algorithmic complexity is computed using the coding
theorem method: For a given set of symbols in a string, all
possible or a large number of random samples of Turing
machines (TM) with a given number of states (e.g., 5) and
number of symbols corresponding to the number of symbols in
the strings were simulated until they reached a halting
state or failed to end. This package accesses a database
containing data on 4.5 million strings from length 1 to 12
simulated on TMs with 2, 4, 5, 6, and 9 symbols. The
complexity of the string corresponds to the distribution of
the halting states of the TMs.

See \url{http://complexitycalculator.com/methodology.html}
for more information or references below.
}
\note{
The first time per session one of the functions described
here is used, a relatively large dataset is loaded into
memory which can take a considerable amount of time (> 10
seconds).
}
\examples{

# WARNING: The first call to one of the functions
# discussed on this page loads a large data set 
# and usually takes > 10 seconds. Stay patient.

acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"))
##                 K.9          D.9
## HEHHEE     23.38852 9.106564e-08
## GHHGGHGHH  33.50168 8.222205e-11
## HSHSHHSHSS 35.15241 2.618613e-11

acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"))$K.9
## [1] 23.38852 33.50168 35.15241

acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"), n = 2)
##                 K.2          D.2
## HEHHEE     14.96921 3.117581e-05
## GHHGGHGHH  25.60208 1.963387e-08
## HSHSHHSHSS 26.90906 7.935321e-09

acss(c("HEHHEE", "GHHGGHGHUE", "HSHSHHSHSS"), NULL)
##                 K.2      K.4      K.5      K.6      K.9
## HEHHEE     14.96921 18.55227 19.70361 20.75762 23.38852
## GHHGGHGHUE       NA 31.75832 33.00795 34.27457 37.78935
## HSHSHHSHSS 26.90906 29.37852 30.52566 31.76229 35.15241
##                     D.2          D.4          D.5          D.6
## HEHHEE     3.117581e-05 2.601421e-06 1.171176e-06 5.640722e-07
## GHHGGHGHUE           NA 2.752909e-10 1.157755e-10 4.812021e-11
## HSHSHHSHSS 7.935321e-09 1.432793e-09 6.469341e-10 2.745360e-10
##                     D.9
## HEHHEE     9.106564e-08
## GHHGGHGHUE 4.209915e-12
## HSHSHHSHSS 2.618613e-11

\dontrun{
prob_random(c("HEHHEE", "GHHGGHGHUE", "HSHSHHSHSS"))
##     HEHHEE GHHGGHGHUE HSHSHHSHSS 
## 0.31223451 0.09675417 0.01692974 

prob_random(c("HEHHEE", "GHHGGHGHUE", "HSHSHHSHSS"), n = 5)
##     HEHHEE GHHGGHGHUE HSHSHHSHSS 
## 0.39406436 0.30998532 0.07441426 
}

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
\references{
Delahaye, J.-P., & Zenil, H. (2012). Numerical evaluation
of algorithmic complexity for short strings: A glance into
the innermost structure of randomness. \emph{Applied
Mathematics and Computation}, 219(1), 63-77.
doi:10.1016/j.amc.2011.10.006

Gauvrit, N., Zenil, H., Delahaye, J.-P., & Soler-Toscano,
F. (2014). Algorithmic complexity for short binary strings
applied to psychology: a primer. \emph{Behavior Research
Methods}. doi:10.3758/s13428-013-0416-0

Soler-Toscano, F., Zenil, H., Delahaye, J.-P., & Gauvrit,
N. (2012). \emph{Calculating Kolmogorov Complexity from the
Output Frequency Distributions of Small Turing Machines}.
arXiv:1211.1302 [cs.it].
}

