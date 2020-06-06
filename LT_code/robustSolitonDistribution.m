function [y] = robustSolitonDistribution(c,delta,K)
%ROBUST SOLITON DISTRIBUTION Defines the Robust Soliton Distribution
%   y=robustSolitonDistribution(c, delta, K) outputs a vector with the
%   distribution values, using parameters c and delta.

    varrho=idealSolitonDistribution(K); % Distribuzione Solitone Ideale
    vartau=tau(c,delta,K); % tau function
    beta=sum(varrho+vartau);
    y=(varrho+vartau)/beta;
    
end 