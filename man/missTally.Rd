% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scorehelpers.R
\name{missTally}
\alias{missTally}
\title{Determine the number (or proportion) of missing (or non-missing) items
for each respondent}
\usage{
missTally(dfItems, what = c("pmiss", "nmiss", "pvalid", "nvalid"))
}
\arguments{
\item{dfItems}{A data frame containing only the items of interest.}

\item{what}{One of four quoted names indicating the value you want for each
respondent (row) in \code{dfItems}: (1) \code{"pmiss"} (the default), for the
proportion of items that are missing; (2) \code{"nmiss"}, for the number of items
that are missing; (3) \code{"pvalid"}, for the proportion of items that are valid,
non-missing; and (4) \code{"nvalid"} for the number of items that are valid,
non-missing.}
}
\value{
A vector of length \code{nrow(dfItems)} that contains the quantity
requested in \code{what} for each row of \code{dfItems}.
}
\description{
This is a handy helper function that can be used in PRO scoring
functions to determine the number (or proportion) of item responses that
are missing (or valid) for each row in a data frame of items.  This is used
by \code{\link{scoreScale}} to help determine if a respondent has answered enough
items to be assigned a prorated scale score.
}
\examples{
set.seed(8675309)
#  Make data frame with 10 respondents, 10 items, and approx 30\% missing data
(myItems <- makeFakeData(n = 10, nitems = 10, propmiss = .30))
#  The default is to return "pmiss", the proportion missing for each row.
missTally(myItems)
missTally(myItems, "pvalid")
missTally(myItems, "nmiss")
missTally(myItems, "nvalid")
}
