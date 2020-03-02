% task1 
%bisection method

% [y, iter] = bisection_func(2,11,10e-7,10e8);
% [y(1,:) , iter(1)] = bisection_funcLocal(4,6,10e-10,10e5);
% [y(2,:), iter(2)] = bisection_funcLocal(7,9,10e-10,10e5);
% check(1) = myfunc((y(1,1)+y(1,2))/2);
% check(2) = myfunc((y(2,1)+y(2,2))/2);

% 
% x = linspace(2,11,10e5);
% for i=1:size(x')
%     z(i) = myfunc(x(i));
% end
% 
% plot(x,z, '-');
% line(xlim, [0 0]);
% grid on;