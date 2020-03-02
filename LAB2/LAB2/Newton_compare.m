function [val] = Newton_compare(a,b)
%function to find ONE zero of the function in local interval

iter = 0;
if(a < b)
    x1 = a;
    x2 = b;
elseif a > b
    x2 = a;
    x1 = b;
elseif a == b
    if polyVal(a) == 0
        val = [a b];
        return;
    else
        disp("The interval equals 0")
        return;
    end
end

xn = x1;

val = zeros(1,15);
if xn < x2
    while iter < 15
        xn = xn - polyVal(xn)/firstDerVal(xn);
        iter = iter + 1;    
        val(1, iter) = polyVal(xn);
        val(2, iter) = xn;
    end
end        


end


