# Fingerprint - hybridization
# 
# 
# 
# smiles = c('CCC', 'CCN', 'CCN(C)(C)', 'c1ccccc1Cc1ccccc1','C1CCC1CC(CN(C)(C))CC(=O)CC')
# mols = parse.smiles(smiles)
# extractDrugHybridization(mols)
# extractDrugHybridization(mols[[1]])

extractDrugHybridization = function (molecules, depth = 6, size = 1024, silent = TRUE) {
  
  if (length(molecules) == 1) {
    
    x = get.fingerprint(molecules, type = 'hybridization', depth = depth, size = size, verbose = !silent)
    
    fp = vector('list', 1)
    fp[[1]] = x@bits
    names(fp) = x@nbit
    
  } else {
    
    x = lapply(molecules, get.fingerprint, type = 'hybridization', 
               depth = depth, size = size, verbose = !silent)
    
    fp = vector('list', length(molecules))
    
    for (i in 1:length(molecules)) {
      
      fp[[i]] = x[[i]]@bits
      names(fp)[i] = x[[i]]@nbit
      
    }
    
  }
  
  return(fp)
  
}





# smiles = c('CCC', 'CCN', 'CCN(C)(C)', 'c1ccccc1Cc1ccccc1','C1CCC1CC(CN(C)(C))CC(=O)CC')
# mols = parse.smiles(smiles)
# extractDrugHybridizationComplete(mols)
# extractDrugHybridizationComplete(mols[[1]])

extractDrugHybridizationComplete = function (molecules, depth = 6, size = 1024, silent = TRUE) {
  
  if (length(molecules) == 1) {
    
    x = get.fingerprint(molecules, type = 'hybridization', depth = depth, size = size, verbose = !silent)
    
    fp = integer(x@nbit)
    fp[x@bits] = 1L
    
  } else {
    
    x = lapply(molecules, get.fingerprint, type = 'hybridization', 
               depth = depth, size = size, verbose = !silent)
    
    fp = matrix(0L, nrow = length(molecules), ncol = size)
    
    for (i in 1:length(molecules)) fp[ i, x[[i]]@bits ] = 1L
    
  }
  
  return(fp)
  
}