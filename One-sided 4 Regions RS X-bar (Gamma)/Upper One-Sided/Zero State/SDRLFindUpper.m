% Create a function to find SDRL (Gamma Case) %
% Upper One-Sided 4-region RS X-bar Chart %

function [SDRL] = SDRLFindUpper(n, Ku, delta, S1, S2, S3, S4, a_shape, b_scale)

[Q,u] = QFindUpper(n, Ku, delta, S1, S2, S3, S4, a_shape, b_scale) ;

% Compute ARL

s = zeros(u, 1) ; 
s(1, 1) = 1 ;
I = eye(u) ;
one = ones(u, 1) ; 
ARL = s' * (inv(I - Q)) * one ;

% Compute SDRL

V = 2 * s' * (inv(I - Q))^2 * Q * one ;
SDRL = sqrt(V - ARL^2 + ARL);

end