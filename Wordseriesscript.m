clear variables

% Symbolic variables
syms x [3,1];
syms t;

% Parameter of the system
B=.25; A=0.375; v=0.1; w=5; d=0.1;


n=1; % Alphabet of the averaging, -n,-n+1,...,n-1,n
m=3; % Length of the words, from 1 to m

letters=-n:1:n;
tt=(0:1/(w*w):200)';
f=@(x,y,t)0;
fbasis={symfun([-1i*d*B;1i/2*B;0],x);
    symfun([x(2)-x(2).^3+A*cos(x(3))-2*d*x(1);x(1);v],x);
    symfun([1i*d*B;-1i/2*B;0],x)};

for i=1:m
    G=CalculateWords(letters,i);
   for j=1:length(G)
       g=Calculateavgfunc(fbasis,G(j,:),x,n);
       coeff=Calculatebetas(G(j,:),w);
       f=f+coeff*g;
   end
    
end

ff=matlabFunction(f,'Vars',{t,[x1; x2; x3]});
[~,xx1]=ode45(ff,tt,[0;0;0]);
 figure(1),
 plot(tt,xx1(:,1),tt,xx1(:,2)),
 title('Averaged system')

 
sm=symfun([B*sin(w*t);0;0],[t x1 x2 x3]);
for i=1:m-1
    G=CalculateWords(letters,i);
   for j=1:length(G)
       g=Calculateavgfunc(fbasis,G(j,:),x,n);
       coeff=Calculatekappas(G(j,:),w,tt(1));
       gg=symfun(formula(g)*coeff,[t x1 x2 x3]);
       sm=sm+gg;
   end
    
end

ll=length(xx1);
xx2=zeros(ll,3);
smv=matlabFunction(sm,'Vars',{t,[x1 x2 x3]});
for i=1:ll
    xx2(i,:)=xx1(i,:)+smv(tt(i),xx1(i,:))';
end
figure(2),
plot(tt,xx2(:,1),tt,xx2(:,2))
title('Averaged system with change of variable')


figure(4),
of=@(t,y)[y(2)-y(2).^3+A*cos(v*t)-2*d*(y(1)+B*sin(w*t));y(1)+B*sin(w*t)];
[~,exactx]=ode45(of,tt,[0 0]);
exactx(:,1)=exactx(:,1)+B*sin(w*tt);
plot(tt,exactx(:,1),tt,exactx(:,2))
title('System')
