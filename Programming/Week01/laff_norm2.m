function [ alpha ] = laff_norm2( x )
% alpha = laff_norm2(x) accepts a vector x and returns 
% the length of the vector as alpha

% check if x is a vector
if ~isvector( x )
    alpha = "FAILED";
    return
end

% Extract the row and column size of x 
[ m_x, n_x ] = size( x );
% initialize alpha with 0
alpha = 0;
if ( n_x == 1 )     % x is a column vector
    for i=1:m_x
        alpha = alpha + x( i,1 ) * x( i,1 );
    end
else          % x is a row vector
    for i=1:n_x
        alpha = alpha + x( 1,i ) * x( 1,i );
    end
end

% Take a square root of alpha
alpha = sqrt( alpha );
return
end

