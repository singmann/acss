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
}

