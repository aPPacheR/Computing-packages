function half(f, a, b)
    x = linspace(a, b, 100);
    plot(x, f(x));
    hold on
    plot(x, 0 * x);
    roots = [];
    eps = 1e-10;
    for i = 1:length(x)-1
        if f(x(i)) * f(x(i+1)) < 0
            while abs(x(i+1) - x(i)) > eps
                c = (x(i) + x(i+1)) / 2;
                if f(c) == 0
                    break;
                elseif f(c) * f(x(i)) < 0
                    x(i+1) = c;
                else
                    x(i) = c;
                end
                root = (x(i) + x(i+1)) / 2;
            end
            roots = [roots, root];
            prevRoot = root;
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
