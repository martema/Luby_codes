function [ tn, G, snRec, rec] = decoderIT( tn, G, snRec, rec)
%DECODER Decodificatore codice LT
%   [tn,G,snRec,numRec]=decoder(tn, G, snRec, numRec) decodes the source
%   using the vector of codified packets tn and the G matrix.
%   tn: vector fo codified packets
%   G: code generator matrix
%   snRec: decoded packets
%   rec: decoded packets indices 

    %% G matrix update
    szG=size(G);
    if szG(2)~=0
    A=G(rec,szG(2))==1;
    v=rec(A);
    if ~isempty(v)
        for i=1:length(v)
            tn(szG(2))=xor(tn(szG(2)),snRec(v(i)));
        end
        G(rec,szG(2))=0;
    end
    
    %% Decoding
    [pSorg, pCod, pSorgComp]=cercaGradoUno(G);
    if ~isempty(pSorg)% At least one grade one packet has been found
        snRec(pSorgComp)=tn(pCod); % Recover sn values found
        rec=[rec pSorg]; % Number of recovered packets
        % Update coded packet values using already decoded packets
        A=G(pSorg,:)==1;
        szA=size(A);
        for i=1:szA(1)
            tn(A(i,:))=xor(tn(A(i,:)),snRec(pSorg(i)));
        end
        % Matrix and coded packets vector update
        G(:,pCod)=[];
        G(pSorg,:)=0;
        tn(pCod)=[];
    end
    end
end
