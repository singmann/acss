#' Block Decomposition Method
#' 
#' Obtain Complexity of Longer Strings than allowed by ACSS via the Block Decomposition Method.
#' 
#' @param string \code{character} vector containing the to be analyzed strings (can contain multiple strings).
#' @param alphabet \code{numeric}, the number of possible symbols (not necessarily actually appearing in \code{string}). Must be one of \code{c(2, 4, 5, 6, 9)} (must be a scalar value in the current implementation). Default is 9.
#' @param blocksize size of blocks/substrings/windows to be created from \code{string}. Default is 10. Values larger than 10 will elicit a warning as not all strings with length > 10 are represented for all alphabets.
#' @param delta distance between two blocks. Default is \code{delta = blocksize} (the maximum) in which the decomposition is disjoint, hence a partition (i.e., there is no overlap between blocks). In the default setting the last block is not of length \code{blocksize} if the length of the string is not divisible by \code{blocksize}. If \code{delta = 1} the blocks are all of length \code{blocksize} and maximally overlap. 
#' @param print_blocks logical. Should blocks be printed to the console? Default is \code{FALSE}. Mainly for debugging purposes. 
#' 
#' 
#' @example examples/examples.bdm.R
#' 

#' @export
bdm <- function(string,blocksize=10, alphabet=9, delta=blocksize, print_blocks=FALSE) 
  {
# string is the string which BDM is to be computed
# delta is the distance between two windows
# blocksize is the length of windows
# alphabet is as in ACSS
	check_string(string)
  l <- nchar(string)
	alphabet <- as.numeric(alphabet)
	
	# checking a few stuffs
	if (delta<1) stop("delta should be a positive integer.")
	if (delta>blocksize) warning("delta superior to blocksize (delta must be smaller or equal to blocksize).", call. = FALSE)
	if (!(alphabet %in% c(2,4,5,6,9))) stop("alphabet must be in c(2, 4, 5, 6, 9)")
	if (blocksize<2) stop("blocksize must be an integer larger than 1.")
	if (blocksize>10) warning("blocksizes larger than 10 might yield NAs", call. = FALSE)
	if (any(vapply((l-blocksize), `%%`, e2 = delta, 0) != 0)) warning("delta is not a divisor of length-blocksize. Not all windows are of size ", blocksize, ".", call. = FALSE)
	
	# function
	start <- lapply(l, function(x) seq(1, to = (x-(blocksize-1)), by = delta))
	stop <- lapply(start, function(x) x+(blocksize-1))
	for (i in seq_along(string)) {
	  if (stop[[i]][length(stop[[i]])] != l[i]) {
	    start[[i]] <- c(start[[i]], start[[i]][length(start[[i]])] + delta)
	    stop[[i]] <- c(stop[[i]], l[i])
	  }
	}
	substrings <- lapply(seq_along(string), function(x) substring(string[[x]], first = start[[x]], last=stop[[x]]))
	if (print_blocks) {
	  names(substrings) <- string
	  print(substrings)
	}
	t_subtrings <- lapply(substrings, table)
	acss_substr <- lapply(t_subtrings, function(x) acss(rownames(x),alphabet=alphabet)[,1])
	out <- vapply(seq_along(acss_substr), function(x) sum(log(t_subtrings[[x]], base = alphabet)+acss_substr[[x]]), 0)
	names(out) <- string
	return(out)
}

