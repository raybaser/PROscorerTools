#' PROscorerTools
#'
#' @description Tools to score Patient-Reported Outcome (PRO), Quality
#'   of Life (QoL), and other psychometric measures and
#'   questionnaire-based instruments.
#'
#' @details Provides a set of reliable and flexible tools to score PRO, QoL, and
#'   other psychometric and psychological measures.  Additionally,
#'   \pkg{PROscorerTools} provides the infrastructure for the scoring functions
#'   in the \pkg{\link{PROscorer}} package.
#'
#'   The \code{\link{scoreScale}} function is the workhorse of
#'   \pkg{PROscorerTools}, and it can be used to score most single-scale
#'   measures. For example, it can reverse code some or all items before
#'   scoring, and it can generate different types of scores (sum scores, mean
#'   scores, or scores scaled to range from 0 to 100).  It and the other
#'   \pkg{PROscorerTools} functions can be used together to flexibly write new
#'   functions that score more complex, multi-scale measures.
#'
#'   The \code{\link{scoreScale}} function itself is composed of other
#'   \pkg{PROscorerTools} helper functions.  This is an intentional feature of
#'   the \pkg{PROscorerTools} and \pkg{\link{PROscorer}} system.  It represents
#'   the central design philosophy that all scoring functions should be
#'   modularly composed of a small number of well-tested, reliable helper
#'   functions.  This important feature minimizes the possibility of scoring
#'   errors and other unexpected behaviors.  This starts with the
#'   \code{\link{scoreScale}} function, and the benefits extend to the
#'   \pkg{\link{PROscorer}} functions and any other scoring function that uses
#'   \code{\link{scoreScale}} as its backbone.
#'
#'   Scoring procedures represent a major source of error in research studies
#'   that rely upon PRO and similar measures.  These errors typically go
#'   unnoticed, hidden, and/or ignored, eroding the scientific integrity of the
#'   research and hindering progress in the numerous scientific fields that
#'   conduct studies that use these measures.  A seemingly minor scoring error
#'   can compromise measurement validity and reliability, as well as make
#'   research results impossible to reproduce and replicate. The ultimate goal
#'   of the \pkg{PROscorerTools} and \pkg{\link{PROscorer}} packages is to
#'   eliminate these serious deficiencies in PRO-based research by providing a
#'   small set of gold-standard scoring tools for PRO-like measures commonly
#'   used in research.
#'
#' @section Overview of Functions:
#'
#' \strong{Main scoring workhorse:}
#' \itemize{
#'   \item{\code{\link{scoreScale}}}{:  Scores a single scale score from a set
#'     of items.  Has flexible arguments allowing almost any type of single
#'     scale to be scored.  Can be used as the primary building block of more
#'     complex scoring functions.  For example, if you are writing a new
#'     function to score an instrument with 4 subscales, you can call
#'     \code{\link{scoreScale}} 4 times from within your function, once for each
#'     subscale.}
#' }
#'
#' \strong{Functions useful within another scoring function, or on their own:}
#' \itemize{
#'   \item{\code{\link{missTally}}}{:  Count the number or proportion of items
#'     missing (or non-missing) for each subject.}
#'   \item{\code{\link{rerange}}}{:  Linearly rescale a variable to have new min
#'     and max values of the user's choosing.}
#'   \item{\code{\link{rerange100}}}{:  Like \code{\link{rerange}}, but variable
#'     is rescaled to range from 0 to 100.}
#'   \item{\code{\link{revcode}}}{:  Reverse code the values of an item or score.}
#'   \item{\code{\link{makeItemNames}}}{:  Easily make a vector of item names,
#'     e.g., \code{c("Q1", "Q2", "Q3")}.}
#'   \item{\code{\link{makeFakeData}}}{:  Quick and dirty way to generate fake
#'     item data to test scoring functions.}
#' }
#'
#' \strong{Functions mainly useful only within another scoring function:}
#'
#' These functions are used to check the arguments supplied to custom-written
#' scoring functions, and to perform some minimal processing of function input.
#' \strong{USE WITH CAUTION, IF AT ALL.}  These will probably be deprecated in a
#' near-future version of the package.
#'
#' \itemize{
#'   \item{\code{\link{msgWrap}}}{:  Used inside of \code{paste} to help
#'     line-wrap long error and warning messages.}
#'   \item{\code{\link{chk_nitems}}}{:  Checks if a data frame has the correct
#'     number of items.}
#'   \item{\code{\link{chkstop_nitems}}}{:  Checks if a data frame has the correct
#'     number of items, and gives an error message if it does not.}
#'   \item{\code{\link{chk_values}}}{:  Checks if all item values in a data
#'     frame are in the expected set of possible values.}
#'   \item{\code{\link{chkstop_values}}}{:  Checks if all item values in a data
#'     frame are in the expected set of possible values, and gives an error
#'     message if this is not true.}
#'   \item{\code{\link{get_dfItems}}}{:  Given a data frame and an item index,
#'     returns a data frame containing only the items.}
#'   \item{\code{\link{get_dfItemsrev}}}{:  Like \code{\link{get_dfItems}}, but
#'     will also reverse code some or all of the items.}
#' }
#'
#' @section Internal Functions Used by \code{\link{scoreScale}}:
#'
#' These are internal functions used to make the \code{\link{scoreScale}}
#' function more modular, and are used exclusively to check the arguments to
#' that function.  They will likely be of little use to others, and will almost
#' definitely change in a near-future version of the package.  They are
#' documented here only for development purposes.
#'
#' \itemize{
#'   \item{\code{\link{chkstop_df}}}{:  }
#'   \item{\code{\link{chkstop_okmiss}}}{:  }
#'   \item{\code{\link{chkstop_type}}}{:  }
#'   \item{\code{\link{chkstop_revitems}}}{:  }
#'   \item{\code{\link{chk_imin}}}{:  }
#'   \item{\code{\link{chk_imax}}}{:  }
#'   \item{\code{\link{chkstop_minmax}}}{:  }
#' }
#'
#'
#' @name PROscorerTools
#'
#' @docType package
NULL
