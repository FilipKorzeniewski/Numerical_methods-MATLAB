function [y,fny] = Adams(trajectory,fn,h)
%computing Adams

%first step
[P] = firstStep(trajectory,fn,h);
%second step
E(1) = v1(P(1), P(2));
E(2) = v2(P(1), P(2));
%third step
[y] = thirdStep(trajectory,fn,E,h);
%4th step
fny(1) = v1(y(1), y(2));
fny(2) = v2(y(1),y(2));

end

function [y] = firstStep(trajectory, fn, h)
%first step of Adams PEKE

    Beta = zeros(1,5);
    Beta(1) = 1901/720;
    Beta(2) = -2774/720;
    Beta(3) = 2616/720;
    Beta(4) = -1274/720;
    Beta(5) = 251/720;
    
    %sum
    sum(1)=0; sum(2)=0;
    for i=0:4
        sum(1) = sum(1)+Beta(i+1)*fn(end-i,1);
        sum(2) = sum(2)+Beta(i+1)*fn(end-i,2);
    end
    
    y(1) = trajectory(end,1) + h*sum(1);
    y(2) = trajectory(end,2) + h*sum(2);
end

function [y] = thirdStep(trajectory,fn,fn0,h)
%third step of Adams PEKE
    Beta0 = 475/1440;
    Beta = zeros(1,5);
    Beta(1) = 1427/1440;
    Beta(2) = -798/1440;
    Beta(3) = 482/1440;
    Beta(4) = -173/1440;
    Beta(5) = 27/1440;

    %sum
    sum = [0 0];
    for i=0:4
        sum(1) = sum(1) + Beta(i+1)*fn(end-i,1);
        sum(2) = sum(2) + Beta(i+1)*fn(end-i,2);
    end
    
    y(1) = trajectory(end,1) + h*sum(1) + h*Beta0*fn0(1);
    y(2) = trajectory(end,2) + h*sum(2) + h*Beta0*fn0(2);
end
