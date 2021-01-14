%%Homework 2, Problem 2(b). CS 4220. College of Engineering, Cornell University. 
%%Nima Leclerc, 02/22/2018 
A= [6 7 8; 1 3 5; 13 17 12]; %test A 
b1=[52, 21, 33]; %test b 
n = length(b1); %len of b 
alpha= A(n,n); %%d(n, n) + u(n) + v(n) 
x=zeros(n); 
y=zeros(n); 
u1 = A(1:n-1, n); 
v1 = A(n, 1:n-1); 
d1=diag(A); 
d2= d1(1:end-1); 
s1 = zeros(1,5);
temp=0;
tic
for k= 1:n-1  
  temp= temp + (b1(k)*v1(k))/d1(k); 
  y(k) = b1(k); 
end  
y(n) = b1(n)-temp;  
temp2=0; 
for k=1:n-1 
    temp2 = temp2 + (v1(k)*u1(k))/d(k); 
end
x(n) = y(n)/(alpha-temp2);
for k=1:n-1 
x(k) = x(k)+((y(k)-x(n)*u1(k))/d2(k)); 
end 
s1(n) = toc;

disp(x); 
figure 
plot(s1)
title('Time Complex of Ax=b Solution, via LU Decomposition'); 
xlabel('n, number of operations'); 
ylabel('t, computation time (s)'); 