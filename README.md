# Introduction

This repository contain the source code of the following technical report:

    @inproceedings{NBIQA2019,
      author    = {Fu-Zhao {Ou} and
                   Yuan-Gen {Wang} and
                   Guopu  {Zhu}},
      title     = {A Novel Blind Image Quality Assessment Method Based on Refined Natural Scene Statistics},
      booktitle = {2019 IEEE International Conference on Image Processing (ICIP)},
      pages     = {1004-1008},
      year      = {2019},
    }

Abstract: Natural scene statistics (NSS) model has received considerable attention in the image quality assessment (IQA) community
due to its high sensitivity to image distortion. However, most existing NSS-based IQA methods extract features either from spatial domain or from transform domain. There is little work to simultaneously consider the features from these two domains. In this paper, a novel blind IQA method (NBIQA) based on refined NSS is proposed. The proposed NBIQA first investigates the performance of a large number
of candidate features from both the spatial and transform domains. Based on the investigation, we construct a refined NSS model by selecting competitive features from existing NSS models and adding three new features. Then the refined NSS is fed into SVM tool to learn a simple regression model. Finally, the trained regression model is used to predict the scalar quality score of the image. Experimental results tested on both LIVE IQA and LIVE-C databases show that the proposed NBIQA performs better in terms of synthetic and authentic image distortion than current mainstream IQA methods.

# Usage

Running on Matlab 

Input : A test image loaded in an array, Image distortion type parameter
        Image distortion type parameter: If the input image is a synthetically distorted image, input 1 as the second parameter
        Else, The input image is a theauthentically distorted image, ipnut 2 as the second parameter

Output: A predition score. The score typically is a value on the range of [0, 100]. 
(if evaluate the synthetic image: 0 represents the best, if evaluate the authentic image: 0 represents the worst).
  
Running the main.m

1. Load the image, for example

    img = imread('test.bmp');

2. Call this function to calculate the quality score:

    If The input image is the synthetically distorted image, 
    input 1 as the second parameter, for example
    score = pred_score(feats,1);
    Else, The input image is the authentically distorted image,
    ipnut 2 as the second parameter, for example
    score = pred_score(feats,2);

# Dependencies

   Binaries: svm-predict.exe, svm-scale.exe (from LibSVM) - provided with release
   
   Image Files: test_aut(MOS=46.47).bmp, test_syn(DMOS=61.18).bmp ( Respectively from the LIVE IQA Database and the LIVE-C Database, neither of which is included in the training model)
   
   Data files: allmodel_aut, allmodel_syn, allrange_aut, allrange_syn (provided with release)

   MATLAB files: main.m, co_benford.m, co_energy_subband_ratio.m, co_frequency_varication.m, co_orientation1.m, co_orientation2.m, co_orientation3.m, ext_feats_DCT.m, param_asyggd.m, param_ggd.m, ext_feats_Spa.m, pred_score.m

# License

This source code is made available for research purpose only. 

