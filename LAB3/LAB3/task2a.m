x0RK4 =[8 7];
x0PEKE = x0RK4;
x0_ODE = x0RK4;
interval = [0 20];
h=0.021244;

trajectoryRK4=zeros(int64(20/h),2);
fnRK4=zeros(int64(20/h),2);
trajectoryRK4(1,1)=x0RK4(1);
trajectoryRK4(1,2)=x0RK4(2);

fnRK4(1,1) = v1(x0RK4(1), x0RK4(2));
fnRK4(1,2) = v2(x0RK4(1), x0RK4(2));

%ode
% f1 = @(t,x1,x2) (x2+x1*(0.5-(x1^2)-(x2^2)));
% f2 = @(t,x1,x2) (-x1+x2*(0.5-(x1^2)-(x2^2)));
fx = @(t,x)     [ x(2)+x(1)*(0.5-x(1)^2-x(2)^2);
                 -x(1)+x(2)*(0.5-x(1)^2-x(2)^2) ];
             
time1(1) = interval(1);
j = 1;
while(time1 <= interval(2))
    j = j+1;
    trajectoryRK4(j,:)=yval(x0RK4(1),x0RK4(2),h);
    x0RK4 = trajectoryRK4(j,:);
    
    fnRK4(j,1) = v1(x0RK4(1), x0RK4(2));
    fnRK4(j,2) = v2(x0RK4(1), x0RK4(2));
    time1(j) = time1(j-1)+h;
end

%ADAMS
for i=1:5
    trajectoryPEKE(i,1) = trajectoryRK4(i,1);
    trajectoryPEKE(i,2) = trajectoryRK4(i,2);
    fnPEKE(i,1) = fnRK4(i,1);
    fnPEKE(i,2) = fnRK4(i,2);
    time2(i) = time1(i);
end
x0PEKE(1) = trajectoryPEKE(5,1);
x0PEKE(2) = trajectoryPEKE(5,2);


j=5;
while (time2 <= interval(2))
    j = j+1;
    [x0PEKE, fnp] = Adams(trajectoryPEKE,fnPEKE,h);
    trajectoryPEKE(j,1) = x0PEKE(1);
    trajectoryPEKE(j,2) = x0PEKE(2);
    fnPEKE(j,1) = fnp(1);
    fnPEKE(j,2) = fnp(2);
    time2(j) = time2(j-1)+h;
end


figure(1);
plot(trajectoryRK4(:,1),trajectoryRK4(:,2), 'b-', 'LineWidth',2);
grid on;
hold on;
plot(trajectoryPEKE(:,1),trajectoryPEKE(:,2), 'k-.', 'LineWidth',2);
hold on
[TOUT, YOUT] = ode45(fx, interval, x0_ODE);
plot(YOUT(:,1),YOUT(:,2),'r--', 'LineWidth',2);

figure(2);
plot(time1,trajectoryRK4(:,1), 'b-');
grid on;
hold on;
plot(time1,trajectoryRK4(:,2), 'b-', 'LineWidth',2);
plot(time2,trajectoryPEKE(:,1), 'k-.');
plot(time2,trajectoryPEKE(:,2), 'k-.', 'LineWidth',2);
plot(TOUT,YOUT(:,1), 'r--');
plot(TOUT,YOUT(:,2), 'r--', 'LineWidth',2);

% plot(trajectoryPEKE(:,1),trajectoryPEKE(:,2), 'g-.');
% hold on
% [TOUT, YOUT] = ode45(fx, interval, x0_ODE);
% plot(YOUT(:,1),YOUT(:,2),'r--');
% plot(TOUT(:,1),YOUT(:,2),'r--', 'LineWidth',2);
% plot(linspace(0,0.039410,size(trajectoryPEKE,1)),trajectoryPEKE(:,1), 'g-.');
% plot(linspace(0,0.039410,size(trajectoryPEKE,1)),trajectoryPEKE(:,2), 'g-.', 'LineWidth',2);