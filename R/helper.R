#' Helper functions for calculating cognitive complexity.
#'
#' \code{normalize_string} takes a character vector and normalizes its input using the symbols 0, 1, 2...9. \code{count_class} takes a character vector and an integer \code{n} (with the restriction that the number of different symbols in the character vector doesn't exceed \code{n}) and returns  the total number of strings that are equivalent to the input when normalized and considering \code{n}. \code{alternations} returns the number of alternations of symbols in a string.
#'
#' @usage normalize_string(string)
#'
#' count_class(string, n)
#' 
#' alternations(string, proportion = FALSE)
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' @param n \code{numeric}, the number of possible symbols (not necessarily actually appearing in str).
#' @param proportion \code{boolean}, indicating if the result from \code{alternation} should be given as a proportion (between 0 and 1) or the raw number of alternations (default is \code{FALSE} correpsonding to raw values).
#' 
#' @return 
#' \describe{
#'  \item{\code{normalize_string}}{A normalized vector of strings of the same length as \code{string}.}
#'  \item{\code{count_class}}{A vector of the same length as \code{string} with the number of possible equaivalent strings when \code{string} is normalized and considering \code{n}.}
#'  \item{\code{alternations}}{A vector with the number (or proprtion) of alternations of the same length as \code{string}}
#' }
#' 
#' @details nothing yet.
#' 
#' @name normalize_string
#' @aliases normalize_string count_class alternations
#' @export normalize_string count_class alternations
#' 
#' @examples
#' 
#' #normalize_string:
#' normalize_string(c("HUHHEGGTE", "EGGHHU"))
#' 
#' normalize_string("293948837163536")
#' 
#' # count_class
#' count_class("010011",2)
#' 
#' count_class("332120",4)
#' 
#' count_class(c("HUHHEGGTE", "EGGHHU"), 5)
#' count_class(c("HUHHEGGTE", "EGGHHU"), 6)
#' 
#' # alternations:
#' alternations("0010233")
#' alternations("0010233", proportion = TRUE)
#' 
#' alternations(c("HUHHEGGTE", "EGGHHU"))
#' alternations(c("HUHHEGGTE", "EGGHHU"), proportion = TRUE)
#' 

normalize_string <- function(string){
  splitted <- strsplit(string, "")
  elements <- lapply(splitted, unique)
  if (any(vapply(elements, length, 0)>10)) stop("two many symbols (more than 10)")
  exchanged <- mapply(function(x, y) seq(0, length.out = length(x))[match(y, x)], elements, splitted, SIMPLIFY=FALSE)  
  #data.frame(string = vapply(exchanged, paste, "", collapse = ""), symbols = vapply(exchanged, max, 0)+1, stringsAsFactors = FALSE)
  vapply(exchanged, paste, "", collapse = "")
}


########## CountClass
# defines function CountClass(string)=number of strings in the class of string
# str is a string, n the number of possible symbols (not necessarily actually appearing in str).
# str must be normalized (or add the 2d line)
count_class <- function(string,n){
	string <- normalize_string(string) # needs not be done for normalized strings
	splitted <- lapply(strsplit(string, ""), as.numeric)
  k <- vapply(splitted, max, 0) + 1
  max(k)
  if (any(k > n)) stop("n needs to be larger as the number of elements in each string.")
  ## to avoid unnecessary computations, compute factorial only for unique ks:
  unique.ks <- unique(k)
	tmp.results <- factorial(n)/factorial(n-unique.ks)
  tmp.results[match(k, unique.ks)]
}

alternations <- function(string, proportion = FALSE)  # if prop=FALSE, returns the number of alternations. Is prop=TRUE, returns the proportion of alternations.
{
  l <- nchar(string)
  splitted <- strsplit(string, "")
  a <- vapply(splitted, function(x) length(rle(x)$length) - 1, 0)
  if (proportion) a <- a/(l-1)
  return(a)
}


