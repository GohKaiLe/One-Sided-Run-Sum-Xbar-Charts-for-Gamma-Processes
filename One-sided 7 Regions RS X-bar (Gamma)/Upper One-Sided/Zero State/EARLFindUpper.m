% Create a function to find EARL %
% Upper One-sided 7-region RS X-bar Chart % 
% Zero State %

function [EARL] = EARLFindUpper(n, Ku, dmin, dmax, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale)

h = 9 ; 

[x, w] = lgwt_table(h) ; 

EARLsum = 0 ; 

for i = 1:h
    xi = x(i) ;
    wi = w(i) ;
    d=((dmax - dmin)/2)*xi+((dmax + dmin)/2);
    ARL = ARLFindUpper(n, Ku, d, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ; 
    EARLi = (1/(dmax - dmin)) * ARL * wi ; 
    EARLsum  = EARLsum  + EARLi ; 
end

EARL = ((dmax - dmin)/2) * EARLsum ; 

end