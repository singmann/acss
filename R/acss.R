#' ACSS complexity
#' 
#' Functions to conveniently compute algorithmic complexity for short string, an approximation of the Kolmogorov Complexity of a short string using the coding theorem method.
#' 
#' @usage acss(string, n)
#' 
#' prob_random(string, n = 9, prior= 0.5)
#' 
#' local_complexity(string, span = 5, n = 9)
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' @param n \code{numeric}, the number of possible symbols (not necessarily actually appearing in str). Must be one of \code{c(2, 4, 5, 6, 9)} (can also be \code{NULL} or contain multiple values for \code{acss}). Default is 9.
#' @param prior \code{numeric},  the prior probability that the underlying process is randomness.
#' @param span size of substrings to be created from \code{string}.
#' 
#' @return
#' \describe{
#'   \item{"acss"}{A matrix in which the rows correspond to the strings entered and the columns to the algorithmic complexity K and the algorithmic probability D of the string (see \url{http://complexitycalculator.com/methodology.html}).}
#'   \item{"prob_random"}{A named vector with the probabilities that each string was produced by a random process (and not a Turing Machine) given the provided prior for being produced by a random process (default is 0.5).}
#'   \item{"local_complexity"}{A list with elements corresponding to the strings. Each list containes a named vector of algorithmic complexities (K) of all substrings in each string with length span.}
#'   }
#' 
#' @details The algorithmic complexity is computed using the coding theorem method: For a given set of symbols in a string, all possible or a large number of random samples of Turing machines (TM) with a given number of states (e.g., 5) and number of symbols corresponding to the number of symbols in the strings were simulated until they reached a halting state or failed to end. This package accesses a database containing data on 4.5 million strings from length 1 to 12 simulated on TMs with 2, 4, 5, 6, and 9 symbols. The complexity of the string corresponds to the distribution of the halting states of the TMs.
#' 
#' See \url{http://complexitycalculator.com/methodology.html} for more information or references below.
#' 
#' @references Delahaye, J.-P., & Zenil, H. (2012). Numerical evaluation of algorithmic complexity for short strings: A glance into the innermost structure of randomness. \emph{Applied Mathematics and Computation}, 219(1), 63-77. doi:10.1016/j.amc.2011.10.006 
#' 
#' Gauvrit, N., Zenil, H., Delahaye, J.-P., & Soler-Toscano, F. (2014). Algorithmic complexity for short binary strings applied to psychology: a primer. \emph{Behavior Research Methods}. doi:10.3758/s13428-013-0416-0
#' 
#' Soler-Toscano, F., Zenil, H., Delahaye, J.-P., & Gauvrit, N. (2012). \emph{Calculating Kolmogorov Complexity from the Output Frequency Distributions of Small Turing Machines}. arXiv:1211.1302 [cs.it].
#' 
#' @note The first time per session one of the functions described here is used, a relatively large dataset is loaded into memory which can take a considerable amount of time (> 10 seconds).
#' 
#' @example examples/examples.acss.R
#' 
#' @name acss
#' @aliases acss prob_random local_complexity
#' @export acss prob_random local_complexity
#' @importFrom zoo rollapply
#' @import acss.data
#' 


acss <- function(string, n = 9) {
  names <- string
  string <- normalize_string(string)
  if (is.null(n)) tmp <- acss_data[string,]  
  else {
    if (any(!(n %in% c(2, 4, 5, 6, 9)))) stop("n must be in c(2, 4, 5, 6, 9)")
    tmp <- acss_data[string, paste("K", n , sep = "."), drop = FALSE]
  }
  rownames(tmp) <- make.unique(names)
  D <- apply(tmp, c(1,2), function(x) 2^(-x))
  colnames(D) <- paste0("D.", substr(colnames(D), 3, 3))  
  cbind(tmp, D)
}


prob_random <- function(string, n = 9, prior= 0.5){
  if (!(n %in% c(2, 4, 5, 6, 9))) stop("n must be in c(2, 4, 5, 6, 9)")
  l <- nchar(string)
  lu <- unique(l)
  rn <- nchar(rownames(acss_data))
  subtables <- lapply(lu, function(x) {
    tmp <- acss_data[rn == x, paste0("K.", n), drop = FALSE]
    tmp <- tmp[!is.na(tmp[,paste0("K.", n)]),,drop = FALSE]
    tmp$count <- count_class(rownames(tmp), n = n)
    tmp$D <- 2^(-tmp[,paste0("K.", n)])
    tmp
  })
  ptot <- vapply(subtables, function(x) sum(x$count*x$D), 0)
  psgivenr <- (1/n^lu)[match(l, lu)]
  psgiventm <- acss(string, n = n)[,paste0("D.", n)]/ptot[match(l, lu)]
  tmp <- psgivenr*prior/(psgivenr*prior+psgiventm*(1-prior))
  names(tmp) <- string
  tmp
}

local_complexity <- function(string, span = 5, n = 9) {
  #browser()
  #l <- nchar(string)
  splitted <- strsplit(string,"")  
  new.string <- lapply(splitted, function(x) rollapply(x, width = span, FUN = paste0, collapse = ""))  
  tmp <- lapply(new.string, function(x) acss(x, n = n)[,paste0("K.", n)])
  tmp <- mapply(function(x,y) {
    names(x) <- y
    return(x)}, tmp, new.string)
  names(tmp) <- string
  tmp
}
