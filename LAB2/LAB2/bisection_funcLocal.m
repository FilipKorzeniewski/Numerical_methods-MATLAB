function [x, iterations] = bisection_funcLocal(a, b, delta, max_iter)
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


for i=1:max_iter
    
    iterations = iterations + 1;
    c = (x1+x2)/2;
    
    if abs(myfunc(c)) <= delta
        x = [x1 x2];
        return;   
    elseif myfunc(x1)*myfunc(c) < 0
        x2 = c;
    elseif myfunc(x2)*myfunc(c) < 0
        x1 = c;
    elseif myfunc(c) == 0 
        x = [c c];
        return;
    end
end
x = [x1 x2];
     
end

