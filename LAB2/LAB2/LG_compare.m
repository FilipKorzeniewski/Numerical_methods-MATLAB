function [val] = LG_compare(xk)
%function counting root with given precision using Laguerre's method

iter = 0;
val = zeros(2,15);

while iter < 15
    xk = LG_single(xk);
    iter = iter + 1;
    val(1, iter) = polyVal(xk);
    val(2, iter) = xk;
end

end

