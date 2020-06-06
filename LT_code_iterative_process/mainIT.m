%% Inizializzazione
K=10000 % Source dimension
c=0.03 % Distribution parameter
delta=0.5 % Decoding process failure probability
eps(1:K*10)=0.1; % Erasure channel probability

%% Source loading
load sorgente

%% Degrees distribution 
p=robustSolitonDistribution(c, delta, K);

%% Degrees vector
d=myrand(p,1,K*10);

%% Transmission
i=0;
tn=[];
G=sparse([],[],[],0,0);
snRec=[];
numRec=[];
decPack=[];
N=0; 
while length(numRec)<K
    i=i+1;
    %% Encoder
    [x y]=encoderIT(sorgente(1:K),d(i));
    %% Channel
    tnExit=channel(x,eps(i)); 
    if length(tnExit)~=0 
        N=N+1; % Coded packets necessary for the decoding process
        tn=[tn x]; 
        G=[G y]; 
    end
    %% Decoder
    [tn, G, snRec, numRec]=decoderIT(tn, G, snRec, numRec);   
    decPack=[decPack length(numRec)]; % Recovered packets
end
