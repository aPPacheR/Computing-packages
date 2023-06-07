function m = fence(rows, cols)
    if nargin < 2
        cols = rows;
    end
    m = true(rows, cols);
    for j = 2:2:cols
      for i = 1:rows
        m(i, j) = false;
      end
    end
end
