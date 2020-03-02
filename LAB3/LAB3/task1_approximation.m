x = -5:5;
y = [-7.7743 -0.2235 1.9026 0.6572 0.1165 -1.8144 -1.0968 -0.8261 1.3327 6.1857 8.2892];


N = 9; %polynomial power
resi = zeros(N+1,1);
difference = zeros(N+1,1);

A = zeros(size(x,2), N+1);
a = zeros(size(x,2)-1, N+1);
matCond = zeros(N+1,1);
y2 = zeros(N+1,size(x,2));


for i=0:N
    [A, p, resi(i+1)]=leastSquares(x, y, i);
    for j=1:size(p,1)
        a(j,i+1) = p(j,1);
    end
    
    matCond(i+1) = cond(A);
    y2(i+1,:) = polyVal(p, x);
    difference(i+1) = norm(y2(i+1,:)-y);
end
% y2 = y2';
xn = linspace(-5,5,10000);
yn = zeros(10,size(xn,2));
for i=1:10
    b = zeros(i,1);
    for j=1:10
        if(a(j,i) == 0)
            break;
        end 
        b(j) = a(j,i);
    end
    yn(i,:) = polyVal(b,xn);
    if(i ~= 10)
        clear b;
    end
end

%plots
figure(1);
scatter(x,y);
for i=1:10
    hold on;
    plot(xn,yn(i,:));
end
hold off;
grid on;

figure(2);
plot(0:9, difference, 'r*-');

figure(3);
plot(0:9, resi, 'r*-');
    