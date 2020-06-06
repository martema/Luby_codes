function [ tn, G ] = encoderIT(sn,d)
%ENCODER LT code encoder
%   [tn, G]=encoder(sn,d) outputs a coded packet tn with degree d and the
%   respective column of the generator matrix
%   sn: source
%   d: degree
%   tn: coded packet
%   G: column vector of the generator matrix
    
    %% Initialization
    v=(1:length(sn)); 
    G=zeros(length(sn),1);
    tn=0;
    pacchetto=[];
    
    %% Coding
    for i=1:d
        % Given the degree, packets are chosen uniformly at random,
        % decreases the number of packets each timeand eliminating the
        % chosen packet
        random=randi(length(v),1,1);
        pacchetto(i)=v(random);
        % The coded packet is updated through an xor operation with the
        % chosen source packet
        tn=bitxor(tn,sn(pacchetto(i)));
        v(random)=[];
    end
    G(pacchetto)=1;
end