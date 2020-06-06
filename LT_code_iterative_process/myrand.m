function y=myrand(p,n,m)
%MYRAND generates random numbers according to a given distribution
% y=myrand(p,n,m) outputs a matrix n x m of random numbers according to the
% pdf in vector p. The alfabet is 1, ... , length(p).
% If the summation of the values in p is not equal to 1 with good
% precision, it return an error.
% p -> pmf
% n -> matrix row
% m -> matric column

%% The sum of the values of the pmf is equal to 1
    if abs(sum(p)-1)<1e-10
        X=rand(1,m*n);
        tt=cumsum(p(:));
        tt=[0;tt];
        y=zeros(1,m*n);
        for ii=1:length(tt)-1
            gh=X<=tt(ii+1) & X>tt(ii);
            y(gh)=ii;
        end
        y=reshape(y,n,m);
        
%% The sum of the values of the pmf is less than 1
    else
        fprintf('\n ERROR \n'), y=[]; 
        return
    end
        
end