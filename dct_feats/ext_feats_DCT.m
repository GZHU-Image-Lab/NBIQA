function features = ext_feats_DCT(I)
%% Extract Features in DCT Domain

    h = fspecial('gaussian',3);   
    Img = double(I(:,:,1));    
    
    disp('Time of extracting features in the transform domain')
    tic
%% 1st scale 
    %% Benford's Law

    ben = co_benford(Img); 
    
    %% Energy Subband Ratio

    all_en_rto = blkproc(Img,[3,3],[1,1],@co_energy_subband_ratio);    
    en_rto_temp = sort(all_en_rto(:),'descend');    
    en_rto_mean100 = mean(en_rto_temp);    
    en_rto_mean10 = mean(en_rto_temp(1:ceil(length(en_rto_temp)/10)));
    
    %% Frequency Variation in Three Orientations
    
    var_orientation = blkproc(Img,[3 3],[1,1],@co_orientation); 
    all_ori_temp = sort(var_orientation(:),'descend');
    all_ori_mean100 = mean(all_ori_temp);    
    all_ori_mean10 = mean(all_ori_temp(1:ceil(length(all_ori_temp)/10)));
    
    features1 = [ben,en_rto_mean100,en_rto_mean10,all_ori_mean100,all_ori_mean10];

%% 2nd scale 

    Img1_filtered=double(imfilter(Img,h));
    Img2 = Img1_filtered(2:2:end,2:2:end);
    
    %% Benford's Law
    
    ben = co_benford(Img2); 
    
    %% Energy Subband Ratio
    
    all_en_rto = blkproc(Img2,[3,3],[1,1],@co_energy_subband_ratio);    
    en_rto_temp = sort(all_en_rto(:),'descend');   
    en_rto_mean100 = mean(en_rto_temp);    
    en_rto_mean10 = mean(en_rto_temp(1:ceil(length(en_rto_temp)/10))); 
    
    %% Frequency Variation in Three Orientations
    
    var_orientation = blkproc(Img2,[3 3],[1,1],@co_orientation); 
    all_ori_temp = sort(var_orientation(:),'descend');
    all_ori_mean100 = mean(all_ori_temp);    
    all_ori_mean10 = mean(all_ori_temp(1:ceil(length(all_ori_temp)/10)));
    
    features2 = [ben,en_rto_mean100,en_rto_mean10,all_ori_mean100,all_ori_mean10];
    
    clear en_rto_temp  all_ori_temp

%% 3th scale
    
    Img2_filtered=double(imfilter(Img2,h));
    Img3 = Img2_filtered(2:2:end,2:2:end); 
    
    %% Energy Subband Ratio

    all_en_rto = blkproc(Img3,[3,3],[1,1],@co_energy_subband_ratio);    
    en_rto_temp = sort(all_en_rto(:),'descend');   
    en_rto_mean100 = mean(en_rto_temp);    
    en_rto_mean10 = mean(en_rto_temp(1:ceil(length(en_rto_temp)/10)));  
    
    %% Frequency Variation in Three Orientations
    
        var_orientation = blkproc(Img3,[3 3],[1,1],@co_orientation); 
    all_ori_temp = sort(var_orientation(:),'descend');
    all_ori_mean100 = mean(all_ori_temp);    
    all_ori_mean10 = mean(all_ori_temp(1:ceil(length(all_ori_temp)/10)));
 
    features3 = [en_rto_mean100,en_rto_mean10,all_ori_mean100,all_ori_mean10];
    
    clear en_rto_temp  all_ori_temp
    toc;
features =  [features1,features2,features3];
