\name{normalize}
\alias{CountClass}
\alias{normalize}
\title{Helper functions for calculating cognitive complexity.}
\usage{
  normalize(string)

  CountClass(string, n)
}
\arguments{
  \item{string}{\code{character} vector containing the to
  be analyzed strings (can contain multiple strings).}

  \item{n}{\code{numeric}, the number of possible symbols
  (not necessarily actually appearing in str).}
}
\value{
  \describe{ \item{\code{normalize}}{A normalized string of
  the same length as \code{string}.}
  \item{\code{CountClass}}{The number of possible strings.}
  }
}
\description{
  These function normalise a string using the symbols 0, 1,
  2...9 in this order or return the total number of strings
  in the class of string
}
\details{
  nothing yet.
}
\examples{
normalize(c("HUHHEGGTE", "EGGHHU"))
}

