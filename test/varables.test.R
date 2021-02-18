path = "/home/campos/Documents/RTIGER-DATA/tiger_input/"
data("ATseqlengths")
files = list.files(path, full.names = TRUE)
nam = sapply(list.files(path ), function(x) unlist(strsplit(x, split = "[.]"))[1])
expDesign = data.frame(files = files, name = nam)
names(ATseqlengths) = paste0("Chr", names(ATseqlengths))

sourceJulia()

expDesign=expDesign[sample(1:30, 3),]
rigidity=4
outputdir="/home/campos/Documents/RTIGER-DATA/outputjulia/"
nstates = 3
seqlengths = ATseqlengths
eps=0.01
max.iter=1
trace = FALSE
tiles = 4e5
groups = NULL
all = TRUE
random = FALSE
specific = FALSE
nsamples = 20
post.processing = TRUE
