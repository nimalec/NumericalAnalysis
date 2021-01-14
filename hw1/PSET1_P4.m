s4 = zeros(1,1000);
for n = 1:100   
    A = rand(n,n); 
    B= rand(n,n); 
    u = rand(n,1); 
    v = rand(n,1); 
    tic; 
    t1 = transpose(v)*A*B*u; 
    s4(n) = toc;
end

figure 
plot(s4)
title('Time Complex of v^{T}ABv'); 
xlabel('n, number of operations'); 
ylabel('t, computation time (s)');