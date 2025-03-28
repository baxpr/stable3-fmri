#!/usr/bin/env bash

docker run \
    --mount type=bind,src=`pwd -P`/INPUTS,dst=/INPUTS \
    --mount type=bind,src=`pwd -P`/OUTPUTS,dst=/OUTPUTS \
    baxterprogers/stable3-fmri:test \
    --fmri1_niigz /INPUTS/fmri1.nii.gz \
    --fmri2_niigz /INPUTS/fmri2.nii.gz \
    --fmritopup_niigz /INPUTS/fmritopup.nii.gz \
    --seg_niigz /INPUTS/seg.nii.gz \
    --icv_niigz /INPUTS/icv_native.nii.gz \
    --deffwd_niigz /INPUTS/y_deffwd.nii.gz \
    --biascorr_niigz /INPUTS/biascorr.nii.gz \
    --biasnorm_niigz /INPUTS/biasnorm.nii.gz \
    --trialreport_csv /INPUTS/trial_report.csv \
    --hpf_sec 300 \
    --fwhm_mm 6 \
    --pedir "+j" \
    --out_dir /OUTPUTS

