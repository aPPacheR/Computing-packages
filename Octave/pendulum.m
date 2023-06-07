L = 4;
R = 0.5;

function dydt = F_pendulum(t, y)
  L = 4;
  theta = y(1);
  omega = y(2);
  g = 9.8; 
  dtheta_dt = omega;
  domega_dt = -(g / L) * sin(theta);
  dydt = [dtheta_dt; domega_dt];
end

[t, y] = ode45(@F_pendulum, 0:0.01:10, [0, 1]);
thetaArr = y(:, 1)';

figure;
axis equal;
hold on;
pendulumLine = plot(0, 0, 'b', 'LineWidth', 2);
trajectoryLine = plot(0, 0, 'r', 'LineWidth', 1);

for i = 1:length(thetaArr)
  new_x = L * sin(thetaArr(i));
  new_y = -L * cos(thetaArr(i));
     
  set(pendulumLine, 'XData', [0, new_x], 'YData', [0, new_y]);
  set(trajectoryLine, 'XData', L * sin(thetaArr(1:i)), 'YData', -L * cos(thetaArr(1:i)));
    
  drawnow;
  pause(0.01);
end
