#' rabi: a package for generating \strong{R}obust \strong{A}nimal \strong{B}ehavior \strong{I}Ds
#'
#' This package facilitates the design and generation of color (or symbol) codes that can be used to mark and identify individual animals. These codes can be selected such that the IDs are robust to partial erasure: even if parts of the code are lost, the entire identity of the animal can be reconstructed Thus, animal subjects are not confused and no ambiguity is introduced.
#'
#' Rigorous study of animal behavior, is often dependent on the researcher's ability to track and maintain the unique identity of individual animals or groups. Most individual animals are not reliably recognized on the intra-specific level. Thus, many methods for applying unique visual markings to animals have been developed and used. Many commonly used methods share a common element: a sequence of colors (or symbols, though for brevity and clarity we will refer to them as just 'colors').
#'
#' Such color coding methods allow observers to conduct studies from a distance, even through binoculars. Color marking remains simple, cheap, and invaluable for fieldwork situations and human-based tracking. However, many external markers suffer from a lack of permanence: leg bands can be torn off by parrots, spots of dyed fur are often rubbed off, tags on turtle shells can be abraded, etc. The partial loss or visual obstruction of markings can disrupt identification by rendering two or more individuals virtually indistinguishable. Fortunately, careful selection of color coding schemes can affect how robust identification is to partial erasure. Even despite the lack of a rigorous method for generating sequences, researchers often use personal heuristics to select codes that they think have a lower chance of potentially being confused. However much better this may be than blind selection, they are far from optimal.
#'
#'    Drawing from tools found in the engineering field of signal processing , we describe a flexible methodology to create personalized color coding identification schemes that are robust to partial loss or obstruction: even if part of the code is missing, the entire unique sequence of colors can be reconstructed.
#' @author Andrew Burchill: \email{andrew.burchill@asu.edu}
#' @section Getting Started and Vignettes:
#' See \href{../doc/README.html}{README} for a quick dive into the package.
#'
#' See the \href{../doc/loosebirdtag.html}{vignette} for demonstrations and additional uses.
#'
#' Run \code{\link{exampleGUI}} to use a Shiny-based GUI for creating ID schemes.
#'
#' @references Burchill, A. T., & Pavlic, T. P. (2019). Dude, where's my mark? Creating robust animal identification schemes informed by communication theory. \emph{Animal Behaviour}, 154, 203-208. \href{https://doi.org/10.1016/j.anbehav.2019.05.013}{doi:10.1016/j.anbehav.2019.05.013}
#' @docType package
#' @name rabi
#' @aliases rabi-package
#'
NULL

