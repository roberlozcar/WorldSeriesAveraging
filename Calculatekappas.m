function [ coefValue ] = Calculatekappas( wordValue, Omega,t0)
% Calculatekappas Calculates the kappa coefficient for word-series averaging
%   Calculate the coefficient kappa for world-series averaging for dynamical
%   systems. The word is introduced as a vector of integer in wordValue and
%   the frequency of the oscillation is Omega and the vector of times in t.

LengthOfWord = length(wordValue);
syms t;

switch(LengthOfWord)
    case 1
        if wordValue == 0
            coefValue = 0;
        else
            coefValue = 1i/(Omega*wordValue)*(exp(1i*wordValue*Omega*t0)-...
                exp(1i*wordValue*Omega*t));
        end
    otherwise
        if norm(wordValue) == 0
            coefValue = 0;
        elseif norm(wordValue) == abs(wordValue(end))
            coefValue = 1i/(wordValue(end)*Omega)* Calculatekappas( wordValue(2:end), Omega,t0);
        elseif wordValue(1) ~= 0
            coefValue = 1i/(wordValue(1)*Omega)* (Calculatekappas( wordValue(2:end), Omega,t0) - Calculatekappas( [wordValue(1)+wordValue(2) wordValue(3:end)], Omega,t0) );
        else
            indexPos = find(wordValue,1);
            coefValue = 1i/(wordValue(indexPos)*Omega)* (Calculatekappas( wordValue(2:end), Omega,t0) - Calculatekappas( [wordValue(1:indexPos-1) wordValue(indexPos)+wordValue(indexPos+1) wordValue(indexPos+2:end)], Omega,t0) );
        end
end
