function [delta,y2] = err_step_dbl(y1,x,h)

    y2 = yval(x(1), x(2), 0.5*h);
    y2 = yval(y2(1), y2(2), 0.5*h);
    
    delta(1) = (y2(1) - y1(1))/15;
    delta(2) = (y2(2) - y1(2))/15;
    
end

