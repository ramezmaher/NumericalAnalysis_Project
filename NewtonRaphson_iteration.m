function [iterations,root,error,fval,fdash,size] = NewtonRaphson_iteration(fx,x0,n,t)
%Newton-Raphson's method  
%   Open method for root finding
root = zeros(1,n);
iterations = zeros(1,n);
error = zeros(1,n);
fval = zeros(1,n);
fdash = zeros(1,n);
i=1;
Fx=str2func(['@(x)',fx]);
f=str2sym(fx);
y = diff(f);
Y = matlabFunction(y);
X = x0;
while i<n
    iterations(i) = i;
    size = i;
    fval(i) = feval(Fx,X); 
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

