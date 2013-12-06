#' ACSS complexity
#' 
#' Functions to conveniently compute algorithmic complexity for short string, an approximation of the Kolmogorov Complexity of a short string using the coding theorem method.
#' 
#' @usage acss2(string)
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' 
#' 
#' @examples
#' 
#' acss2(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS"))
#' 
#' @name acss2
#' @aliases acss2
#' @export acss2
#' @importFrom filehash dbInit dbExists dbMultiFetch



".onLoad" <- function(libname, pkgname) {
  assign("acss", new.env(parent = globalenv()), envir=.GlobalEnv)
  assign("acss2", dbInit(system.file("extdata", "acss2sql", package = "acss"), type = "SQLite"), envir = acss)
}


#################################
#### Basic algorithmic complexity and probability
#################################
acss2 <- function(string) {
  string_df <- normalize(string)
  if (any(string_df$symbols > 2)) ("string has more than 2 different symbols. Fir these strings complexity CANNOT be in this database!")
  string <- paste0("s", string_df$string)
  string_found <- dbExists(db=get("acss2", envir = acss), key=string)
  K <- rep(NA, length(string))
  K[string_found] <- vapply(dbMultiFetch(db = get("acss2", envir = acss), key=string[string_found]), "[[", 0.0, i = 1)
  D <- ifelse(!is.na(K), 2^(-K), 0)  
  cbind(K, D)
}


