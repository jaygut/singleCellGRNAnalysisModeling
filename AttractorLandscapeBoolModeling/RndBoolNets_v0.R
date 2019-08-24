
#load required packages
packages2load <- c("BoolNet","igraph","markovchain")
lapply(packages2load, require, character.only = TRUE);


#set working dir
base.Dir <- "/Users/jaysongutierrez/Documents/Algorithms/OmicsSingleCellTutorials/BoolNetModeling/ScenicScoredGRNModels/"
setwd(base.Dir)


#load example Boolean model
hypoth.Circuit <- BoolNet::loadNetwork('Hypothetical9NodeWiring_v1.txt')
pdf('AttractLandscape_Hypothetical9NodeWiring_v1.pdf',
    width=6, 
    height=5) 
hypoth.Attrs <- BoolNet::getAttractors(hypoth.Circuit)
BoolNet::plotStateGraph(hypoth.Attrs)
dev.off()


#let's sample randomly the space of Boolean rules to select a particular wiring with a
#high number of attractor states
num.Attrs <- vector()
avg.Edge.Connect <- 0.3
num.Vertices <-7
num.Edges <- ceiling(num.Vertices*avg.Edge.Connect)

if(exists("rnd.Circuit")){
  rm(rnd.Circuit)
}

for (i in 1:1000){
  
  circuit <- BoolNet::generateRandomNKNetwork(n=num.Vertices,k=num.Edges)
  rAttrs <- BoolNet::getAttractors(circuit)
  
  num.Attrs[i] <- length(rAttrs$attractors)
  
  if (num.Attrs[i]>=num.Vertices){
    
    #rnd.Circuit  <- c(rnd.Circuit , circuit)
    rnd.Circuit <- circuit
  }
}


#save plot illustrating the attractor landscape of one of the randomly generated circuits
graphPlotFN <- paste0("AttractLandscape_RandGRC_NumVertices",num.Vertices,"AvgNumEdges",num.Edges,".pdf")
pdf(paste0(base.Dir,graphPlotFN)) 
#simplyfying wiring: eliminates irrelevant variables from the inputs of the gene transition functions
simpl.Circuit <- BoolNet::simplifyNetwork(rnd.Circuit)
rAttrs <- BoolNet::getAttractors(simpl.Circuit)
BoolNet::plotStateGraph(rAttrs)
dev.off()


#save plot network wiring
networkWPlotFN <- paste0("Wiring_RandGRC_NumVertices",num.Vertices,"AvgNumEdges",num.Edges,".pdf")
pdf(paste0(base.Dir,networkWPlotFN),
    width=6, 
    height=5) 
BoolNet::plotNetworkWiring(simpl.Circuit)
dev.off()

#Save randomly generated model
networkBoolFuncFN <- paste0("Wiring_RandGRC_NumVertices",num.Vertices,"AvgNumEdges",num.Edges,".txt")
BoolNet::saveNetwork(simpl.Circuit,file = networkBoolFuncFN)

#plot 
hist(num.Attrs)

series <- BoolNet::generateTimeSeries(rnd.Circuit,numSeries=100,numMeasurements=10,noiseLevel=0.1)

ts <- series[[1]]


# hoge.mfd <- read.csv('/Users/jaysongutierrez/Documents/Algorithms/Pop_GRN_Evol_Simulations/DataAnalysis_AdaptGRNEvol/hoge_mfd.csv')
# tt <- t.test(hoge.mfd)
# c(tt$p.value, tt$estimate)
# 
# loge.mfd <- read.csv('/Users/jaysongutierrez/Documents/Algorithms/Pop_GRN_Evol_Simulations/DataAnalysis_AdaptGRNEvol/loge_mfd.csv')
# tt <- t.test(loge.mfd)
# c(tt$p.value, tt$estimate)
