%task 1 - Newton's method

[y, iter] = Newton_funcLocal(4, 6, 10e-10);
difference = y(1)-y(2);
sprawdzenie=(y(1)+y(2))/2;
fx = myfunc(sprawdzenie(1));