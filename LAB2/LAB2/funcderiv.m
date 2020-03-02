function [y] = funcderiv(a)
%this function returns value of derivative in point

y = 1.4 * cos(a) - 1.4 * a * sin(a) - 1/a;
end

