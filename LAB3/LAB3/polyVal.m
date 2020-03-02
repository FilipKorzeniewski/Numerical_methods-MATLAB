function [y] = polyVal(a,x)
%function counting polynomial(approximated function) value
    n = size(x, 2);
    n2 = size(a, 1);
    y = zeros(1,n);
    for i=1:n
        for j=1:n2
            y(i) = y(i)+a(j)*x(i)^(j-1);
        end
    end
end