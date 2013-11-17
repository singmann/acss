#' Standard measures of complexity for strings
#' 
#' Functions to compute different measures of complexity for strings: Entropy, Second Order Entropy, and Change Complexity
#' 
#' @usage entropy(string)
#' 
#' entropy2(string)
#' 
#' change_complexity(string)
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' 
#' @return \code{numeric}, the complexity of the string.
#' 
#' @details nothing again.
#' 
#' @name entropy
#' @aliases entropy entropy2 change_complexity
#' @export entropy entropy2 change_complexity
#' 
#' @examples
#' entropy(normalize(c("HUHHEGGTE")))
#' entropy2(normalize(c("HUHHEGGTE")))
#' 
#' 

######### Entropy
# returns the entropy of a given string.
# there is a package already : http://cran.r-project.org/web/packages/entropy/entropy.pdf
# but it is too complicated for our purpose.
entropy=function(string){
  str=strsplit(string,"")[[1]]
  y=as.vector(table(str))
  m=sum(y)
  y=y/m
  y=y*log2(y)
  result=-sum(y)
  return(result)
}

########## Second order entropy
# There are different ways to compute second order entropy. Because we have small strings, I prefer using a sliding window of 2 symbols.
entropy2=function(string){
  l=nchar(string)
  str=strsplit(string,"")[[1]]
  str2=rep(0,l-1)
  for (i in 1:l-1) {str2[i]=paste(as.character(str[i]),str[i+1],sep="")}
  y=as.vector(table(str2))
  m=sum(y)
  y=y/m
  y=y*log2(y)
  result=-sum(y)
  return(result)
}


# ref : Aksentijevic & Gibson (2012) Complexity equals change, Cognitive Systems Research, 15-17, 1-16
## change complexity for a binary string s


change_complexity=function(string){
  s=strsplit(string,"")[[1]]
  y=as.vector(table(s))
  s
  # to be continued...
}

