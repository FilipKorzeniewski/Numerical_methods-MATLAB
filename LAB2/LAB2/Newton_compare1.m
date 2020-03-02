function [val] = Newton_compare1(a,b)
%function to find ONE zero of the function in local interval

iter = 0;
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

val = zeros(20,2);
if xn < x2
    while iter < 20
        xn = xn - myfunc(xn)/funcderiv(xn);
        iter = iter + 1;    
        val(iter, 1) = myfunc(xn);
        val(iter, 2) = xn;
    end
end        

end



