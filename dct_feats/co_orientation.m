function var_o = co_orientation(I)
%% Frequency Variation in Three Orientations

dct_I = dct2(I);
%% n=1,Frequency Variation

F1 = [0 1 1 1 1;0 0 1 1 1; 0 0 0 0 1; 0 0 0 0 0;0 0 0 0 0];
temp=dct_I(F1~=0);
std_gauss=std(abs(temp(:)));
mean_abs=mean(abs(temp(:)));
o1 = std_gauss/(mean_abs+0.00000001);

%% n=2,Frequency Variation

F2 = [0 0 0 0 0; 0 1 0 0 0; 0 0 1 1 0; 0 0 1 1 1; 0 0 0 1 1];
temp=dct_I(F2~=0);
std_gauss=std(abs(temp(:)));
mean_abs=mean(abs(temp(:)));
o2 = std_gauss/(mean_abs+0.00000001);

%% n=3,Frequency Variation

F3 = [0 1 1 1 1;0 0 1 1 1; 0 0 0 0 1; 0 0 0 0 0;0 0 0 0 0]';
temp=dct_I(F3~=0);
std_gauss=std(abs(temp(:)));
mean_abs=mean(abs(temp(:)));
o3 = std_gauss/(mean_abs+0.00000001);

var_o = var([o1,o2,o3]);

