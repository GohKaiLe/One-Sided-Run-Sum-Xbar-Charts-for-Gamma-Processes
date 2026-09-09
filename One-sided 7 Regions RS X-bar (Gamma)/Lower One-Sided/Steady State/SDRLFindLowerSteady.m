% Create a function to find SDRL (Gamma Case) %
% Lower One-sided 7-region RS X-bar Chart % 
% Steady State %

function [SDRL] = SDRLFindLowerSteady(n, Kl, delta, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale)

[Q,u] = QFindLower(n, Kl, delta, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ;

% Compute ARL for steady state

s = zeros(u, 1) ; 
s(1, 1) = 1 ;
I = eye(u) ;
one = ones(u, 1) ; 
s0 = ((inv(I - Q')) * s ) / (one' * (inv(I - Q')) * s) ;
ARL = s0' * (inv(I - Q)) * one ;

% Compute SDRL

V = 2 * s0' * (inv(I - Q))^2 * Q * one ;
SDRL = sqrt(V - ARL^2 + ARL);

end