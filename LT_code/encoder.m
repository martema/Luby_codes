function [ tn ] = encoder(sn,d,N)
%ENCODER LT code encoder
%   tn=encoder(sn,d,N) outputs a vector of coded packets from source sn
%   using d grades
%   sn: source
%   N: number of coded packets
%   d: grades vector
%   tn: coded packets
%   tn(i) cell array: grade in the first field, neighbours in second field,
%   packet value in third field

    tn={};
    for j=1:N
        v=(1:length(sn)); 
        tn{j}={[],[],[0]};
        tn{j}{1}=d(j); % Packet degree
        for i=1:d(j)
            % Given the degree, packets are chosen uniformly at random,
            % decreases the number of packets each timeand eliminating the
            % chosen packet
            random=randi(length(v),1,1);
            pacchetto=v(random);
            tn{j}{2}=[tn{j}{2} pacchetto];
            % The coded packet is updated through an xor operation with the
            % chosen source packet
            tn{j}{3}=bitxor(tn{j}{3},sn(pacchetto));
            v(random)=[];
        end
    end
end