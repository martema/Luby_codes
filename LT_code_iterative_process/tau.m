function [ y ] = tau( c,delta,K)
%TAU positive function necessary to define the Robust Soliton Distribution 
%   y=tau(c,delta,K) outputs a vector with the values of the distribution,
%   using parameters c and delta.

    
    R = c*log(K/delta)*sqrt(K); %Ripple
    x = (1:K);
    lim=round(K/R)-1;
    if lim<K
        y(1:lim) = (R/K)*(1./x(1:lim));
        y(round(K/R)) = (R/K)*log(R/delta);
        y(round((K/R))+1:K)=0;
    elseif lim==K
            y(1:lim) = (R/K)*(1./x(1:lim));
    else lim>K
            y(1:K) = (R/K)*(1./x(1:K));
    end
end