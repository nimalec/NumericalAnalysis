%%RAYLEIGH_EIG, Eigenvalue Solver 
%%In: n x n matrix A, initial eigenvector guess v0  
%%Out: Dominant eigenvalue of A, lam 
function [lam]=RAYLEIGH_EIG(A,v0)  
maxiter=7;  %%Maximum number of iterations 
for i=1:maxiter 
    n=size(A); 
    lam=(v0')*A*v0; 
    B=A-lam*eye(n); 
    v=B\v0; 
    v0=v/norm(v); 
    lam= (v0')*A*v0; 
end 
end 

