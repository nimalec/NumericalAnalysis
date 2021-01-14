%%%LeonardJones_POT_GRADDESC.m is a function which computes the minimnum energy configuration
%%%of atoms, given the Leonard Jones Potential Function. This method
%%%employs all Wolfe Conditions, including the strong Wolfe Conditions 
%% INPUT: {xi}Initial Guess of Atomic Configuration, c1, c2 tuning paramaters. 
%% OUTPUT: Minimum Energy Atomic Configuration, x
function [xopt, Vmin] = LeonardJones_POT_GRADDESC(x_init,c1,c2) 
%%Contstruct Leonard-Jones Potential for sysatem of n atoms


Vmin=[]; %% Optimal potential construction 
n=size(x_init(:,1)); %% Number of Spatial Points 
X=sym('x', [n 3]); %% Construction of points 
Xvar = X(:); 
V=sym('v',[n n]); 
R=sym('r', [n n]);
Vtot=0; 
for ii=1:n 
    for jj=1:n  
       R(ii,jj)= norm(X(ii)-X(jj)); 
       V(ii,jj) = R(ii,jj).^(12)-2*R(ii,jj).^(6); 
       Vtot = Vtot + V(ii, jj);       
    end 
end 
LJV=Vtot;%% Leonard-Jones Potential Construction 
dfk=gradient(LJV,Xvar)'; %%Unperturbed gradient iterate
Pk= -dfk; 
xk=x_init;  
w=1; 
c=0; 
del=0;
alph0=1.5; 
alphk = line_search(LJV, xk,c1,c2, 1.5);
dfkn = double(subs(dfk, v, x+alphak*xk));  %%Perturbed gradient iterate
while any(abs(w)> 1e-8) && (mean(abs(del)) > 1e-8) && c < 200
    Vmin(end+1)=double(subs(LJV,Xvar,xk)); 
    w=alphk*Pk'; 
    xk=xk+w; 
    dfkn=double(subs(dfk, X, xk));
    alphk=LINESEARCH(func,x,c1,c2,alph0); 
    del=w+alphk*Pk'; 
    c=c+1; 
end
 Vmin(end+1)=double(subs(V, v, xmin));
 xopt = xk; 
end



