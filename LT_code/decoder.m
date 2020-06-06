function [ snRec, fail, numRec] = decoder( tn, K)
%DECODER LT code decoder
%   [snRec, fail, numRec]=decoder(tn, K) decodes the K-dimension source by
%   means of the vector of coded packets tn.
%   At first, it generates the matrix G using the information in tn. Then,
%   at each iteration, it searches for grade one packets and it uses them
%   to decode the source and update the matrix. The deconding process ends
%   whtn the source is completely decoded or, in the matrix G, there are no
%   more grade one packets.
%   tn: coded packet vector
%   K: source dimension
%   snRec: decoded packets
%   fail=0: decoding successful 
%   fail=1: decoding failed
%   numRec: number of decoded packets

    %% G matrix
    G=sparse([],[],[],K,length(tn));
    for i=1:length(tn)
        pacchetti=tn{i}{2};
        G(pacchetti,i)=1;
        tm(i)=tn{i}{3}; % Vector that only contains decoded packets
    end
    G=sparse(G);
    
    %% Initialization
    snRec=[];
    fail=false;
    numRec=0;
    
    %% Decoding
    while numRec<K
        %home,disp(['%executed ciclo = ',num2str(round(100*recuperati/K))])
        [pSorg, pCod, pSorgComp]=cercaGradoUno(G);
        if ~isempty(pSorg) % At least one grade one packet has been found
            snRec(pSorgComp)=tm(pCod); % Recover sn values found
            numRec=numRec+length(pSorg); % Number of recovered packets
            % Update coded packet values using already decoded packets
            A=G(pSorg,:)==1; 
            szA=size(A);
            for i=1:szA(1)
            tm(A(i,:))=xor(tm(A(i,:)),snRec(pSorg(i)));
            end
            % Matrix and coded packets vector update
            G(:,pCod)=[];
            G(pSorg,:)=0;
            tm(pCod)=[];
        else % No grad one packets found
            fail=true;
            return
        end
    end
end
    
    
    
    
