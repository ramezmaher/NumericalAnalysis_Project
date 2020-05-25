function [iterations,size,X_old,X_new,error] = FixedPoint_iteration(g,n,t,p)
% Equation root finder
%   finds the root of an equation by using the fixed-poiny iteration method
X_old = zeros(1,n);
iterations=zeros(1,n);
error = zeros(1,n);
X_new = zeros(1,n);
i=1;
X_old(i)=p;
gx = str2func(['@(x)',g]);
X_new(i)=feval(gx,X_old(i));
while i<=n
    iterations(i)=i;
    size=i;
    if(X_new(i) ~= 0)
        error(i) = abs((X_new(i)-X_old(i))/X_new(i))*100;
    end
    if(error(i) <= t) 
        break;
    end
    i = i+1;
    X_old(i)=X_new(i-1);
    X_new(i)=feval(gx,X_old(i));
end
end

