function [z] = zmin(a, b, c)
%function counting zmin

delta = b^2 - 4*a*c;

if abs(b + sqrt(delta)) >= abs(b - sqrt(delta))
    z = (-2*c)/(b + sqrt(delta));
    return;
else
    z = (-2*c)/(b - sqrt(delta));
    return;
end

end

