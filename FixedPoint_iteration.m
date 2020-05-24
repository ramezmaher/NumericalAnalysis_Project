function [iterations,root,error,Fx,size] = FixedPoint_iteration(f,g,n,t,p)
% Equation root finder
%   finds the root of an equation by using the fixed-poiny iteration method
root = zeros(1,n);
iterations = zeros(1,n);
error = zeros(1,n);
Fx = zeros(1,n); 
i = 1;
X_old=p;
gx = str2func(['@(x)',g]);
fx = str2func(['@(x)',f]);
while i<=n
    iterations(i)=i;
    size=i;
    X_new = feval(gx,X_old);
    root(i) = X_new;
    Fx(i) = feval(fx,X_new);
    if(X_new ~= 0)
        error(i) = ((X_new-X_old)/X_new)*100;
    end
    if(abs(error(i)) <= t) 
        break;
    end
    i = i+1;
    X_old=X_new;
end
end

