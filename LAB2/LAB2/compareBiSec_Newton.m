%comparison of Bisection and Newton's;

Newton_val1(1,1) = myfunc(7); Newton_val1(2,1) = 7;
Bisek_val1 = myfunc(7); Bisek_val1(2,1) = 7;

Newton_val2 = Newton_compare1(7,8);
Bisek_val2 = bisection_compare(7,8,20);

Newton_val2 = Newton_val2';
Bisek_val2 = Bisek_val2';

Newton_val = [Newton_val1 Newton_val2];
Bisek_val = [Bisek_val1 Bisek_val2];

x = 0:20;
Newton_plot = abs(Newton_val(1,:)); Bisek_plot = abs(Bisek_val(1,:));
figure(1);
plot(x, Newton_plot(1,:), 'b*-');
hold on;
plot(x, Bisek_plot(1,:), 'r*-');
hold off

% line(xlim, [0 0]);
grid on;