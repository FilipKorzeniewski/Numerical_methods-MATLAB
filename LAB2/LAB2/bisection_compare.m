function [val] = bisection_compare(a, b, maxiter)
%function to find ONE zero of the function in local interval

if(a < b)
    x1 = a;
    x2 = b;
elseif a > b
    x2 = a;
    x1 = b;
elseif a == b
    if myfunc(a) == 0
        val = [myfunc(c) c];
        return;
    else
        disp("The interval equals 0")
        return;
    end
end


for i=1:maxiter
    
    c = (x1+x2)/2;
    x = [myfunc(c) c];
    
    for j=1:2
        val(i,j) = x(j);
    end
    
    
    if myfunc(x1)*myfunc(c) < 0
        x2 = c;
    elseif myfunc(x2)*myfunc(c) < 0
        x1 = c;
    elseif myfunc(c) == 0 
        val = [myfunc(c) c];
        return;
    end
end
     
end

