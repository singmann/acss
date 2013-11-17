\name{entropy}
\alias{change_complexity}
\alias{entropy}
\alias{entropy2}
\title{Standard measures of complexity for strings}
\usage{
  entropy(string)

  entropy2(string)

  change_complexity(string)
}
\arguments{
  \item{string}{\code{character} vector containing the to
  be analyzed strings (can contain multiple strings).}
}
\value{
  \code{numeric}, the complexity of the string.
}
\description{
  Functions to compute different measures of complexity for
  strings: Entropy, Second Order Entropy, and Change
  Complexity
}
\details{
  nothing again.
}
\examples{
entropy(normalize(c("HUHHEGGTE")))
entropy2(normalize(c("HUHHEGGTE")))
}

