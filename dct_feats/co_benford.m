function output = co_benford(img)
%% benford's law 

benf_stb = [31,17.6,12.5,9.7,7.9,6.7,5.8,5.1,4.6]';

I = dct2(img);

leading_digits = [];

leading_digits = str2double(regexp(sprintf('%e ',I.'), '\d\.', 'match'));

sat_digits = tabulate(leading_digits);
if length(sat_digits) == 9
    dist = (sat_digits(:,3)-benf_stb).^2;
else
    dist = (sat_digits(2:10,3)-benf_stb).^2;
end

output = sqrt(sum(dist));

