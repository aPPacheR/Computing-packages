function visualize_snake(x_func, y_func, t_range)
    t = linspace(t_range(1), t_range(2), 1000); 
    x = x_func(t); 
    y = y_func(t); 
    
    comet(x, y); 
    
    xlabel('X');
    ylabel('Y');
    grid on;
end


# спираль
#a = 0.5; % Параметр, влияющий на размер спирали
#b = 0.1; % Параметр, влияющий на скорость витков спирали
#x_func = @(t) (a + b * t) .* cos(t); % Функция x(t) - координата x
#y_func = @(t) (a + b * t) .* sin(t); % Функция y(t) - координата y
#t_range = [0, 10]; % Диапазон значений t
#visualize_snake(x_func, y_func, t_range);

# синусоида
#x_func = @(t) sin(t); % Функция x(t) - синусоида
#y_func = @(t) t; % Функция y(t) - просто t
#t_range = [0, 10]; % Диапазон значений t
#visualize_snake(x_func, y_func, t_range);
