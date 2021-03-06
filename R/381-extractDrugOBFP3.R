#' Calculate the FP3 Molecular Fingerprints
#' 
#' Calculate the FP3 Molecular Fingerprints
#' 
#' Calculate the 64 bit FP3 fingerprints provided by OpenBabel.
#' 
#' @param molecules R character string object containing the molecules. 
#' See the example section for details.
#' @param type \code{'smile'} or \code{'sdf'}.
#' 
#' @return A matrix. Each row represents one molecule, 
#' the columns represent the fingerprints.
#' 
#' @keywords extractDrugOBFP3
#'
#' @aliases extractDrugOBFP3
#' 
#' @author Nan Xiao <\url{http://r2s.name}>
#' 
#' @export extractDrugOBFP3
#' 
#' @examples
#' \donttest{
#' mol1 = 'C1CCC1CC(CN(C)(C))CC(=O)CC'  # one molecule SMILE in a vector
#' mol2 = c('CCC', 'CCN', 'CCN(C)(C)', 'c1ccccc1Cc1ccccc1', 
#'          'C1CCC1CC(CN(C)(C))CC(=O)CC')  # multiple SMILEs in a vector
#' mol3 = readChar(system.file('compseq/DB00860.sdf', package = 'Rcpi'), 
#'                 nchars = 1e+6)  # single molecule in single sdf file
#' mol4 = readChar(system.file('sysdata/OptAA3d.sdf', package = 'Rcpi'), 
#'                 nchars = 1e+6)  # multiple molecules in single sdf file
#' 
#' smifp0 = extractDrugOBFP3(mol1, type = 'smile')
#' smifp1 = extractDrugOBFP3(mol2, type = 'smile')
#' sdffp0 = extractDrugOBFP3(mol3, type = 'sdf')
#' sdffp1 = extractDrugOBFP3(mol4, type = 'sdf')}
#' 

extractDrugOBFP3 = function (molecules, type = c('smile', 'sdf')) {

    if (type == 'smile') {

        if ( length(molecules) == 1L ) {

            fp = ChemmineOB::fingerprint_OB('SMI', molecules, 'FP3')

            } else if ( length(molecules) > 1L ) {

                fp = matrix(0L, nrow = length(molecules), ncol = 64L)
                for ( i in 1:length(molecules) ) {
                    fp[i, ] = ChemmineOB::fingerprint_OB('SMI', 
                                                         molecules[i], 'FP3')
                }

            }

        } else if (type == 'sdf') {

            smi = ChemmineOB::convertFormat(from = 'SDF', to = 'SMILES', 
                                            source = molecules)
            smiclean = strsplit(smi, '\\t.*?\\n')[[1]]

            if ( length(smiclean) == 1L ) {

                fp = ChemmineOB::fingerprint_OB('SMI', smiclean, 'FP3')

                } else if ( length(smiclean) > 1L ) {

                    fp = matrix(0L, nrow = length(smiclean), ncol = 64L)

                    for ( i in 1:length(smiclean) ) {
                        fp[i, ] = ChemmineOB::fingerprint_OB('SMI', 
                                                             smiclean[i], 'FP3')
                    }

                }

            } else {

                stop('Molecule type must be "smile" or "sdf"')

            }

    return(fp)

}
