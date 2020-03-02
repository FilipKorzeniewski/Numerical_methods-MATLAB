function [y] = MM2_single(xk)
%function counting next approximation of root

y = xk + MM2_zmin(xk);
end

