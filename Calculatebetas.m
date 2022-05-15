function [ coefValue ] = Calculatebetas( wordValue, Omega )
% Calculatebetas Calculates the beta coefficient for word-series averaging
%   Calculate the coefficient beta for world-series averaging for dynamical
%   systems. The word is introduced as a vector of integer in wordValue and
%   the frequency of the oscillation is Omega.

LengthOfWord = length(wordValue);

switch(LengthOfWord)
    case 1
        if wordValue == 0
            coefValue = 1;
        else
            coefValue = 0;
        end
    otherwise
        if norm(wordValue) == 0
            coefValue = 0;
        elseif norm(wordValue) == abs(wordValue(end))
            coefValue = 1i/(wordValue(end)*Omega)* (Calculatebetas( wordValue(2:end), Omega) - Calculatebetas( wordValue(1:end-1), Omega) );
        elseif wordValue(1) ~= 0
            coefValue = 1i/(wordValue(1)*Omega)* (Calculatebetas(wordValue(2:end), Omega) - Calculatebetas( [wordValue(1)+wordValue(2) wordValue(3:end)], Omega) );
        else
            indexPos = find(wordValue,1);
            coefValue = 1i/(wordValue(indexPos)*Omega)* (Calculatebetas(wordValue(2:end), Omega) - Calculatebetas([wordValue(1:indexPos-1) wordValue(indexPos)+wordValue(indexPos+1) wordValue(indexPos+2:end)], Omega) );
        end
        
end
