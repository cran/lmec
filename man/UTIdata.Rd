\name{UTIdata}
\alias{UTIdata}
\docType{data}
\title{Data set for Unstructured Treatment Interruption Study}
\description{
Data set from a study of Unstructured Treatment Interruption in HIV-infected adolescents in four institutions in the US.  The main outcome is the HIV-1 RNA viral load, which is subject to censoring below the lower limit of detection of the assay (50 copies/mL).  The censored observations are indicated by the variable RNAcens}
\usage{data(UTIdata)}
\format{
  A data frame with 373 observations on the following 5 variables.
  \describe{
    \item{\code{Patid}}{patient ID}
    \item{\code{Days.after.TI}}{days after treatment interruption}
    \item{\code{Fup}}{follow-up months}
    \item{\code{RNA}}{viral load RNA}
    \item{\code{RNAcens}}{censoring indicator for viral load}
  }
}
%\details{
%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
\references{
  Saitoh, A.,  Foca, M, et al. (2008), Clinical outcome in perinatally acquired HIV-infected children and adolescents after unstructured treatment interruption, Pediatrics,121, e513-e521.
}
\examples{
data(UTIdata)
## maybe str(UTIdata) ; plot(UTIdata) ...
}
\keyword{datasets}
