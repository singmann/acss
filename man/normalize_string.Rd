\name{normalize_string}
\alias{alternations}
\alias{count_class}
\alias{normalize_string}
\title{Helper functions for calculating cognitive complexity.}
\usage{
normalize_string(string)

count_class(string, alphabet)

alternations(string, proportion = FALSE)
}
\arguments{
  \item{string}{\code{character} vector containing the to
  be analyzed strings (can contain multiple strings).}

  \item{alphabet}{\code{numeric}, the number of possible
  symbols (not necessarily actually appearing in string).}

  \item{proportion}{\code{boolean}, indicating if the
  result from \code{alternation} should be given as a
  proportion (between 0 and 1) or the raw number of
  alternations (default is \code{FALSE} correpsonding to
  raw values).}
}
\value{
\describe{ \item{\code{normalize_string}}{A normalized
vector of strings of the same length as \code{string}.}
\item{\code{count_class}}{A vector of the same length as
\code{string} with the number of possible equivalent
strings when \code{string} is normalized and considering
\code{alphabet}.} \item{\code{alternations}}{A vector with
the number (or proprtion) of alternations of the same
length as \code{string}} }
}
\description{
\code{normalize_string} takes a character vector and
normalizes its input using the symbols 0, 1, 2...9.
\code{count_class} takes a character vector and an integer
\code{alphabet} (with the restriction that the number of
different symbols in the character vector doesn't exceed
\code{alphabet}) and returns the total number of strings
that are equivalent to the input when normalized and
considering \code{alphabet}. \code{alternations} returns
the number of alternations of symbols in a string.
}
\details{
nothing yet.
}
\examples{
#normalize_string:
normalize_string(c("HUHHEGGTE", "EGGHHU"))

normalize_string("293948837163536")

# count_class
count_class("010011",2)

count_class("332120",4)

count_class(c("HUHHEGGTE", "EGGHHU"), 5)
count_class(c("HUHHEGGTE", "EGGHHU"), 6)

# alternations:
alternations("0010233")
alternations("0010233", proportion = TRUE)

alternations(c("HUHHEGGTE", "EGGHHU"))
alternations(c("HUHHEGGTE", "EGGHHU"), proportion = TRUE)
}

