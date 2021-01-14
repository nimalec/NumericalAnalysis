function ts = PSET1_P5(x, n, y) 
for i =1:n 
    y(i+1) = x.^(i)/factorial(i);
    y = y+1; 
end 
ts = y; 
end 