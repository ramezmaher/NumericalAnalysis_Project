
file = input('Enter F for file input or C for console input: \n', 's');
X = 0;
Y = 0;
if(file == 'C')
    n = input('Enter number of points \n');
    disp('Enter in the following format: x y ')
    X = zeros(1, n);
    Y = zeros(1, n);
    for i = 1:n
      val = input('', 's');
      val = regexp(val, '[ ]', 'split');
      val = str2double(val);
      if(length(val) ~= 2)
          error('Write two points x y only');
      end
      X(i) = val(1);
      Y(i) = val(2);
    end
elseif (file == 'F')
    fileName = input('Enter file name: \n', 's');
    z = load(fileName);
    X = z(:, 1);
    X = X';
    Y = z(:, 2);
    Y = Y';
else
    error('Write Only C or F!');
end;

Method = input('Enter N for Newton''s Method or L for Lagrange''s Method: \n', 's');
R = 0;
tic;
if(Method == 'N')
   R = NewtonInterpolation(X, Y);
elseif(Method == 'L')
   R = LagrangeInterpolation(X, Y);
else
    error('Write only N or L');
end
elapsed = toc;
Func = matlabFunction(R);
disp(sprintf('Excution time is %f', elapsed));
disp('The interpolated function is: ')
disp(R);


x2 = 1:0.1:5;
y2 = Func(x2);
plot(X, Y, 'o');
hold on;
plot(x2, y2);
xlabel('x Axis');
ylabel('F(x) Axis');
legend('Input point', 'Fitting curve');
title(texlabel(R));
