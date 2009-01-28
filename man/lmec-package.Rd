\name{lmec-package}
\alias{lmec-package}
%\alias{lmec}
\docType{package}
\title{Linear Mixed-Effects Models with Censored Responses
}
\description{
This package includes a function to fit a linear mixed-effects model in the formulation described in Laird and Ware (1982) but allowing for censored normal responses. In this version, the with-in group errors are assumed independent and identically distributed.
}
\details{
\tabular{ll}{
Package: \tab lmec\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2009-01-28\cr
%License: \tab What license is it under?\cr
}
%~~ An overview of how to use the package, including the most important functions ~~
}
\author{
Florin Vaida and Lin Liu

Maintainer: Florin Vaida <fvaida@ucsd.edu) and Lin Liu <linliu@ucsd.edu>

}
\references{
Vaida, Florin and Liu, Lin, Fast Implementation For Normal Mixed Effects Models with Censored Response (submitted).

Vaida, Florin and Fitzgerald, Anthony and DeGruttola, Victor (2007), Efficient Hybrid EM for nonlinear mixed effects models with censored response, Computational Statistics and Data Analysis, 51, 5718-5730.
}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation ~~
%~~ directory ~~
\keyword{package}
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
\examples{
data(UTIdata)
UTIdata <- subset(UTIdata, !is.na(RNA))
o <- order(UTIdata$Patid, UTIdata$Fup)
UTIdata <- UTIdata[o,]
cens <- (UTIdata$RNAcens==1)+0
yL<-  log10(UTIdata$RNA)
X<- cbind((UTIdata$Fup==0)+0, (UTIdata$Fup==1)+0, (UTIdata$Fup==3)+0, (UTIdata$Fup==6)+0, (UTIdata$Fup==9)+0, (UTIdata$Fup==12)+0, (UTIdata$Fup==18)+0, (UTIdata$Fup==24)+0)
Z <- matrix(rep(1, length(yL)), ncol=1)
cluster<-  as.numeric(UTIdata$Patid)
fit <- lmec(yL,cens, X, Z, cluster, method='ML', maxstep=40)
}
