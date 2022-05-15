function [ f ] = Calculateavgfunc( basis,wordValue, variable, maxletter)
% Calculateavgfunc Calculates the averaged functions for word-series averaging.
%   Calculate the averaged functions for world-series averaging for dynamical
%   systems. The input are a vector with the basis of the function 
%   for each letter, the word and a vector with the symbolic variables of
%   the function.

LengthOfWord = length(wordValue);

switch(LengthOfWord)
    case 1
        
        f=basis{wordValue+maxletter+1};
        
    otherwise
        
        f=jacobian(Calculateavgfunc(basis,wordValue(2:end),variable,maxletter),variable)*...
            basis{wordValue(1)+1+maxletter};
        
end
end
