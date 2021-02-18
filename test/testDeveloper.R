#Generate psi matrices
library(JuliaCall)
library(RTIGERJ)
# julia_source("C:/Users/Sophia.LAPTOP-OIDROKV6/Documents/Arbeit/Julia/AuxilaryFunctions.jl")
# julia_source("C:/Users/Sophia.LAPTOP-OIDROKV6/Documents/Arbeit/Julia/rHMM methods.jl")
auxfile = "~/Dropbox/R-Tiger/RTiger Code/rHMM Auxiliary functions.R"
source(auxfile)
nstates = 3              # the number of hidden states
nmarkers = 15000           # the length of the observation sequence
generative_rigidity = 200 # the rigidity parameter for the 'true' hidden_chain
evidence_strength = 0.06 # 0.06 # how much information does a single observation contain?
diagonal_dominance = 100  # how high is the preference to stay in the same state?

params = generate_params(nstates,generative_rigidity,diagonal_dominance)

# generate data from the rHMM
hidden_chain = generate_hidden(nmarkers,params)


PSI=list()
PSI$sample2=list()

psimat = generate_psimat(hidden_chain,params,evidence_strength)  #0.08 is weak, 2 is strong
logpsimat = log(psimat)
PSI$sample2$Chr1=logpsimat

psimat = generate_psimat(hidden_chain,params,evidence_strength)  #0.08 is weak, 2 is strong
logpsimat = log(psimat)
PSI$sample2$Chr2=logpsimat

PSI$sample1=list()
psimat = generate_psimat(hidden_chain,params,evidence_strength)  #0.08 is weak, 2 is strong
logpsimat = log(psimat)
PSI$sample1$Chr1=logpsimat

psimat = generate_psimat(hidden_chain,params,evidence_strength)  #0.08 is weak, 2 is strong
logpsimat = log(psimat)
PSI$sample1$Chr2=logpsimat


test=RTIGERJ:::dev(psi=PSI,rigidity = params$rigidity,nstates=params$nstates, transition = params$transitions,start=params$pi)




# i=1
# paste0("sample",i)
