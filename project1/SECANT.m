%%%%SECANT.m: performs Newton Iteration on a function, f(x)
%%%% to solve for root x^(2)*. 
function [xroot]=SECANT(x0) 
f=@(x) sin(1/x);  % Define the function
i = 2;
eps=1e10; 
x(1)=x0; 
x(2)= x0+0.1; 
while abs(eps)> 1e-16  
   ddfx = (f(x(i)-f(x(i-1))))/(x(i)-x(i-1));    
   x(i+1) = x(i) - f(x(i))/ddfx; 
   eps=x(i+1)-x(i); 
   i=i+1; 
   xroot=x(i); 
end 