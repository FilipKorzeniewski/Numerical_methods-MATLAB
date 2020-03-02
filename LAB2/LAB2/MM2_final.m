function [y, iter] = MM2_final(xk, precision)
%function counting root with given precision using MM2

iter = 0;
while abs(polyVal(xk)) > precision
    xk = MM2_single(xk);
    iter = iter + 1;
end

y = xk;

end

