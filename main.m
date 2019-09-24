clc;
clear;

addpath('spa_feats\');
addpath('dct_feats\');
addpath('pred_model');
%% Extract The Features of Image

img = imread('test_aut(MOS=46.47).bmp');
%img = imread('test_syn(DMOS=61.18).bmp');


feats = [ext_feats_DCT(img) ext_feats_Spa(img)];

%% Predict The Score
%  If The input image is a synthetically distorted image, 
%  input 1 as the second parameter
%  For example: score = pred_score(feats,1);

%  Else, The input image is a theauthentically distorted image,
%  ipnut 2 as the second parameter
%  For example: score = pred_score(feats,2);

score = pred_score(feats,2); 
% score = pred_score(feats,1);  
