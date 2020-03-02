function [a, b, c] = coeff_count(x0, x1, x2)
%counts coefficients of quadratic function created by points x1,x2,x3

c = polyVal(x2);

z0 = x0 - x2;
z1 = x1 - x2;

R1 = (polyVal(x0) - polyVal(x2)) / z0;
R2 = (polyVal(x1) - polyVal(x2)) / z1;

a = (R1 - R2) / (z0 - z1);
b = R1 - a*z0;

end

