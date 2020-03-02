%comparison of MM1 and MM2;

MM1_val1(1,1) = polyVal(-3); MM1_val1(2,1) = -3;
MM2_val1 = polyVal(-3); MM2_val1(2,1) = -3;

MM1_val2 = MM1_compare(-5,-4,-3);
MM2_val2 = MM2_compare(-3);

MM1_val = [MM1_val1 MM1_val2];
MM2_val = [MM2_val1 MM2_val2];

x = 0:15;
MM1_plot = abs(MM1_val(1,:)); MM2_plot = abs(MM2_val(1,:));
figure(1);
plot(x, MM1_plot(1,:), 'b*-');
hold on;
plot(x, MM2_plot(1,:), 'r*-');
hold off

% line(xlim, [0 0]);
grid on;