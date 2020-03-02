[x, i__, h_, d_]=RK4STEP(10 ^ -3);
i__(end+1) = 20;
interval = [0 20];
x0_ODE = [8 7];

figure(2);
plot(i__,x(:,1), 'b-');
grid on;
hold on;
plot(i__,x(:,2), 'b-', 'LineWidth',2);
hold on
fx = @(t,x)     [ x(2)+x(1)*(0.5-x(1)^2-x(2)^2);
                 -x(1)+x(2)*(0.5-x(1)^2-x(2)^2) ];
[TOUT, YOUT] = ode45(fx, interval, x0_ODE);
plot(TOUT(:,1),YOUT(:,1),'r--');
plot(TOUT(:,1),YOUT(:,2),'r--', 'LineWidth',2);