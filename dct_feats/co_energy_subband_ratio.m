function output = co_energy_subband_ratio(I)
%% Energy Subband Ratio

I = dct2(I);
%% n=1£¬Are of Low Frequency

var_band1=var([I(1,2) I(2,1) I(1,3) I(3,1) I(2,2)]);

%% n=1£¬Are of Middle Frequency

var_band2=var([I(4,1) I(5,1) I(3,2) I(4,2) I(5,2) I(2,3) I(3,3) I(4,3) I(1,4) I(2,4) I(3,4) I(1,5) I(2,5)]);

%% n=1£¬Are of High Frequency

var_band3=var([I(3,5) I(4,4) I(5,3) I(4,5) I(5,4) I(5,5)]);

%% 
r1 = abs(var_band3 - mean([var_band1 var_band2]))/(var_band3 + mean([var_band1 var_band2])+0.00000001);
r2 = abs(var_band2 - var_band1)/(var_band3 + var_band1+0.00000001);

output = (r1+r2)/2;
