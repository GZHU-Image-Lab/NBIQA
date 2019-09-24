function [sharp_param ggd_std] = param_ggd(data)
%% Asymmetric Generalized Gaussian Distribution

gam = 0.2:0.001:10;
r_gam = (gamma(1./gam).*gamma(3./gam))./((gamma(2./gam)).^2);
ggd_std = sqrt(mean((data).^2));
E = mean(abs(data));
rho = ggd_std^2/E^2;
[min_difference, array_position] = min(abs(rho - r_gam));
sharp_param = gam(array_position);  






