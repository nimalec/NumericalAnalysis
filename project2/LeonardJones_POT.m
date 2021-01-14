%%%LJP_OPT.m is a function which computes the minimnum energy configuration
%%%of atoms, given the Leonard Jones Potential Function. This method
%%%employs all Wolfe Conditions, including the strong Wolfe Conditions 
%% INPUT: Initial Guess of Atomic Configuration. 
%% OUTPUT: Minimum Energy Atomic Configuration. 
function [xopt vmin] = LJP_OPT(c1,c2,init_x) 
m=length(init_x); 
n=m(1);
syms x =[x1,x2,x3]; 
syms R=[r1, r2, r3];
V=zeros(n,n); %% Defines empty array of possible interaction with species   
for ii=1:n 
    for jj=1:n 
       V(ii, jj)=norm(R(ii)-R(jj))^(-12) -2*(norm(X(ii)-X(jj))^(-12)); %%Defines array elements for potential
       Vtot = Vtot + V(ii, jj) ;       
    end 
end 
P=-gradient(V);      %%Defines Decsent Direction 
while(k <= 15 && ) 
    R =init_x+ P'*linesearch( ); 
    k=k+1; 
end 
    
end