function fv = co_frequency_varication (I)
%% Block_Computation Energy Subband Ratio

dct_I = dct2(I);
non_dc_dct_I = dct_I(2:end);  
std_ggd = std(abs(non_dc_dct_I));  
mean_ggd = mean(abs(non_dc_dct_I)); 
frequency_varication_coefficient = std_ggd/(mean_ggd+0.0000001);  
fv = frequency_varication_coefficient;