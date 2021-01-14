%%QR_EIG, SHIFTED QR Eigenvalue Solver 
%%In: n x n matrix A, shift mu  
%%Out: n x n matrix A1, with eigenvalues along the matrix diagonal 
function [A1]=QRSHIFT_EIG(A0,mu)  
maxiter=1000;  %%Maximum number of iterations 
n=size(A0); 
for i=1:maxiter 
    [q,r]=qr(A0-mu*eye(n)); 
    A0=r*q+mu*eye(n); 
end 
  A1= A0; 
   end
