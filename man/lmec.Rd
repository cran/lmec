\name{lmec}
\alias{lmec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Linear Mixed-Effects Models with Censored Responses}
\description{
This generic function fits a linear mixed-effects model in the formulation described in Laird and Ware (1982) but allowing for censored normal responses. In this version, the with-in group errors are assumed independent and identically distributed.}
\usage{
lmec(yL, cens, X, Z, cluster, maxstep = 200, varstruct = "unstructured", init, method = "ML", epsstop = 0.001, abspmv = 0.001, mcmc0 = 100, sdl = 0.1, iter2 = 15, trs = 5, pls = 5, mcmcmax = 1000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{yL}{Observed left-censored response vector}
  \item{cens}{ Censoring indicator: if yL>ytrue, then cens=1}
  \item{X}{Design matrix for the fixed-effects model, it needs to include a column of 1's if the intercept is present}
  \item{Z}{If the design matrix for the random-effects is diag(Z1, Z2, ..., Zm), then Z=(Z1',Z2', ..., Zm')' }
  \item{cluster}{Cluster indicator  taking values between 1 and m}
  \item{maxstep}{The maximum number of EM iterations}
  \item{varstruct}{Variance structure for random effects, current options are unstructured and diagonal.}
  \item{init}{Intial estimated parameters (it is optional), it is a list with components beta, bi, sigma and Delta.}
  \item{method}{Options are ML, REML and MLmcmc}
  \item{epsstop}{The threshold for the difference between two consecutive likelihood values in EM sequence}
  \item{abspmv}{Absolute error tolerance for pmvnorm() function}
  \item{mcmc0}{The burn-in MCMC sample size for E-step of EM}
  \item{sdl}{The target standard deviation for the log-likelihood}
  \item{iter2}{Number of steps in stage 2 for evaluating standard deviation of log-likelihhood}
  \item{trs}{Number of increase in sample size during transition face}
  \item{pls}{Number of steps in plateau face of MCEM}
  \item{mcmcmax}{Maximum MCEM sample size }
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
  \item{beta}{Estimated fixed effects}
  \item{bi}{Estimated random effects}
  \item{sigma}{Residual standard deviation}
  \item{Psi}{Variance matrix of random effects}
  \item{Delta}{Matrix such that Delta'*Delta=sigma2*solve(Psi)}
  \item{loglik}{Maximum log-likelihood value (or surrogate objective function)}
  \item{varFix}{Variance matrix for fixed effects}
  \item{method}{Options are ML, REML and MLmcmc}
  \item{varstruct}{Variance structure for random effects, current options are unstructured and diagonal}
  \item{step}{Number of EM iterations}
 \item{likseq}{Log-likelihood EM sequence}
}
\references{ 
Vaida, Florin and Liu, Lin, Fast Implementation For Normal Mixed Effects Models with Censored Response (submitted).

Vaida, Florin and Fitzgerald, Anthony and DeGruttola, Victor (2007), Efficient Hybrid EM for nonlinear mixed effects models with censored response, Computational Statistics and Data Analysis, 51, 5718-5730.
}
\author{Florin Vaida (fvaida@ucsd.edu) and Lin Liu (linliu@ucsd.edu) }
%\note{ ~~further notes~~ 
%
% ~Make other sections like Warning with \section{Warning }{....} ~
%}
%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
data(UTIdata)
UTIdata <- subset(UTIdata, !is.na(RNA))
o <- order(UTIdata$Patid, UTIdata$Fup)
UTIdata <- UTIdata[o,]
cens = (UTIdata$RNAcens==1)+0
y = log10(UTIdata$RNA)
X = cbind((UTIdata$Fup==0)+0, (UTIdata$Fup==1)+0, (UTIdata$Fup==3)+0, (UTIdata$Fup==6)+0, (UTIdata$Fup==9)+0, (UTIdata$Fup==12)+0, (UTIdata$Fup==18)+0, (UTIdata$Fup==24)+0)
Z = matrix(rep(1, length(y)), ncol=1)
cluster = as.numeric(UTIdata$Patid)
fit = lmec(yL=y,cens=cens, X=X, Z=Z, cluster=cluster, method='ML', maxstep=40)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
%\keyword{}% __ONLY ONE__ keyword per line
