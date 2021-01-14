%%Homework 2, Problem 2(c). CS 4220. College of Engineering, Cornell University. 
%%Nima Leclerc, 02/22/2018 
b4 = b(1:15000); 
n2 = length(b4); %len of b 
alpha1= d(n2)+u(n2)+v(n2); %%d(n, n) + u(n) + v(n) 
x1=zeros(n2); 
y1=zeros(n2); 
s2 = zeros(1,50);
temp=0;
tic 
for k=1:n2-1  
  temp= temp +(b4(k)*v(k))/d(k); 
  y1(k) = b4(k); 
end  
y1(n2) = b4(n2)- temp;  
temp2=0; 
for k=1:n2-1 
    temp2 = temp2 + (v(k)*u(k))/d(k); 
end
x1(n2) = y1(n2)/(alpha1-temp2);
for k=1:n2-1 
x1(k) = x1(k)+((y1(k)-x1(n2)*u(k))/d(k)); 
end
error = zeros(n2); 
for j=1:n2-1 
    error(j) = abs(xtrue(j)-x1(j));
end 
figure 
loglog(error) 






