s1 = zeros(1,1000);
for n = 1:1000
    A = rand(n,n); 
    u = rand(n,1); 
    v = rand(n,1); 
    tic; 
    tr =sum(diag(A))+ sum(diag(u*transpose(v))); 
    s1(n) = toc;
end
figure 
plot(s1)
title('Time Complex of Tr(A + uv^{T})'); 
xlabel('n, number of operations'); 
ylabel('t, computation time (s)');  
