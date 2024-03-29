#' Quick method to see how robust a list of ID codes is to erasures
#'
#' Given a list (or matrix) of generated numeric ID codes, this function does a crosswise comparison. It compares the 'Hamming distance' between every pair of given ID sequences, then returns a contingency table with the frequency of Hamming distances found. These Hamming distances represent how robust the coding scheme is to erasure errors. If a particular robustness to erasure is desired, there should be no distances equal to or lower than that robustness.
#'
#' @param codes a list of numeric ID sequences generated by \code{\link{rs_IDs}}, \code{\link{brute_IDs}}, or \code{\link{tweaked_IDs}}. This can be either in matrix or list form.
#'
#' @return a named, flattened list that contains a contingency table with the frequency of crosswise Hamming distances
#'
#' @author Andrew Burchill, \email{andrew.burchill@asu.edu}
#' @seealso \code{\link{how_many}}.
#' @references  For information on \href{https://en.wikipedia.org/wiki/Hamming_distance}{Hamming distances}.
#'
#'  For information on \href{https://en.wikipedia.org/wiki/Erasure_code}{erasure coding}.
#'
#'    Burchill, A. T., & Pavlic, T. P. (2019). Dude, where's my mark? Creating robust animal identification schemes informed by communication theory. \emph{Animal Behaviour}, 154, 203-208. \href{https://doi.org/10.1016/j.anbehav.2019.05.013}{doi:10.1016/j.anbehav.2019.05.013}
#' @examples
#'  #Let's generate some unique IDs given:
#' total.length <- 4  #we have four positions to mark,
#' redundancy <- 2    #we're interested in being robust to two erasures,
#' alphabet <- 5      #and we currently have five types of color bands in stock
#'
#' codes <- rs_IDs(total.length, redundancy, alphabet)
#'  #Given that we specified a robustness of 2,
#'  #there should be no counts of "dist.2" or lower
#' how_robust(codes)
#'
#'
#' @export
#' @importFrom stringdist seq_distmatrix
#' @importFrom methods is


how_robust <- function(codes) {
  if (is(codes, "matrix")) {
    codes <- split(codes, 1:nrow(codes))
    names(codes) <- NULL
  } else if (!is(codes,"list")) {
    stop("Error: the variable 'codes' must be either a list of numeric sequences or a matrix, where each row is a unique sequence.")
  } else if (!is(codes[[1]],"numeric")) {
    stop("Error: the variable 'codes' must be either a list of numeric sequences or a matrix, where each row is a unique sequence.")
  }

  hams <- table(unlist(stringdist::seq_distmatrix(codes,codes,method = "hamming")))
  hams <- as.list(hams)
  try(hams$'0' <- hams$'0' - length(codes), silent = TRUE)
  try(if (hams$'0' == 0) hams$'0' <- NULL, silent = TRUE)
  names(hams) <- paste0("Pairs w/ Hamming dist. ",names(hams))
  return(unlist(hams))
}
