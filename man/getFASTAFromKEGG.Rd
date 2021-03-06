% Generated by roxygen2 (4.0.1): do not edit by hand
\name{getFASTAFromKEGG}
\alias{getFASTAFromKEGG}
\title{Retrieve Protein Sequence in FASTA Format from the KEGG Database}
\usage{
getFASTAFromKEGG(id, parallel = 5)
}
\arguments{
\item{id}{A character vector, as the protein ID.}

\item{parallel}{An integer, the parallel parameter, indicates how many
                process the user would like to use for retrieving
                the data (using RCurl), default is \code{5}.
                For regular cases, we recommend a number less than \code{20}.}
}
\value{
A list, each component contains one of the protein sequences
in FASTA format.
}
\description{
Retrieve Protein Sequence in FASTA Format from the KEGG Database
}
\details{
This function retrieves protein sequences in FASTA format
from the KEGG database.
}
\examples{
\donttest{
id = c('hsa:10161', 'hsa:10162')
getFASTAFromKEGG(id)}
}
\author{
Nan Xiao <\url{http://r2s.name}>
}
\seealso{
See \code{\link{getSeqFromKEGG}} for retrieving protein
represented by amino acid sequence from the KEGG database.
See \code{\link{readFASTA}} for reading FASTA format files.
}
\keyword{KEGG}
\keyword{getFASTAFromKEGG}
\keyword{getProt}

