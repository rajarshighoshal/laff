function [y_out] = laff_copy2(x,y)

% y = laff_copy2( x, y ) copies vector x into vector y
%   Vectors x and y can be a mixture of column and/or row vector.  In other
%   words, x and y can be n x 1 or 1 x n arrays.  However, one size must 
%   equal 1 and the other size equal n.  
% 
%   The reason y is an input parameter is that the input y indicates 
%   whether the output, y_out, is a column or row vector, and then also
%   indicates whether x must be transposed (e.g., if x is a row vector and
%   y is a column vector).

% extract the row and column sizes of x and y
[m_x, n_x] = size(x);
[m_y, n_y] = size(y);

% make sure x and y are row or column vectors of same size
if (m_x ~= 1 && n_x ~= 1) || (m_y ~= 1 && n_y ~= 1)
    y_out = "FAILED";
    return
end
if(m_x*n_x ~= m_y*n_y)
    y_out = "FAILED";
    return
end

if (n_x == 1) % if x is column vector
    if (n_y == 1) % if y is column vector
        % copy the elements of x into the elements of y
        for i=1:m_x
            y(i,1) = x(i,1);
        end
    else % if y is row vector
        % copy the elements of x into the elements of y
        for i=1:m_x
            y(1,i) = x(i,1);
        end
    end
else % if x is a row vector
    if (n_y == 1) % if y is a column vector
        for i=1:n_x
             y(i,1) = x(1,i);
        end
    else % if y is a row vector
        for i=1:n_x
             y(1,i) = x(1,i);
        end
    end
end

% return the updated y in y_out
y_out =y;

return 
end

