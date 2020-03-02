function [y, iter] = MM1_final(x0, x1, x2, precision)
%function counting Roots 

x = [abs(polyVal(x0)) abs(polyVal(x1)) abs(polyVal(x2))];
minim = min(x);
for i=1:2
    if x(i) == minim 
        temp = x2;
        x2 = x(i);
        x(i) = temp;
    end
end
iter = 0;
while abs(polyVal(x2)) > precision
    [x0, x1, x2] = MM1_single(x0, x1, x2);
    iter = iter + 1;
end
y = x2;
        
end

