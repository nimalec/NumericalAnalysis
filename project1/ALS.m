function [ZT, W,approx]= ALS(A, k)
[m,n] = size(A); 
W=eye(m,k); 
[q, r] = QR_FACT(W); 
ZT=zeros(k,n); 
c=0; 
while c<10  
  for j=1:n 
        ZT(:,j) = r\(q'*A(:,j));  
    for i = 1:m  
        [q,r] = QR_FACT(ZT);
        W(i,:) = (A(i, :)*q)\r'; 
    end 
  end 
 c = c+1;  
 approx = ZT*W; 
end 
  
        
        
        
        
        
        
         
 




  
    