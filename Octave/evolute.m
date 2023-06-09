function retval = evolute (x, y, t)
  h = 1e-6;
  dfx = @(t) (x(t + h) - x(t)) / h;
  dfy = @(t) (y(t + h) - y(t)) / h;
  d2fx = @(t) (dfx(t + h) - dfx(t)) / h;
  d2fy = @(t) (dfy(t + h) - dfy(t)) / h;
  X1 = x(t) - dfy(t) .* (((dfx(t)).^2 + (dfy(t)).^2) ./ (dfx(t) .* d2fy(t) - d2fx(t) .* dfy(t)));
  Y1 = y(t) + dfx(t) .* (((dfx(t)).^2 + (dfy(t)).^2) ./ (dfx(t) .* d2fy(t) - d2fx(t) .* dfy(t)));
  comet(X1, Y1);
endfunction

#Кардиоида:
#t = linspace(0, 2*pi, 100);
#x = @(t) 2*cos(t).*(1 - cos(t));
#y = @(t) 2*sin(t).*(1 - cos(t));
#evolute(x, y, t);
