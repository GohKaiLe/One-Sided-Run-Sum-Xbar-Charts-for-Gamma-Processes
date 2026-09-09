% Optimal Parameters for Lower Sided 4 Regions RS X-bar Chart for Gamma %
% Zero State %
% Subject to ARL0 = tau (same as ATS0) %

tic ; 

clearvars ; 
clc ; 

% Gamma Distribution Parameters %
a_shape = 4 ; % shape parameter
b_scale = 1 ; % scale parameter

n = 5 ; % sample size 
delta = -0.10 ; % shift size 

ARLi = 370.4 ; 

Opt_S1 = 0 ; Opt_S2 = 0 ; Opt_S3 = 0 ; Opt_S4 = 0 ; Opt_K = 0 ; 

ARL1min = 10000 ; 

out = [] ; 

for S1 = 0:1
    for S2 = S1:3
        for S3 = S2:5 
            for S4 = S3:10
                for c = 0.3:0.1:2 % Specify the interval for K
                    xx = ARLFindLower(n, c, 0, S1, S2, S3, S4, a_shape, b_scale) ; 
                    if xx < ARLi
                        a = c ; 
                    else
                        b = c ; 
                        break ;
                    end
                end
                for i = 1:100 % Start Bisection method for finding K
                    p = (a + b) / 2 ;
                    f = ARLFindLower(n, p, 0, S1, S2, S3, S4, a_shape, b_scale) ; 
                    if abs(a - b) < 0.0000001 
                        K = p ; 
                        ARL0 = f ; 
                        Optimization = [delta, Opt_S1, Opt_S2, Opt_S3, Opt_S4, Opt_K, ARL1min]  
                        break ; 
                    end
                    if f < ARLi 
                        a = p ; 
                    else 
                        b = p ;
                    end
                end % end of Bisection method
                if abs(ARL0 - ARLi) < 1 
                    ARL1 = ARLFindLower(n, K, delta, S1, S2, S3, S4, a_shape, b_scale) ; 
                    SDRL1 = SDRLFindLower(n, K, delta, S1, S2, S3, S4, a_shape, b_scale) ; 
                    out = [out; S1, S2, S3, S4, K, ARL0, ARL1, SDRL1] ;
                    if ARL1 < ARL1min
                        SDRL1min = SDRL1 ; 
                        ARL1min = ARL1 ;
                        ARL0min = ARL0 ; 
                        Opt_K = K ; 
                        Opt_S1 = S1 ; 
                        Opt_S2 = S2 ; 
                        Opt_S3 = S3 ; 
                        Opt_S4 = S4 ; 
                    end
                end
            end
        end
    end
end

disp('The optimal is:')
disp([delta, Opt_K, Opt_S1, Opt_S2, Opt_S3, Opt_S4, ARL0min, ARL1min, SDRL1min])
toc ; 