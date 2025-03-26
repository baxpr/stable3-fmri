#!/usr/bin/env bash
#
# Primary entrypoint

echo Running $(basename "${BASH_SOURCE}")

# Initialize defaults
export pedir="+j"
export vox_mm=2
export hpf_sec=300
export fwhm_mm=6
export refimg_nii=avg152T1.nii
export out_dir=/OUTPUTS

# Parse input options
while [[ $# -gt 0 ]]; do
    key="${1}"
    case $key in   
        --fmri1_niigz) export fmri1_niigz="${2}"; shift; shift ;;
        --fmri2_niigz) export fmri2_niigz="${2}"; shift; shift ;;
        --fmritopup_niigz) export fmritopup_niigz="${2}"; shift; shift ;;
        --seg_niigz) export seg_niigz="${2}"; shift; shift ;;
        --icv_niigz) export icv_niigz="${2}"; shift; shift ;;
        --refimg_nii) export refimg_nii="${2}"; shift; shift ;;
        --deffwd_niigz) export deffwd_niigz="${2}"; shift; shift ;;
        --biascorr_niigz) export biascorr_niigz="${2}"; shift; shift ;;
        --biasnorm_niigz) export biasnorm_niigz="${2}"; shift; shift ;;
        --trialreport_csv) export trialreport_csv="${2}"; shift; shift ;;
        --pedir) export pedir="${2}"; shift; shift ;;
        --vox_mm) export vox_mm="${2}"; shift; shift ;;
        --hpf_sec) export hpf_sec="${2}"; shift; shift ;;
        --fwhm_mm) export fwhm_mm="${2}"; shift; shift ;;
        --out_dir) export out_dir="${2}"; shift; shift ;;
        *) echo "Input ${1} not recognized" ; shift ;;
    esac
done

# Flag to run or skip topup
if [ -z "${fmritopup_niigz}" ]; then
    export run_topup="no"
else
    export run_topup="yes"
fi

# Run the pipeline in xvfb
xvfb-run -n $(($$ + 99)) -s '-screen 0 1600x1200x24 -ac +extension GLX' \
    bash pipeline_main.sh
