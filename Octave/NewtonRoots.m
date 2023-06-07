function NewtonRoots(f, a, b)
    x = linspace(a, b, 100);
    plot(x, f(x));
    hold on
    plot(x, 0 * x);
    roots = [];
    eps = 1e-10;
    h = 1e-6;
    for i = 1:length(x)-1
        if f(x(i)) * f(x(i+1)) < 0
            if f(x(i)) == 0
                roots = [roots, x(i)];
                continue;
            end
            x1 = x(i);
            x2 = x(i+1);
            while abs(x2 - x1) > eps
                df = (f(x2 + h) - f(x2 - h)) / (2 * h); 
                x_next = x2 - f(x2) / df;
                if abs(x_next - x2) < eps
                    break;
                end 
                x1 = x2;
                x2 = x_next;
            end
            root = (x1 + x2) / 2;
            roots = [roots, root];
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
