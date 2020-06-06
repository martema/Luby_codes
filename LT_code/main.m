%% Initialization 
K=10000 % Source dimension
N=12000 % Number of coded packets
c=0.03 % Distribution parameter
delta=0.5 % Decode failure probability
eps=0.1 % Channel cancellation probability


%% Source loading
load sorgente

%% Grades distribution
p=robustSolitonDistribution(c, delta, K);

%% Grades vector
d=myrand(p,1,N);

%% Encoder
tn=encoder(sorgente(1:K),d,N);

%% Channel
tn=channel(tn,eps);
    
%% Decoder
[snRec, fail, numRec]=decoder(tn,K);

