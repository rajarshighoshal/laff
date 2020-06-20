function[ x_out ] = laff_scal( alpha, x )
% x_out = laff_scal( alpha, x ) scales the vector x by the factor 
%   of alpha.
%   Vector x a column or row vector. In other words, 
%   x can be n x 1 or 1 x n array. However, one size must 
%   equal 1 and the other size equal n.  

% Extract row and column size of x
[ m_x, n_x ] = size( x );

% Check if alpha is scaler
if ~isscalar( alpha )
    x_out = "FAILED";
    return
end
% Check if x is a row or column vector
if ~isvector( x )
    x_out = "FAILED";
    return
end

x_out = zeros( m_x,n_x ); % create empty vector of size of x
if ( n_x == 1 )     % x is a column vector
    for i=1:m_x
        x_out( i,1 ) = alpha * x( i,1 );
    end
else % x is a row vector
    for i=1:n_x
        x_out( 1,i ) = alpha * x( 1,i );
    end
end

return 
end