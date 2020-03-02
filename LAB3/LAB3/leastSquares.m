function [A, a,resi] = leastSquares(x,y,N)
%discrete least-squares

    y = y';
    N = N+1;
    length = size(x, 2);
    A = zeros(length, N);
    
    for i = 1:length
        for j = 1:N
            A(i, j)=x(i)^(j-1);
        end
    end
    
    [Q,R] = qrmgs(A);
    a = R\Q'*y; %coefficients according to linear least squares
    resi = norm(R*a - Q'*y); %residuum vector
end

