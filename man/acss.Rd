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
\value{
\describe{ \item{"acss"}{A matrix in which the rows
correspond to the strings entered and the columns to the
algorithmic complexity K and the algorithmic probability D
of the string (see
\url{http://complexitycalculator.com/methodology.html}).}
\item{"prob_random"}{A named vector with the probabilities
that each string was produced by a random process (and not
a Turing Machine) given the provided prior for being
produced by a random process (default is 0.5).}
\item{"local_complexity"}{A list with elements
corresponding to the strings. Each list containes a named
vector of algorithmic complexities (K) of all substrings in
each string with length span.} }
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
##    01011    10110    01101    11010    10101    01011    10111 
## 16.22469 16.24766 16.24766 16.22469 16.24322 16.22469 15.93927 
## 
## $GHHGGHGHUE
##    GHHGG    HHGGH    HGGHG    GGHGH    GHGHU    HGHUE 
## 16.44639 16.44639 16.24766 16.22469 16.58986 16.86449 


local_complexity(c("01011010111" ,"GHHGGHGHUE"), span=7)
## $`01011010111`
##  0101101  1011010  0110101  1101011  1010111 
## 26.52068 26.52068 26.47782 26.62371 26.29186 
## 
## $GHHGGHGHUE
##  GHHGGHG  HHGGHGH  HGGHGHU  GGHGHUE 
## 27.04623 26.86992 27.30871 27.84322 
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

