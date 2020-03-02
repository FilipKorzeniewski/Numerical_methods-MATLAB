function [intervalMatrix] = localInterval(a,b,delta)
%interval matrix includes values of all local interval where f(x1)*f(x2)<0
%it includes the interval where there is all zeros
if a < b
    x1 = a;
    x2 = a + delta * 10e2;
elseif a > b
    x1 = b;
    x2 = b + delta * 10e2;
end

length = abs(x1 - x2);
beta = 1.01;
k = 0;
intervalMatrix = zeros(1,2);

while x2 < b
    if myfunc(x1) * myfunc(x2) < 0
        k = k + 1;
        intervalMatrix(k, 1) = x1;
        intervalMatrix(k, 2) = x2;
        x1 = x2;
        x2 = x2 + delta * 10e3;
    else
        x2 = x2 + beta*(length);
    end
end

if myfunc(b) == 0 
    k = k + 1;
    intervalMatrix(k, 1) = b;
    intervalMatrix(k, 2) = b;
end
        
end

