[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);
z = sin(x) + cos(y);

surfc(x, y, z);
hold on;

point = [1, -1, 1];
normal = [cos(point(1)), -sin(point(2)), 1];
direction = normal - point;

X = [point(1), 2 * direction(1) + point(1)];
Y = [point(2), 2 * direction(2) + point(2)];
Z = [point(3), 2 * direction(3) + point(3)];
plot3(X, Y, Z);

xlabel('X');
ylabel('Y');
zlabel('Z');
