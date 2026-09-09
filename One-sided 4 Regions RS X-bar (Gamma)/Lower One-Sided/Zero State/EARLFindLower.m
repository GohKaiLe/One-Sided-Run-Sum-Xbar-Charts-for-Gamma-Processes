% Create a function to find EARL %
% Downward 4 Regions RS X-bar Chart for Gamma %
% Zero State Case %

function [EARL] = EARLFindLower(n, Kl, dmin, dmax, S1, S2, S3, S4, a_shape, b_scale)

h = 9 ; 

[x, w] = lgwt_table(h) ; 

EARLsum = 0 ; 

for i = 1:h
    xi = x(i) ;
    wi = w(i) ;
    d=((dmax - dmin)/2)*xi+((dmax + dmin)/2);
    ARL = ARLFindLower(n, Kl, d, S1, S2, S3, S4, a_shape, b_scale) ; 
    EARLi = (1/(dmax - dmin)) * ARL * wi ; 
    EARLsum  = EARLsum  + EARLi ; 
end

EARL = ((dmax - dmin)/2) * EARLsum ; 

end