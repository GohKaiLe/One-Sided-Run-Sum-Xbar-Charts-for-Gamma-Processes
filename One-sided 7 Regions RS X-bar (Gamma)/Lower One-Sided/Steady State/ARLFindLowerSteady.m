% Create a function to find ARL (Gamma Case) %
% Lower One-sided 7-region RS X-bar Chart % 
% Steady State %

function [ARL] = ARLFindLowerSteady(n, Kl, delta, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale)

[Q,u] = QFindLower(n, Kl, delta, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ;

s = zeros(u, 1) ; 
s(1, 1) = 1 ;
I = eye(u) ;
one = ones(u, 1) ; 
s0 = ((inv(I - Q')) * s ) / (one' * (inv(I - Q')) * s) ;
ARL = s0' * (inv(I - Q)) * one ;

end