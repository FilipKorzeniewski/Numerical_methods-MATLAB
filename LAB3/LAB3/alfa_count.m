function [alfa] = alfa_count(epsilon, delta)

    compare(1) = (epsilon(1)/abs(delta(1)));
    compare(2) = (epsilon(2)/abs(delta(2)));
    
    if compare(1) <= compare(2)
        alfa = compare(1);
    else
        alfa = compare(2);
    end
    alfa = alfa ^ 0.2;
end

