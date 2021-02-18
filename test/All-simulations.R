library(RTIGERJ)
library(JuliaCall)
library(GenomicRanges)
# julia_setup(JULIA_HOME = "/home/campos/julia-1.4.2/bin/")

# data --------------------------------------------------------------------

data("ATseqlengths")
# setupJulia()
sourceJulia()

simulations = paste0("sim", 1:7)
for(pop in simulations){
  cat("Running simulation: ", pop, "\n")
  path = file.path("/home/campos/Documents/RTIGER-DATA/simulatedData/", pop)
  files = list.files(path, full.names = TRUE)
  nam = sapply(list.files(path ), function(x) unlist(strsplit(x, split = "[.]"))[1])
  expDesign = data.frame(files = files, name = nam)
  # names(ATseqlengths) = paste0("Chr", names(ATseqlengths))
  ATseqlengths = c(4e4, 3e4, 5e4)
  names(ATseqlengths) = 1:3
  nstates = ifelse(pop =="sim4" | pop =="sim5" | pop == "sim6", 2, 3)
  outdir = file.path("/home/campos/Documents/RTIGER-DATA/simulations", pop)
  cat("Starting fitting.\n")
  myres = RTIGER(expDesign = expDesign,
                 outputdir = outdir,
                 nstates = nstates,
                 seqlengths = ATseqlengths,
                 rigidity = 100,
                 max.iter = 10,
                 trace = TRUE,
                 tiles = 5e2 )
}
