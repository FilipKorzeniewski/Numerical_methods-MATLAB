function [z] = MM2_zmin(xk)
%function counting zmin minimal zmin

delta = (firstDerVal(xk))^2 - 2 * polyVal(xk) * secDerVal(xk);

if abs(firstDerVal(xk) + sqrt(delta)) >= abs(firstDerVal(xk) - sqrt(delta))
    z = (-2*polyVal(xk)) / (firstDerVal(xk) + sqrt(delta));
    return;
else
    z = (-2*polyVal(xk)) / (firstDerVal(xk) - sqrt(delta));
    return;
end


end

