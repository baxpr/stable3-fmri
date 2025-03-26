#!/usr/bin/env bash

echo Running $(basename "${BASH_SOURCE}")

# Files
cp "${fmri1_niigz}" "${out_dir}"/fmri1.nii.gz
cp "${fmri2_niigz}" "${out_dir}"/fmri2.nii.gz

if [ "$run_topup" == "yes" ]; then
    cp "${fmritopup_niigz}" "${out_dir}"/fmritopup.nii.gz
fi

cp "${seg_niigz}" "${out_dir}"/seg.nii.gz
cp "${icv_niigz}" "${out_dir}"/icv.nii.gz
cp "${deffwd_niigz}" "${out_dir}"/y_deffwd.nii.gz
cp "${biascorr_niigz}" "${out_dir}"/biascorr.nii.gz
cp "${biasnorm_niigz}" "${out_dir}"/biasnorm.nii.gz
cp "${trialreport_csv}" "${out_dir}"/trialreport.csv
