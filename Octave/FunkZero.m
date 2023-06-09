function FunkZero(f, a, b)
  x = linspace(a, b, 100);
  plot(x, f(x));
  hold on
  plot(x, 0*x);
  roots = [ ];
  for i = 1:length(x) - 1
    if f(x(i)) * f(x(i+1)) < 0
      res = fzero(f, [x(i), x(i+1)]);
      roots = [roots, res];
    end
  end
  roots = unique(roots);
  disp("Roots:");
  for i = 1:length(roots)
    disp(['x', num2str(i), ' = ', num2str(roots(i))]);
  end
end

#f = @(x) sin(x) + exp(-x/2);
#a = 0;
#b = 10;
#FunkZero(f, a, b);
