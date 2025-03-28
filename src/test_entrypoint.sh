#!/usr/bin/env bash

export fmri1_niigz=$(pwd)/../INPUTS/fmri1.nii.gz
export fmri2_niigz=$(pwd)/../INPUTS/fmri2.nii.gz
export fmritopup_niigz=$(pwd)/../INPUTS/fmritopup.nii.gz
export seg_niigz=$(pwd)/../INPUTS/seg.nii.gz
export icv_niigz=$(pwd)/../INPUTS/icv.nii.gz
export deffwd_niigz=$(pwd)/../INPUTS/y_deffwd.nii.gz
export biascorr_niigz=$(pwd)/../INPUTS/biascorr.nii.gz
export biasnorm_niigz=$(pwd)/../INPUTS/biasnorm.nii.gz
export trialreport_csv=$(pwd)/../INPUTS/trial_report.csv
export out_dir=$(pwd)/../OUTPUTS

export pedir=+j
export vox_mm=2
export hpf_sec=300
export fwhm_mm=6
export refimg_nii=avg152T1.nii

# Initialize FSL, Freesurfer
FSLDIR=/usr/local/fsl
PATH=${FSLDIR}/share/fsl/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh
export FREESURFER_HOME=/usr/local/freesurfer
export SUBJECTS_DIR=$FREESURFER_HOME/subjects
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# Copy inputs to the working directory
copy_inputs.sh

# FSL based motion correction, topup, registration
fsl_processing.sh

# Unzip .nii for matlab/spm
gunzip "${out_dir}"/ctrrfmri?.nii.gz \
    "${out_dir}"/ctrrfmri_mean_all.nii.gz \
    "${out_dir}"/biasnorm.nii.gz \
    "${out_dir}"/y_deffwd.nii.gz
