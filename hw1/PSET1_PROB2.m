%%Input: x%% 
function exp_tay = tay(n) 
exp_tay = 0; 
         for i=1:n
            tay(i) = (x^(i))/(factorial(n)); 
         end
end 
 
print(tay(2))      ; 