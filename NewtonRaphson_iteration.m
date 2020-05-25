function [iterations,root,X,error,size] = NewtonRaphson_iteration(fx,x0,n,t)
%Newton-Raphson's method  
%   Open method for root finding
root = zeros(1,n);
iterations = zeros(1,n);
error = zeros(1,n);
X=zeros(1,n);
i=1;
Fx=str2func(['@(x)',fx]);
f=str2sym(fx);
y = diff(f);
Y = matlabFunction(y);
X(i) = x0;
while i<n
    iterations(i) = i;
    size = i;
    fval = feval(Fx,X(i)); 
    fdash = feval(Y,X(i));
    root(i) = X(i)-(fval/fdash);
    if(root(i) ~= 0)
        error(i)=abs((root(i)-X(i))/root(i))*100;
    end
    if(error(i) <= t)
        break;
    end
    i=i+1;
    X(i)=root(i-1);
end

