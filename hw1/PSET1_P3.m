s3 = zeros(1,1000);
for n = 1:1000   
    A = rand(n,n); 
    u = rand(n,1); 
    v = rand(n,1); 
    tic; 
    t1 = transpose(v)*v + (transpose(u)*v)^(2);    
    s3(n) = toc;
end

figure 
plot(s3)
title('Time Complex of v^{T}(I + uu^{T})v'); 
xlabel('n, number of operations'); 
ylabel('t, computation time (s)');