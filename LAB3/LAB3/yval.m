function result = yval(x1,x2,h)
%function counting yn+1 val

    result = zeros(1,2);
    
    k11=v1(x1,x2);
    k12=v2(x1,x2);
    k21=v1(x1+0.5*h*k11,x2+0.5*h*k12);
    k22=v2(x1+0.5*h*k11,x2+0.5*h*k12);
    k31=v1(x1+0.5*h*k21,x2+0.5*h*k22);
    k32=v2(x1+0.5*h*k21,x2+0.5*h*k22);
    k41=v1(x1+h*k31,x2+h*k32);
    k42=v2(x1+h*k31,x2+h*k32);


    result(1) = x1+(1/6)*h*(k11+2*k21+2*k31+k41);
    result(2) = x2+(1/6)*h*(k12+2*k22+2*k32+k42);
end

