function res = diagsn(cols, rows)
    if nargin < 2
        rows = cols;
    end

    res = zeros(rows, cols, 'uint32');
    x = 0;
    y = 0;

    for i = 1 : rows * cols
        res(x+1, y+1) = i;
        if mod(x + y, 2) == 0
            if y == cols - 1
                x = x + 1;
            elseif x == 0
                y = y + 1;
            else
                x = x - 1;
                y = y + 1;
            end
        else
            if x == rows - 1
                y = y + 1;
            elseif y == 0
                x = x + 1;
            else
                x = x + 1;
                y = y - 1;
            end
        end
    end
    res = res';
end
