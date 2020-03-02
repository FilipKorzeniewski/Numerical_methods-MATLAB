function [IntervalMatrix] = bisection_func(a, b, delta, max_iter)
%function that look for zeros in whole generally given interval

LocalIntervals = localInterval(a, b, delta);
IntervalMatrix = zeros(1,2);

for i=1:size(LocalIntervals)
    IntervalMatrix(i,:) = bisection_funcLocal(LocalIntervals(i,1), LocalIntervals(i,2), delta, max_iter);
end    

end

