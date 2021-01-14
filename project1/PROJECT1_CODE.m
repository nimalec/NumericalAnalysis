%%  Gram Schmidt Algorithm 
%% Input:  mxn matrix, A 
%% Output: mxm Q and mxn R , orthonormal and upper triangular matrices 
function [Q, R]= QR_FACT(A)  
[m,n]=size(A); 
Q =zeros(m,n); 
R=zeros(n,m); 
tic
    for j=1:n %% Loop through all columns of A 
         v=A(:,j); 
        for i=1:j-1 
            R(i,j)=Q(:,i)'*A(:,j);  %% Compute R elements 
            v=v-R(i,j)*Q(:,i); 
        end 
    R(j,j)=-norm(v); 
    Q(:,j)=v/R(j,j);  
    end
end   
\end{lstlisti

%% Alternating Least Squares Algorithm 
%% INPUT: mxn matrix A, approximation number k 
% OUTPUT:  m x k and kxm  matrices ZT and W  

function [ZT, W,approx]= ALS(A, k)
[m,n] = size(A); 
W=eye(m,k); %Initialize W matrix as an identity matrix 
[q, r] = QR_FACT(W);  %Implement QR factorization
ZT=zeros(k,n);  %Initialize Z matrix 
c=0; 
while d<20  %% Loop through 20 times  
  for j=1:m 
        ZT(:,j) = r/(q'*A(:,j)');  %Compute columns transpose of Z yielding minimization
    for i = 1:n  
        [q,r] = QR_FACT(ZT); %Compute QR factorization on transpose of Z  
        W(i,:) = (A(i, :)*q)/r'; % Compute rows of optimal W matrix 
    end 
  end 
 d = d+1;  
 approx = ZT*W; %Return approximation to A 
end 

function [W, ZT, r] = IMAGEFINDER(A, k, mask, beta)
    [m, n] = size(A);
    W = eye(m, k);
    c = 0;
    ZT = eye(k, n);
    while d<20 %% Loop through 20 times for convergenace 
        for j = 1 : n
            [v, M, len]=masking(A(:, j), W, mask(:, j), 1);
            temp = M;
           temp(len+1:len+k, 1:k) = beta*eye(k, k);
            a = v;
            a(leng+1:leng+k) = 0;
            [Q, R] = QR_FACT(temp);    %WBI is a matrix such that m>n  
            ZT(:, j) = R\ (Q'*a);
        end  
        for i = 1 : n
            [v, M, l] = masking(A(i, :), ZT, mask(i, :), 2);
            z = M;
            z(1:k, l+1:l+k) = beta*eye(k,k);      
            a = v;
            a(:, l+1 : l+k) = 0;
           
           [Q, R] = QR_FACT(z');
            W(i, :) = (a*Q)/R';
        end
        d = d + 1;
    end
    r = norm(W*ZT-A); %RESIDUAL 
end


function [v, M, l] = masking(v, M, mask, d) %% function creates mask 
    pos = find(mask == 0);
    if d == 1
        v(pos) = [];
        M(pos, :) = [];
    else
        v(pos) = [];
        M(:, pos) = [];
    end
    l = length(v);
end