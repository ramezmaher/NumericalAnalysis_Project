function [iterations,xl,xu,xr,fxr] = bisection(func, lower, upper, ea, imax)

% PREALLOCATING ARRAYS USED
xl = zeros(1,imax);
xu = zeros(1,imax);
xr = zeros(1,imax);
fxr = zeros(1,imax);
fxl = zeros(1,imax);
fxu = zeros(1,imax);
iterations = 0;

xl(1) = lower;
xu(1) = upper;
fxl(1) = feval(func, xl(1));
fxu(1) = feval(func, xu(1));

if (fxl(1) * fxu(1)) > 0
    error('No bracket');
end

for i = 1:imax
    iterations = i;
    
    xr(i) = (xl(i)+xu(i))/2;
    fxr(i) = feval(func, xr(i));
    if (fxr(i) == 0.0)
        break;
    elseif (fxr(i)*fxl(i) < 0)
        xl(i+1) = xl(i); fxl(i+1) = fxl(i);
        xu(i+1) = xr(i); fxu(i+1) = fxr(i);
    else
        xu(i+1) = xu(i); fxu(i+1) = fxu(i);
        xl(i+1) = xr(i); fxl(i+1) = fxr(i);
    end
    if (i>1 && (abs(xr(i)-xr(i-1))<ea))
        break;
    end
end
            