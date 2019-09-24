function [sharp_param l_std r_std] = estimateaggdparam(data)
%% Generalized Gaussian Distribution

gam = 0.2:0.001:10;
r_gam = ((gamma(2./gam)).^2)./(gamma(1./gam).*gamma(3./gam));
l_std = sqrt(mean((data(data<0)).^2));
r_std = sqrt(mean((data(data>0)).^2));
gammahat = l_std/r_std;
rhat = (mean(abs(data)))^2/mean((data).^2);
rhatnorm = (rhat*(gammahat^3 +1)*(gammahat+1))/((gammahat^2 +1)^2);
[min_difference, array_position] = min((r_gam - rhatnorm).^2);
sharp_param = gam(array_position);


