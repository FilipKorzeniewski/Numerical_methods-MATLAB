function [y, iter] = LG_final(xk, precision)
%function counting root with given precision using Laguerre's method

iter = 0;
while abs(polyVal(xk)) >= precision
    xk = LG_single(xk);
    iter = iter + 1;
end

y = xk;

end

