%Muller MM1 method

x = linspace(-25,5, 30);
nb = 0;
result = 0;
p = 0;
for i=1:size(x',1)-2
    [y, iter] = MM1_final(x(i),x(i+1),x(i+2),10e-10);
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


% x = linspace(-25,25,10e5);
% for i=1:size(x')
%     z(i) = polyVal(x(i));
% end
% 
% plot(x,z, '-');
% line(xlim, [0 0]);
% grid on;