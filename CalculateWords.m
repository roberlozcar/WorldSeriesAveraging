function [ A ] = CalculateWords(letters,n)
% CalculateWords Calculates words of length n with the given letters.


l=length(letters);
A=zeros(l,n);
switch(n)
    case 1
        A(:,1)=letters;
    otherwise
            for j=1:l
                C=CalculateWords(letters,n-1);
                lc=length(C);
                add=letters(j)*ones(lc,1);
                A(end+1:end+lc,:)=[C add];
            end
    A=A(l+1:end,:);
end
end

