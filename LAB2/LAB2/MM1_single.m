function [y1,y2,y3] = MM1_single(x0, x1, x2)
%function returning new 3 points

[a, b, c] = coeff_count(x0, x1, x2);

x3 = x3count(x2, a, b, c);

x = [x0 x1 x2];
dist = 0;
for i=1:3
    newdist = abs(x3 - x(i));
    if newdist > dist
        dist = newdist;
        to_reject = i;
    end
end

if dist ~= 0
    x(to_reject) = x3;
    temp = x(3);
    x(3) = x(to_reject);
    x(to_reject) = temp;
end    


y1 = x(1);
y2 = x(2);
y3 = x(3);

end

