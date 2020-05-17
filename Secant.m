function [iterations, root, error, fval] = Secant(fx,x0,n,t,x)
iterations = zeros(1,n);
root = zeros(1,n);
error = zeros(1,n);
fval = zeros(1,n);
f = matlabFunction(fx);
X=x0;
Xp=x;
i=1;
while i<=n
    fval(i) = feval(f,X);
    fdash = feval(f,Xp);
    root(i) = X-((fval(i)*(Xp-X))/ fdash - fval(i));
    if(root(i)~=0)
        error(i)=(root(i)-X)/root(i);
    end
    if(abs(error(i))<=t)
        break;
    end
    Xp=X;
    X=root(i);
    i=i+1;
end
end