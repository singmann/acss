#' Helper functions for calculating cognitive complexity.
#'
#' These function normalise a string using the symbols 0, 1, 2...9 in this order or return the total number of strings in the class of string
#'
#' @usage normalize(string)
#'
#' CountClass(string, n)
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' @param n \code{numeric}, the number of possible symbols (not necessarily actually appearing in str).
#' 
#' @return 
#' \describe{
#'  \item{\code{normalize}}{A normalized string of the same length as \code{string}.}
#'  \item{\code{CountClass}}{The number of possible strings.}
#' }
#' 
#' @details nothing yet.
#' 
#' @name normalize
#' @aliases normalize CountClass
#' @export normalize CountClass
#' 
#' @examples normalize(c("HUHHEGGTE", "EGGHHU"))
#' 

normalize <- function(string){
    splitted <- strsplit(string, "")
    elements <- sort(unique(unlist(splitted)))
    if (length(elements)>10) stop("two many symbols (more than 10)")
    for (i in seq_along(elements)) string <- gsub(elements[i], i-1, string)
    string
}


########## CountClass
# defines function CountClass(string)=number of strings in the class of string
# str is a string, n the number of possible symbols (not necessarily actually appearing in str).
# str must be normalized (or add the 2d line)
CountClass=function(string,n){
	str=normalize(string) # you can ignore this is "str" is already normalized.
	str=strsplit(str,"")[[1]] # change string in vector to apply grep
	x=as.numeric(str)
	k=max(x)+1
	result=factorial(n)/factorial(n-k)
	return(result)
}
