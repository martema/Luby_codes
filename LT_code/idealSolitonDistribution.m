function [ y ] = idealSolitonDistribution(K)
%IDEAL SOLITON DISTRIBUTION Defines the Ideal Soliton Distribution
%   y=idealSolitonDistribution(K) outputs a vector with the values of the
%   distribution

    y(1)=1/K;
    x=(2:K);
    y(2:K)=1./(x.*(x-1));
    
end