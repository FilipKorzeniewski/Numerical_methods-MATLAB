function [val] = MM1_compare(x0, x1, x2)
%function counting Roots 

x = [abs(polyVal(x0)) abs(polyVal(x1)) abs(polyVal(x2))];
minim = min(x);
for i=1:2
    if x(i) == minim 
        temp = x2;
        x2 = x(i);
        x(i) = temp;
    end
end
iter = 0;
val = zeros(2,15);
while iter < 15
    [x0, x1, x2] = MM1_single(x0, x1, x2);
    iter = iter + 1;
    val(1, iter) = polyVal(x2);
    val(2, iter) = x2;
end

end

