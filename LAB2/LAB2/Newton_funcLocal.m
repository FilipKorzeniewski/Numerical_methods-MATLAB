function [x, iterations] = Newton_compare(a,b,delta)
%function to find ONE zero of the function in local interval

iterations = 0;
if(a < b)
    x1 = a;
    x2 = b;
elseif a > b
    x2 = a;
    x1 = b;
elseif a == b
    if myfunc(a) == 0
        x = [a b];
        return;
    else
        disp("The interval equals 0")
        return;
    end
end

xn = x1;
xn1 = 0;

while xn1 < x2
    xn1 = xn - myfunc(xn)/funcderiv(xn);
    iterations = iterations + 1;
    
    if abs(xn1-xn) < delta
        x = [xn xn1];
        return;
    end
    xn = xn1;

end
end


