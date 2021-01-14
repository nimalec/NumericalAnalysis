%%QR_EIG, QR Eigenvalue Solver 
%%In: n x n matrix A 
%%Out: n x n matrix A1, with eigenvalues along the matrix diagonal 
function [A1]=QR_EIG(A)  
maxiter=1000;  %%Maximum number of iterations 
for i=1:maxiter 
    [q,r]=qr(A); 
    A=r*q; 
end 
  A1= A; 
   end
