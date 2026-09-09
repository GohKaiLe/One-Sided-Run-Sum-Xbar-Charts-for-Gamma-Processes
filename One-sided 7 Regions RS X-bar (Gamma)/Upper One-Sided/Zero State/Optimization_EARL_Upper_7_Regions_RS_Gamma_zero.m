% Optimal Parameters for Upper Sided 7 Regions RS X-bar Chart for Gamma %
% Zero State %
% Subject tp ARL0 = tau %
% Same as EATS-optimal design %

tic ; 

clearvars ; 
clc ; 

% Gamma Distribution Parameters %
a_shape = 4 ; % shape parameter
b_scale = 1 ; % scale parameter

n = 5 ; % sample size 
dmin = 0.10 ; % minimum shift size 
dmax = 0.75 ; % maximum shift szie

EARLi = 370.4 ; % EARL0 (Change as required)

Opt_S1 = 0 ; Opt_S2 = 0 ; Opt_S3 = 0 ; Opt_S4 = 0 ;  
Opt_S5 = 0 ; Opt_S6 = 0 ; Opt_S7 = 0 ; Opt_K = 0 ;

EARL1min = 10000 ; 

out = [] ;

for S1 = 0:1 
    for S2 = S1:3
        for S3 = S2:4 
            for S4 = S3:5 
                for S5 = S4:6
                    for S6 = S5:8
                        for S7 = S6:10
                            for c = 0.3:0.1:2 % Specify the interval for K
                                xx = ARLFindUpper(n, c, 0, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ; 
                                if xx < EARLi
                                    a = c ;
                                else
                                    b = c ; 
                                    break ; 
                                end
                            end
                            for i = 1:100 % Start Bisection method to find K
                                p = (a + b) / 2 ; 
                                f = ARLFindUpper(n, p, 0, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ; 
                                if abs(a - b) < 0.0000001 
                                    K = p ; 
                                    EARL0 = f ; 
                                    Optimization = [dmin, dmax, Opt_S1, Opt_S2, Opt_S3, Opt_S4, Opt_S5, Opt_S6, Opt_S7, Opt_K, EARL1min] 
                                    break ; 
                                end
                                if f < EARLi
                                    a = p ; 
                                else
                                    b = p ;
                                end
                            end % End of Bisection method
                            if abs(EARL0 - EARLi) < 1 
                                EARL1 = EARLFindUpper(n, K, dmin, dmax, S1, S2, S3, S4, S5, S6, S7, a_shape, b_scale) ;  
                                out = [out; S1, S2, S3, S4, S5, S6, S7, K, EARL0, EARL1] ; 
                                if EARL1 < EARL1min
                                    EARL1min = EARL1 ; 
                                    EARL0min = EARL0 ; 
                                    Opt_K = K ;
                                    Opt_S1 = S1 ; 
                                    Opt_S2 = S2 ; 
                                    Opt_S3 = S3 ; 
                                    Opt_S4 = S4 ; 
                                    Opt_S5 = S5 ; 
                                    Opt_S6 = S6 ; 
                                    Opt_S7 = S7 ; 
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

disp('The optimal is:')
disp([dmin, dmax, Opt_K, Opt_S1, Opt_S2, Opt_S3, Opt_S4, Opt_S5, Opt_S6, Opt_S7, EARL0min, EARL1min])

toc ; 



