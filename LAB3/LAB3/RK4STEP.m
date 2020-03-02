function [x, i__, h_, d_] = RK4STEP(h)
    f1 = @(x1, x2)  x2 + x1 * (0.5 - x1^2 - x2^2);
    f2 = @(x1, x2) -x1 + x2 * (0.5 - x1^2 - x2^2);
    
    s = .9;
    x(1, :) = [8, 7];
    hmin = 10 ^ -10; Ew = 10 ^ -8; Eb = 10 ^ -8;
    
    function [a, d] = alfa(y1, y2)        
        d = (y2 - y1) ./ 15;
        e = abs(y2) .* Ew + Eb;
        a = min(e ./ abs(d)) ^ .2;
    end

    function [x] = rk(x, h)
        k(1, 1) = f1(x(1),                     x(2));
        k(1, 2) = f2(x(1),                     x(2));
        
        k(2, 1) = f1(x(1) + 0.5 * h * k(1, 1), x(2) + 0.5 * h * k(1, 2));
        k(2, 2) = f2(x(1) + 0.5 * h * k(1, 1), x(2) + 0.5 * h * k(1, 2));

        k(3, 1) = f1(x(1) + 0.5 * h * k(2, 1), x(2) + 0.5 * h * k(2, 2));
        k(3, 2) = f2(x(1) + 0.5 * h * k(2, 1), x(2) + 0.5 * h * k(2, 2));

        k(4, 1) = f1(x(1) +       h * k(3, 1), x(2) +       h * k(3, 2));
        k(4, 2) = f2(x(1) +       h * k(3, 1), x(2) +       h * k(3, 2));
        
        x(1) = x(1) + 1/6 * h * (k(1, 1) + 2 * k(2, 1) + 2 * k(3, 1) + k(4, 1));
        x(2) = x(2) + 1/6 * h * (k(1, 2) + 2 * k(2, 2) + 2 * k(3, 2) + k(4, 2));
    end

    n = 1;
    i = 0;
    while 1
        h_(n) = h;
        i__(n) = i;
        x1 = rk(x(n, :), h);
        x(n + 1, :) = x1;
        x2 = rk(x(n, :), h * .5);
        x2 = rk(x2,      h * .5);

        [a, d] = alfa(x1, x2);
        d_(n, :) = d;

        if s * a  >= 1
            if i + h >= 20
                break;
            else
                i_ = i;
                i = i + h;
                h = min([s * a * h, 5 * h, 20 - i_]);
                n = n + 1;
            end
        else
            if s * a * h < hmin
                error('impossible to solve');
            else
                h = s * a * h;
            end
        end
    end
end