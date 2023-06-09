function fracto(coefficients, rect_corner1, rect_corner2, num_points_x, num_points_y)
    epsilon = 1e-10;

    roots = roots(coefficients);
    disp("Roots:");
    for i = 1:length(roots)
        disp(['x', num2str(i), ' = ', num2str(roots(i))]);
    end

    colormap(viridis(length(roots) + 1));

    x_coords = [rect_corner1(1), rect_corner2(1)];
    y_coords = [rect_corner2(2), rect_corner1(2)];

    x = linspace(x_coords(1), x_coords(2), num_points_x);
    y = linspace(y_coords(1), y_coords(2), num_points_y);

    [X, Y] = meshgrid(x, y);
    Z = X + 1i * Y;

    for k = 1:100
        Z = Z - polyval(coefficients, Z) ./ polyval(polyder(coefficients), Z);
    end

    z_arr = zeros([size(Z), length(roots)]);

    for k = 1:length(roots)
        z_arr(:,:,k) = abs(Z - roots(k)) < epsilon;
    end

    z_last = zeros(size(Z));
    z_all = zeros(size(Z));

    for k = 1:length(roots)
        z_last = z_last + z_arr(:,:,k);
        z_all = z_all + z_arr(:,:,k) .* k;
    end

    z_last = ~z_last;
    z_all = z_all + z_last .* (length(roots) + 1);
    
    image(x_coords, y_coords, z_all);
end

# coefficients = [8, -7, 6, -5, 4, -3, 2, -1];
# rect_corner1 = [-10, 10];
# rect_corner2 = [10, -10];
# num_points_x = 1000;
# num_points_y = 1000;
# fracto(coefficients, rect_corner1, rect_corner2, num_points_x, num_points_y);
