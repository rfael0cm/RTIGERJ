library(RTIGERJ)
library(JuliaCall)
library(GenomicRanges)
# julia_setup(JULIA_HOME = "/home/campos/julia-1.4.2/bin/")

# data --------------------------------------------------------------------

data("ATseqlengths")
# setupJulia()
sourceJulia()

# load files --------------------------------------------------------------

pop = "sim5"
path = file.path("/home/campos/Documents/RTIGER-DATA/simulatedData/", pop)
files = list.files(path, full.names = TRUE)
nam = sapply(list.files(path ), function(x) unlist(strsplit(x, split = "[.]"))[1])
expDesign = data.frame(files = files, name = nam)
# names(ATseqlengths) = paste0("Chr", names(ATseqlengths))
ATseqlengths = c(4e4, 3e4, 5e4)
names(ATseqlengths) = 1:3
myres = RTIGER(expDesign = expDesign,
               outputdir = "/home/campos/Documents/RTIGER-DATA/output-Simulated-Nomax/",
               nstates = 2,
               seqlengths = ATseqlengths,
               rigidity = 20,
               # max.iter = 3,
               trace = TRUE,
               tiles = 5e2 )

