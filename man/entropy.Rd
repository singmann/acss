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
  be analyzed strings (can contain multiple strings for the
  entropy measures).}
}
\value{
\code{numeric}, the complexity of the string. For
\code{entropy} and \code{entropy2} of the same length as
\code{string}. \code{change_complexity} currently only
works with inputs of length 1.
}
\description{
Functions to compute different measures of complexity for
strings: Entropy, Second-Order Entropy, and Change
Complexity
}
\details{
For users who need advanced functions, a comprehensive
package computing various versions of entropy estimators is
available \pkg{entropy}. For users who just need first and
second-order entropy and which to apply them to short
string, the \pkg{acss} package provides two functions:
\code{entropy} (first-order entropy) and \code{entropy2}
second-order entropy.

Change complexity (\code{change_complexity}) assesses
cognitive complexity or the subjective perception of
complexity of a binary string. It has been comprehensively
defined by Aksentijevic and Gibson (2012). Although the
algorithm will work with any number of symbols up to 10,
the rationale of Change Complexity only applies to binary
strings.
}
\examples{
strings1 <- c("010011010001", "0010203928837", "0000000000")
strings2 <- c("001011", "01213", "010101010101")

entropy(strings1)
entropy("XYXXYYXYXXXY") # "same" string as strings1[1]
entropy(c("HUHHEGGTE", "EGGHHU"))

entropy2(strings1)
entropy2("XYXXYYXYXXXY")

entropy2(strings2)

change_complexity(strings1)
change_complexity("XYXXYYXYXXXY")
}
\references{
Aksentijevic & Gibson (2012). Complexity equals change.
\emph{Cognitive Systems Research}, 15-17, 1-16.
}

