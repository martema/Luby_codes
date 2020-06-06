function [ pSorg, pCod, pSorgComp ] = cercaGradoUno( G )
%CERCAGRADOUNO Restituisce i pacchetti codificati di grado uno
%   [pSorg, pCod, pSorgComp]=cercaGradoUno(G) ricerca, utilizzando la matrice 
%   generatrice G, tutti i pacchetti codificati di grado uno.
%   Per ognuno di essi restituisce l'indice di colonna della matrice G,
%   associato al pacchetto codificato, e gli indici di riga della matrice G
%   dei vicini di tale pacchetto.
%   pCod: vettore che contiene l'indice di tutti i pacchetti codificati di
%   grado uno;
%   pSorg: vettore che contiene l'indice di tutti i pacchetti sorgente
%   associati ai pacchetti codificati di grado uno senza ripetizioni;
%   pSorgComp: vettore che contiene l'indice di tutti i pacchetti sorgente
%   associati ai pacchetti codificati di grado uno compresi quelli
%   ripetuti.

    %% Inizializzazione
    sz=size(G);
    vCol=[1:sz(2)];
    vRig=[1:sz(1)];
    pSorgComp=[];
    pSorg=[];
    
    %% Ricerca
    logical=sum(G,1)==1; % Ricerca delle colonne la cui somma fa uno
    pCod=vCol(logical); % Pacchetti codificati di grado uno
    if length(pCod~=0)
        logical=G(:,pCod)==1; % Ricerca dei vicini dei pacchetti di grado uno
        for i=1:length(pCod)
            v=vRig(logical(:,i)); 
            pSorgComp=[pSorgComp v]; % Aggiornamento degli indici dei pacchetti sorgente
            if isempty((find(pSorg==v)))
                pSorg=[pSorg v]; %Aggiornamento degli indici dei pacchetti sorgente se questo non è ancora presente
            end
        end
    end
end
    
%    while j<=sz(2) %&& pg1==0
%        a=find(G(:,j)==1); %Numero di uno nella colonna j-esima (grado tn(j))
%        % Se il grado è uno le variabili vengono aggiornate
%        if length(a)==1
%            psorgcomp=[psorgcomp a];
%            % Se il pacchetto non è ancora presente in psorg allora questa
%            % variabile viene aggiornata altrimenti viene aggiornata solo
%            % pcod
%            if length(find(psorg==a))==0;
%                psorg=[psorg a];
%            end
%            pcod=[pcod j];
%        end
%        j=j+1;
%    end
    