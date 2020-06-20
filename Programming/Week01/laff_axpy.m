function [ y_out ] = laff_axpy( alpha, x, y )

% y_out = laff_axpy( x, y ) scales vector x by a 
% factor of alpha then adds the resulting vector 
% with vector y to produce a new vector y_out. y_out
% must have same dimension as y.
% 
%   Vectors x and y can be a mixture of column and/or row vector.  
%   In other words, x and y can be n x 1 or 1 x n arrays.  
%   However, one size must equal 1 and the other size equal n.  
%   Also, alpha needs to be a scalar.

% Extract the row and column sizes of x and y
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% Make sure x and y are (row or column) vectors of equal length
if ( m_x ~= 1 & n_x ~= 1 ) | ( m_y ~= 1 & n_y ~= 1 )
    y_out = 'FAILED';
    return
end
if ( m_x * n_x ~= m_y * n_y )
    y_out = 'FAILED';
    return
end
% Make sure alpha is a scalar
if ~isscalar( alpha )
    y_out = "FAILED";
    return
end

y_out = zeros( m_y,n_y );
if ( n_x == 1 )     % x is a column vector
    if ( n_y == 1 )     % y is a column vector
        % Scale the elements of x by alpha and add with the elements of y
        for i=1:m_x   
            y_out( i,1 ) = alpha * x( i,1 ) + y( i,1 );
        end
    else     % y is a row vector
        % Scale the elements of x by alpha and add with the elements of y
        for i=1:m_x   
            y_out( 1,i ) = alpha * x( i,1 ) + y( 1,i );
        end
    end
else    % x is a row vector
    if ( n_y == 1 )     % y is a column vector
        % Scale the elements of x by alpha and add with the elements of y
        for i=1:n_x   
            y_out( i,1 ) = alpha * x( 1,i ) + y( i,1 );
        end
    else     % y is a row vector
        % Scale the elements of x by alpha and add with the elements of y
        for i=1:n_x   
            y_out( 1,i ) = alpha * x( 1,i ) + y( 1,i );
        end
    end
end

return
end