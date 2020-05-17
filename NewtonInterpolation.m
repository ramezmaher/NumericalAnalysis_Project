
function Ans = NewtonInterpolation(X, y)

if(length(X)~=length(y))
    error('Wrong input');
end
n = length(X);
syms x;
y(n, n) = 0;
for column = 2:n
    for row = column:n
        y(row, column) = (y(row, column-1)-y(row-1, column-1))/(X(row)-X(row-column+1));
    end
end
F = 1;
Ans = 0;
for i = 1:n
    Ans = Ans + y(i, i)*F;
    F = F*(x-X(i));
end
end