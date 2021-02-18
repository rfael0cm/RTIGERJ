library(RTIGERJ)
# data --------------------------------------------------------------------

data("ATseqlengths")

sourceJulia()

# load files --------------------------------------------------------------

path = system.file("extdata",  package = "RTIGERJ")
files = list.files(path, full.names = TRUE)
nam = sapply(list.files(path ), function(x) unlist(strsplit(x, split = "[.]"))[1])
expDesign = data.frame(files = files, name = nam)
names(ATseqlengths) = paste0("Chr", 1:5)
myres = RTIGER(expDesign = expDesign,
               outputdir = "/home/campos/Documents/outputjulia/",
               seqlengths = ATseqlengths,
               rigidity = 4,
               max.iter = 2,
               trace = FALSE)
