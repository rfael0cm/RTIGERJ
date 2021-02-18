pop = "sim5"
path = file.path("/home/campos/Documents/RTIGER-DATA/simulatedData/", pop)
data("ATseqlengths")
files = list.files(path, full.names = TRUE)
nam = sapply(list.files(path ), function(x) unlist(strsplit(x, split = "[.]"))[1])
expDesign = data.frame(files = files, name = nam)
# names(ATseqlengths) = paste0("Chr", names(ATseqlengths))

sourceJulia()

expDesign=expDesign
rigidity= 20
outputdir="/home/campos/Documents/RTIGER-DATA/output-Simulated/"
nstates = 2
seqlengths = c(4e4, 3e4, 5e4)
names(seqlengths) = 1:3
eps=0.01
max.iter=1
trace = FALSE
tiles = 5e2
groups = NULL
all = TRUE
random = FALSE
specific = FALSE
nsamples = 20

