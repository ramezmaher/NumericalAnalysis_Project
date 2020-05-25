function [iterations, root, error,size,point1,point2] = Secant(fx,x0,n,t,x1)
iterations = zeros(1,n);
root = zeros(1,n);
error = zeros(1,n);
point1 = zeros(1,n);
point2 = zeros(1,n);
f = str2func(['@(x)',fx]);
i=1;
point1(i)=x0;
point2(i)=x1;
while i<=n
    iterations(i)=i;
    size=i;
    fval = feval(f,point2(i));
    fdash = feval(f,point1(i));
    root(i) = point2(i)-((fval*(point1(i)-point2(i)))/ fdash - fval);
    if(root(i)~=0)
        error(i)=abs((root(i)-point2(i))/root(i))*100;
    end
    if(error(i)<=t)
        break;
    end
    i=i+1;
    point1(i)=point2(i-1);
    point2(i)=root(i-1);
end
end