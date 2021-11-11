%% add PALM direcitory that can be downloaded from:
%https://s3-us-west-2.amazonaws.com/andersonwinkler/palm/palm-alpha119.tar.gz

%for more information access: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/PALM/UserGuide
%add PALM directory
 addpath(genpath('User/artur/Downloads/palm-alpha118'))
% change current directory for the folder containg files after freesurfer preproc. You should also add design files created in FSL GLM setup

cd ('Users/artur/Desktop/T1_results')


%% merging hemispheres, files are going to have bh. sufix
palm_hemimerge lh.* rh.*
%% for freesurfer results
palm -i bh.area.Dystoniaresults.15.mgz -i bh.thickness.Dystoniaresults.15.mgz -i bh.volume.Dystoniaresults.15.mgz -d design_dti_t1.mat ...
-t design_dti_t1.con -n 10000 -fdr -logp -corrmod -o results


palm_hemisplit bh.results*

%% palm -i all_AD_skeletonised.nii -i all_FA_skeletonised.nii -i all_MD_skeletonised.nii -i all_RD_skeletonised.nii -d design_dti_t1.mat ...
-t design_dti_t1.con -n 10000 -fdr -logp -corrmod -o results