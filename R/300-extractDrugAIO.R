#' Calculates All the Molecular Descriptors in the Rcpi Package at Once
#'
#' Calculates All the Molecular Descriptors in the Rcpi Package at Once
#' 
#' This function calculates all the molecular descriptors 
#' in the Rcpi package at once.
#' 
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process should be 
#' shown or not, default is \code{TRUE}.
#' @param warn Logical. Whether the warning about some descriptors 
#' need the 3D coordinates should be shown or not after the calculation, 
#' default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules, 
#' each column represents one descriptor. 
#' Currently, this function returns total 293 descriptors 
#' composed of 48 descriptor types.
#' 
#' @keywords extractDrugAIO
#' 
#' @aliases extractDrugAIO
#' 
#' @author Nan Xiao <\url{http://r2s.name}>
#' 
#' @export extractDrugAIO
#' 
#' @importFrom rcdk eval.desc
#' 
#' @note
#' Note that we need 3-D coordinates of the molecules to calculate 
#' some of the descriptors, if not provided, these descriptors 
#' values will be \code{NA}.
#' 
#' @examples
#' \donttest{
#' # Load 20 small molecules that have 3D coordinates
#' sdf = system.file('sysdata/OptAA3d.sdf', package = 'Rcpi')
#' mol = readMolFromSDF(sdf)
#' dat = extractDrugAIO(mol, warn = FALSE)}
#' 

extractDrugAIO = function (molecules, silent = TRUE, warn = TRUE) {

    if (warn == TRUE) {
        warning('Note that we need 3-D coordinates of the molecules to calculate some of the descriptors, if not provided, these descriptors will be NA')
    }

    descNames = c('org.openscience.cdk.qsar.descriptors.molecular.ALOGPDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.APolDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.AminoAcidCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.AromaticAtomsCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.AromaticBondsCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.AtomCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.AutocorrelationDescriptorCharge',
                  'org.openscience.cdk.qsar.descriptors.molecular.AutocorrelationDescriptorMass',
                  'org.openscience.cdk.qsar.descriptors.molecular.AutocorrelationDescriptorPolarizability', 
                  'org.openscience.cdk.qsar.descriptors.molecular.BCUTDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.BPolDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.BondCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.CPSADescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.CarbonTypesDescriptor', 
                  'org.openscience.cdk.qsar.descriptors.molecular.ChiChainDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.ChiClusterDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.ChiPathClusterDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.ChiPathDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.EccentricConnectivityIndexDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.FMFDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.FragmentComplexityDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.GravitationalIndexDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.HBondAcceptorCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.HBondDonorCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.HybridizationRatioDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.IPMolecularLearningDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.KappaShapeIndicesDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.KierHallSmartsDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.LargestChainDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.LargestPiSystemDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.LengthOverBreadthDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.LongestAliphaticChainDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.MDEDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.MannholdLogPDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.MomentOfInertiaDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.PetitjeanNumberDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.PetitjeanShapeIndexDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.RotatableBondsCountDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.RuleOfFiveDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.TPSADescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.VABCDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.VAdjMaDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.WHIMDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.WeightDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.WeightedPathDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.WienerNumbersDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.XLogPDescriptor',
                  'org.openscience.cdk.qsar.descriptors.molecular.ZagrebIndexDescriptor')

    x = eval.desc(molecules, descNames, verbose = !silent)

    return(x)

}
