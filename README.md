# Study-specific fMRI analysis for STABLE3 task

# Inputs


# Processing

- Co-registration and TOPUP distortion correction of the fMRI (FSL)
- Registration of the fMRI to T1 (FSL)
- Warp to MNI space and smooth (SPM)
- First-level statistical analysis (SPM)

The six motion parameters for each run (rotation and translation) are included as confound predictors.

No temporal derivatives of any predictors are included.

# Outputs


# References

Deserno L, Boehme R, Mathys C, Katthagen T, Kaminski J, Stephan KE, Heinz A, Schlagenhauf F. Volatility Estimates Increase Choice Switching and Relate to Prefrontal Activity in Schizophrenia. Biol Psychiatry Cogn Neurosci Neuroimaging. 2020 Feb;5(2):173-183. doi: 10.1016/j.bpsc.2019.10.007. PMID: 31937449.

