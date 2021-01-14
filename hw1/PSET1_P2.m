s2 = zeros(1,1000);
for n = 1:1000
    A = rand(n,n); 
    u = rand(n,1); 
    v = rand(n,1); 
    tic; 
    t1 = A*u; 
    t2 = t1*transpose(v);     
    s2(n) = toc;
end
figure 
plot(s2) 
title('Time Complex of Auv^{T}'); 
xlabel('n, number of operations'); 
ylabel('t, computation time (s)');


