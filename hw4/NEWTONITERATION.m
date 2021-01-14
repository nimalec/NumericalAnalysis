%%%%NEWTONITERATION.m: performs Newton Iteration on a function, f(x)
%%%% to solve for root x^(2)*. 
function [y] =NEWTONITERATION(x0, maxIter, tol) 
f=@(x) sin(x)+x.^3;  % Define the function
df=diff(f, x);  % Define the first derivative of the function
y=zeros(maxIter); 
i = 1;
x(i)=x0; 
   xroot=x(i+1); 
   y(i)=x(i); 
   if (abs(f(x(i)))<= tol) 
       maxIter = i; %STORES FINAL ITERATION 
      break;
   end 
   i=i+1; 
end 



while i < maxIter && abs(f(x(i))) > 1e-16  
   x(i+1) = x(i) - f(x(i))/dfx(x(i));
end 
