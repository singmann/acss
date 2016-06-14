#' Block Decomposition Method
#' 
#' Obtain Complexity of Longer Strings than allowed by ACSS via the Block Decomposition Method.
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' @param alphabet \code{numeric}, the number of possible symbols (not necessarily actually appearing in \code{string}). Must be one of \code{c(2, 4, 5, 6, 9)} (must be a scalar value in the current implementation). Default is 9.
#' @param span size of substrings/windows to be created from \code{string}. Default is 10.
#' @param delta distance between two windows. Default is \code{delta = span} (the maximum) in which the decomposition is disjoint, hence a partition. In the default setting the last substring is not of length \code{span} if the length of the string is not divisible by \code{span}. If \code{delta = 1} the substrings are all of length \code{span} and maximally overlap. 
#' @param print_substrings logical. Should substrings be printed to the console? Default is \code{FALSE}. Mainly for debugging purposes. 
#' 
#' 
#' @example examples/examples.bdm.R
#' 

#' @export
bdm <- function(string,delta=span,alphabet=9,span=10, print_substrings=FALSE) 
  {
# string is the string which BDM is to be computed
# delta is the distance between two windows
# span is the length of windows
# alphabet is as in ACSS
	check_string(string)
  l <- nchar(string)
	alphabet <- as.numeric(alphabet)
	
	# checking a few stuffs
	if (delta<1) stop("delta should be a positive integer.")
	if (delta>span) warning("delta superior to span (delta must be smaller or equal to span).", call. = FALSE)
	if (!(alphabet %in% c(2,4,5,6,9))) stop("alphabet must be in c(2, 4, 5, 6, 9)")
	if (span<2) stop("span must be an integer larger than 1.")
	if (span>10) warning("spans larger than 10 might yield NAs", call. = FALSE)
	if (any(vapply((l-span), `%%`, e2 = delta, 0) != 0)) warning("delta is not a divisor of length-span. Not all windows are of size ", span, ".", call. = FALSE)
	
	# function
	#k <- vapply((l-span), FUN = `%/%`, e2 = delta, 0)  # number of substrings to consider
	#start <- lapply(k, function(x) 1+0:x)  # where the substrings start #
	#stop <- lapply(start, function(x) x+delta)
	start <- lapply(l, function(x) seq(1, to = (x-(span-1)), by = delta))
	stop <- lapply(start, function(x) x+(span-1))
	for (i in seq_along(string)) {
	  if (stop[[i]][length(stop[[i]])] != l[i]) {
	    start[[i]] <- c(start[[i]], start[[i]][length(start[[i]])] + delta)
	    stop[[i]] <- c(stop[[i]], l[i])
	  }
	}
	substrings <- lapply(seq_along(string), function(x) substring(string[[x]], first = start[[x]], last=stop[[x]]))
	if (print_substrings) {
	  names(substrings) <- string
	  print(substrings)
	}
	t_subtrings <- lapply(substrings, table)
	acss_substr <- lapply(t_subtrings, function(x) acss(rownames(x),alphabet=alphabet)[,1])
	out <- vapply(seq_along(acss_substr), function(x) sum(log(t_subtrings[[x]], base = alphabet)+acss_substr[[x]]), 0)
	names(out) <- string
	return(out)
}

