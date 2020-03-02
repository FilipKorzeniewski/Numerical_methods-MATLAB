%task2b
%RK4 with variable step size automitacally adjusted
%initial values
x0 = [8 7];
x0_ODE = x0;
interval = [0 20];
h0 = 10 ^ -3;
trajectory = x0;
err = [0 0];
alfa = 0;

hmin = 10 ^ -9;
epsAbs = 10 ^ -7;
epsRel = 10 ^ -7;

s = 0.9;
h(1) = h0;
n = 1;
i(1) = interval(1);
p = 0;

%iterations
while i <= interval(2)
    p = p + 1;
    x0 = yval(trajectory(n,1), trajectory(n,2), h(n));
    trajectory(n+1,1) = x0(1);
    trajectory(n+1,2) = x0(2);
    
    [err(n,:),y2] = err_step_dbl(x0, trajectory(n,:), h(n));
    eps(1) = abs(y2(1))*epsRel + epsAbs;
    eps(2) = abs(y2(2))*epsRel + epsAbs;
    alfa(n,1) = alfa_count(eps, err(n,:));
    hg = s * alfa(n,1) * h(n);
    
    if s*alfa(n,1) >= 1
        if((i(n)+h(n)) >= interval(2))
            break;
        end
        i(n+1) = i(n)+h(n);
        h(n+1,1) = min([hg, 5*h(n), abs(interval(2)-i(n))]);
        n = n+1;
    elseif hg < hmin
        disp("CANNOT BE SOLVED");
        break;
    else
        h(n) = hg;
    end
end

figure(1);
plot(trajectory(:,1),trajectory(:,2),'b-');
hold on;
fx = @(t,x)     [ x(2)+x(1)*(0.5-x(1)^2-x(2)^2);
                 -x(1)+x(2)*(0.5-x(1)^2-x(2)^2) ];
[TOUT, YOUT] = ode45(fx, interval, x0_ODE);
plot(YOUT(:,1),YOUT(:,2),'r--');

figure(3)
plot(i,h(:,1), 'b-');

figure(4)
plot(i, abs(err(:,1)), 'b-');
grid on;
hold on;
plot(i, abs(err(:,2)), 'r-');

i(end+1) = 20;
figure(2);
plot(i,trajectory(:,1), 'b-');
grid on;
hold on;
plot(i,trajectory(:,2), 'b-', 'LineWidth',2);
% hold on
% [TOUT, YOUT] = ode45(fx, interval, x0_ODE);
plot(TOUT(:,1),YOUT(:,1),'r--');
plot(TOUT(:,1),YOUT(:,2),'r--', 'LineWidth',2);
