function res = checkerboard(rows, cols)
    if nargin < 2
        cols = rows;
    end
    res = true(rows, cols);
    for i = 1:rows
      for j = 1:cols
        if mod(i, 2) != 0 && mod(j, 2) == 0
          res(i, j) = false;
        elseif mod(i, 2) == 0 && mod(j, 2) != 0
          res(i, j) = false;
        end
      end
    end
end
