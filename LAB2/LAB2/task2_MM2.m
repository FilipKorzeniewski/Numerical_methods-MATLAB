%Muller MM2 method

x = linspace(-2, 5, 16);
nb = 0;
result = 0;
p = 0;
for i=1:size(x',1)
    [y, iter(i)] = MM2_final(x(i),10e-10);
    for j=1:size(result' ,1)
        if abs(result(j) - y) > 10e-10
            nb = nb + 1;
        end
    end
  
    if nb == size(result', 1)
        p = p + 1;
        result(p) = y;
    end
    nb = 0;
end