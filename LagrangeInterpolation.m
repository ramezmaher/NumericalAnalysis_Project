function Ans = LagrangeInterpolation(X, Y)

if(length(X)~=length(Y))
    error('Wrong input');
end
syms x;
n = length(X);
Ans = 0;
for i = 1:n
    L = 1;
    for j = 1:n
      if(i == j)
        continue;
      end
      L = L*(x-X(j));
    end
    for j = 1:n
      if(i == j)
        continue;
      end
      L = L/(X(i)-X(j));
    end
    Ans = Ans + L*Y(i);
end
end