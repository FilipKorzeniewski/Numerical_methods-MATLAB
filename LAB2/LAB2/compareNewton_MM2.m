%comparison of MM2 and Newton


Newton_val1(1,1) = polyVal(-3); Newton_val1(2,1) = -3;
MM2_val1 = polyVal(-3); MM2_val1(2,1) = -3;

Newton_val2 = Newton_compare(-3, -2);
MM2_val2 = MM2_compare(-3);

Newton_val = [Newton_val1 Newton_val2];
MM2_val = [MM2_val1 MM2_val2];

x = 0:15;
Newton_plot = abs(Newton_val(1,:)); MM2_plot = abs(MM2_val(1,:));
figure(1);
plot(x, Newton_plot(1,:), 'b*-');
hold on;
plot(x, MM2_plot(1,:), 'r*-');
hold off

% line(xlim, [0 0]);
grid on;