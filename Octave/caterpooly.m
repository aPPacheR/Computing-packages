function caterpooly(pos, vel, rect, n)
    x = pos(1);
    y = pos(2);
    vx = vel(1);
    vy = vel(2);
    lx = rect(1);
    ly = rect(2);
    rx = rect(3);
    ry = rect(4);
    
    for i = 1:n
        if x + vx >= lx && x + vx <= rx && y + vy >= ly && y + vy <= ry
            if y + vy == ry || y + vy == ly
                vy = -vy;
            end
            if x + vx == lx || x + vx == rx
                vx = -vx;
            end
            x = x + vx;
            y = y + vy;
        else
            if y + vy > ry || y + vy < ly
                vy = -vy;
            end
            if x + vx < lx || x + vx > rx
                vx = -vx;
            end
            x = x + vx;
            y = y + vy;
        end
        
        fprintf('%f %f\n', x, y);
    end
end

#pos = [0 0];
#vel = [1 2];
#rect = [0 0 10 10];
#n = 10;
#caterpooly(pos, vel, rect, n);
