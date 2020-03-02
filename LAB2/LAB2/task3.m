%Lagguerre method

x = linspace(-10, 10, 21);
nb = 0;
result = 0;
p = 0;
for i=1:size(x',1)
    [y, iter(i)] = LG_final(x(i),10e-15);
    for j=1:size(result' ,1)
        if abs(result(j) - y) > 10e-15
            nb = nb + 1;
        end
    end
  
    if nb == size(result', 1)
        p = p + 1;
        result(p) = y;
    end
    nb = 0;
end
