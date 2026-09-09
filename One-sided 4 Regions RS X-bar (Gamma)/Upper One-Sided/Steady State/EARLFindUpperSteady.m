% Create a function to find EARL %
% Upward 4 Regions RS Xbar Chart for Gamma %
% Steady State Case %

function [EARL] = EARLFindUpperSteady(n, Ku, dmin, dmax, S1, S2, S3, S4, a_shape, b_scale)

h = 9 ; 

[x, w] = lgwt_table(h) ; 

EARLsum = 0 ; 

for i = 1:h
    xi = x(i) ;
    wi = w(i) ;
    d=((dmax - dmin)/2)*xi+((dmax + dmin)/2);
    ARL = ARLFindUpperSteady(n, Ku, d, S1, S2, S3, S4, a_shape, b_scale) ; 
    EARLi = (1/(dmax - dmin)) * ARL * wi ; 
    EARLsum  = EARLsum  + EARLi ; 
end

EARL = ((dmax - dmin)/2) * EARLsum ; 

end