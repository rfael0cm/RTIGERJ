# Psi should be in the same form as the observations in the normal function
# List with samples with lists with Chromosome with a nstates x T Matrix
dev=function(psi,rigidity=NULL,nstates=3,transition=NULL,start=NULL){
  
  #Checks:
  if(is.null(rigidity)) stop("Rigidity must be specified. This is a data specific parameter. Check vignette.\n")
  if(!is.integer(rigidity))  rigidity = as.integer(rigidity)
  if(!is.integer(nstates))  nstates = as.integer(nstates)
  #Gr��e transistion und start 
  #Gr��e psi
  
  parameter=list(rigidity=rigidity,nstates=nstates,transition=transition,pi=start)
  fitted=julia_call("EMdev",psi,parameter)
  gamma=fitted$gamma
  newpara=fitted$parameter
  newtransition=newpara$transition
  newstart=newpara$pi
  return (list(gamma=gamma,transitionUpdate=newtransition,startUpdate=newstart))

}


