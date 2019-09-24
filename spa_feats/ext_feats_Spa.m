function spatial_features = ext_feats_Spa(img)
%% Extract Features in Spatial Domain
disp('Time of extracting features in the spatial domain');
tic

if(size(img,3)==3)                         
    img = uint8(img);
    e_temp = entropy(img);  %Compute image entropy in three-channel
    img = double(rgb2gray(img));
end

% window = fspecial('gaussian',3,7/6);      %7/6
window = fspecial('gaussian',3);
window = window/sum(sum(window));        

spatial_features = [];

for scale = 1:2
%% Generalized Gaussian Model Parameters

    mu = filter2(window, img, 'same');                              
    sigma = sqrt(abs(filter2(window, img.*img, 'same') - mu.*mu));   
    LNL = (img-mu)./(sigma+1);     
    [sharp_param ggd_std] = param_ggd(LNL(:));
    spatial_features = [spatial_features sharp_param ggd_std^2]; 
    
%% Coefficients of Asymmetrical GGD Model

    shifts = [ 0 1;1 0 ; 1 1; -1 1];
    for itr_shift =1:4
        shifted_structdis = circshift(LNL,shifts(itr_shift,:));
        pair_LNL = LNL(:).*shifted_structdis(:); 
        [sharp_param l_std r_std] = param_asyggd(pair_LNL); 
        const = (sqrt(gamma(1/sharp_param))/sqrt(gamma(3/sharp_param)));
        meanparam = (r_std-l_std) * (gamma(2/sharp_param) / gamma(1/sharp_param)) * const;
        spatial_features =[spatial_features sharp_param meanparam l_std^2 r_std^2];
    end
    
%% Gaussian Probability-density of Entropy
    if scale == 1
        e_p = (1/(sqrt(2*pi)*0.8732)) * exp(-(e_temp-7.4600)^2/2*0.8732^2);
        spatial_features = [spatial_features e_p];
    end
%% 2nd scale
    img = imresize(img,0.5);
end
toc;




