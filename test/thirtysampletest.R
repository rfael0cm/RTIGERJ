library(RTIGERJ)
library(JuliaCall)
library(GenomicRanges)
# julia_setup(JULIA_HOME = "/home/campos/julia-1.4.2/bin/")

# data --------------------------------------------------------------------

data("ATseqlengths")
# setupJulia()
sourceJulia()

# load files --------------------------------------------------------------

path = "/home/campos/Documents/RTIGER-DATA/tiger_input/"
files = list.files(path, full.names = TRUE)
nam = sapply(list.files(path ), function(x) unlist(strsplit(x, split = "[.]"))[1])
expDesign = data.frame(files = files, name = nam)
names(ATseqlengths) = paste0("Chr", names(ATseqlengths))

myres = RTIGER(
  expDesign = expDesign[sample(1:30, 3),],
  # expDesign = expDesign,
               outputdir = "/home/campos/Documents/RTIGER-DATA/output30samp",
               seqlengths = ATseqlengths,
               rigidity = 20,
               max.iter = 2,
               trace = TRUE)
