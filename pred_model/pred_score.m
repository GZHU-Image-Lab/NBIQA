function score = pred_score(feat,dist_kind)
%% predict the quality score of image 

features = [feat];

fid = fopen('predict_features','w'); 
fprintf(fid,'1 ');

 for k = 1:51
        fprintf(fid,'%d:%f ',k,features(1,k)); 
 end

warning off;
delete 'predict_features_scale' 'output' 'dump'

if dist_kind == 1  % Synthetically Distorted Image
    system('svm-scale -r allrange_syn predict_features > predict_features_scale');
    system('svm-predict predict_features_scale allmodel_syn output > dump');
    load('output');
end

if dist_kind == 2  % Theauthentically Distorted Image
    system('svm-scale -r allrange_aut predict_features > predict_features_scale');
    system('svm-predict predict_features_scale allmodel_aut output > dump');
    load('output');
end

fclose(fid);
score = output;
