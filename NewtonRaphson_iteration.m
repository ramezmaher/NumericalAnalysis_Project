function [iterations,root,error,fval,fdash] = NewtonRaphson_iteration(f,x0,n,t)
%Newton-Raphson's method  
%   Open method for root finding
root = zeros(1,n);
iterations = zeros(1,n);
error = zeros(1,n);
fval = zeros(1,n);
fdash = zeros(1,n);
i=1;
y = diff(f);
Y = matlabFunction(y);
fx = matlabFunction(f);
X = x0;
while i<n
    iterations(i) = i;
    fval(i) = feval(fx,X); 
    fdash(i) = feval(Y,X);
    root(i) = X-(fval(i)/fdash(i));
    if(root(i) ~= 0)
        error(i)=(root(i)-X)/root(i);
    end
    if(abs(error(i)) <= t)
        break;
    end
    X=root(i);
    i = i+1;
end

