% Generated by roxygen2 (4.0.1): do not edit by hand
\name{extractDrugIPMolecularLearning}
\alias{extractDrugIPMolecularLearning}
\title{Calculates the Descriptor that Evaluates the Ionization Potential}
\usage{
extractDrugIPMolecularLearning(molecules, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
A data frame, each row represents one of the molecules,
each column represents one feature.
This function returns one column named \code{MolIP}.
}
\description{
Calculates the Descriptor that Evaluates the Ionization Potential
}
\details{
Calculate the ionization potential of a molecule.
The descriptor assumes that explicit hydrogens have been added to the molecules.
}
\examples{
\donttest{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
mol = readMolFromSmi(smi, type = 'mol')
dat = extractDrugIPMolecularLearning(mol)
head(dat)}
}
\author{
Nan Xiao <\url{http://r2s.name}>
}
\keyword{Ionization}
\keyword{Potential}
\keyword{extractDrugIPMolecularLearning}

