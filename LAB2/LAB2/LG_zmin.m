function [z] = LG_zmin(xk)
%counts z of the Laguerres function

delta = 3*(3*((firstDerVal(xk))^2) - 4*polyVal(xk)*secDerVal(xk));

if abs(firstDerVal(xk) + sqrt(delta)) >= abs(firstDerVal(xk) - sqrt(delta))
    z = (4*polyVal(xk)) / (firstDerVal(xk) + sqrt(delta));
    return;
else
    z = (4*polyVal(xk)) / (firstDerVal(xk) - sqrt(delta));
    return;
end

end

