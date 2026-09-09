clearvars ;
clc ; 

a_shape = 4 ; % shape parameter 
b_scale = 1 ; % scale parameter 

n = 5 ; % sample size
deltamin = 0.75 ; % shift size minimum
deltamax = 1.50 ; % shift size maximum

h = 15 ; 

Ku = 1.21937012672424 ; % Upper control limit coefficient 

S1 = 0 ; % Score for region 1
S2 = 1 ; % Score for region 2
S3 = 2 ; % Score for region 3
S4 = 4 ; % Score for region 4

[x, w] = quadlegendre(h, deltamin, deltamax) ; 

EARLsum = 0 ; 

for i = 1:h
    xi = x(i) ;
    wi = w(i) ;
    d=((deltamax - deltamin)/2)*xi+((deltamax + deltamin)/2);
    ARL = ARLFindUpper(n, Ku, d, S1, S2, S3, S4, a_shape, b_scale) ; 
    EARL = (1/(deltamax - deltamin)) * ARL * wi ; 
    EARLsum  = EARLsum  + EARL ; 
end

EARL1 = ((deltamax - deltamin) / 2 ) * EARLsum 





