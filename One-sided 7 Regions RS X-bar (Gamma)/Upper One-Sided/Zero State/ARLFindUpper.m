% Create a function to find ARL (Gamma Case) %
% Upper One-sided 7-region RS X-bar Chart % 
% Zero State %

function [ARL] = ARLFindUpper(n, Ku, delta, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale)

[Q,u] = QFindUpper(n, Ku, delta, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ;
s = zeros(u, 1) ; 
s(1, 1) = 1 ;
I = eye(u) ;
one = ones(u, 1) ; 
ARL = s' * (inv(I - Q)) * one ;

end