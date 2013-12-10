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
#' @param n \code{numeric}, the number of possible symbols (not necessarily actually appearing in str). Must be one of \code{c(2, 4, 5, 6, 9)}. Default is 9.
#' @param prior \code{numeric},  the prior probability that the underlying process is randomness.
#' @param span size of substrings to be created from \code{string}.
#' 
#' @note The first time per session one of the functions described here is used, a relatively large dataset is loaded into memory which can take a considerable amount of time (> 10 seconds).
#' 
#' @examples
#' 
#' acss(c("HEHHEE", "GHHGGHGHH", "HSHSHHSHSS")) 
#' 
#' @name acss
#' @aliases acss prob_random local_complexity
#' @export acss prob_random local_complexity
#' @importFrom zoo rollapply


acss <- function(string, n = 9) {
  string <- normalize(string)
  if (is.null(n)) tmp <- acss_data[string,]  
  else {
    if (!(n %in% c(2, 4, 5, 6, 9))) stop("n must be in c(2, 4, 5, 6, 9)")
    tmp <- acss_data[string, paste("K", n , sep = "."), drop = FALSE]
  }
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
    tmp <- tmp[!is.na(tmp$K),,drop = FALSE]
    tmp$count <- count_class(rownames(tmp), n = n)
    tmp$D <- 2^(-tmp$K)
    tmp
  })
  ptot <- vapply(subtables, function(x) sum(x$count*x$D), 0)
  psgivenr <- (1/n^lu)[match(l, lu)]
  psgiventm <- acss(string, n = n)$D/ptot[match(l, lu)]
  psgivenr*prior/(psgivenr*prior+psgiventm*(1-prior))
}

local_complexity <- function(string, span = 5, n = 9) {
  #browser()
  #l <- nchar(string)
  splitted <- strsplit(string,"")
  
  new.string <- lapply(splitted, function(x) rollapply(x, width = 5, FUN = paste0, collapse = ""))
  
  tmp <- lapply(new.string, function(x) acss(x, n = n)$K)
  names(tmp) <- string
  tmp
}
