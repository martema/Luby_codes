function [ tnExit ] = channel( tn, eps )
%CHANNLE Implements the erasure channel 
%   tnexit=channel(tn,eps) The packet is recovered at the exit of the
%   channel with probability 1-eps and it is lost with probability eps. 
%   eps: erasure probability
%   tn: channel input packets
%   tnExit: channel output packets

    for i=1:length(tn)
        random = rand;
        if random > (1-eps) %The packet is lost
            eres(i)=0;
        else  % The packet is not lost
            eres(i)=1;
        end
    end
    eres=eres==1;
    tnExit=tn(eres);
    
end
    