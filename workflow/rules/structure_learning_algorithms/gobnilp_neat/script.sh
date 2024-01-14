#!/bin/bash

# creating temporary settings file for gobnilp neat
SETTINGS_FILE=${snakemake_output[adjmat]}.gobnilp.set
touch $SETTINGS_FILE 
echo -e gobnilp/outputfile/adjacencymatrix = \"${snakemake_output[adjmat]}\" >> $SETTINGS_FILE
echo -e gobnilp/outputfile/scoreandtime = \"${snakemake_output[adjmat]}.scoretime\" >> $SETTINGS_FILE
echo -e misc/catchctrlc = FALSE >> $SETTINGS_FILE
echo -e gobnilp/writebestsols = TRUE >> $SETTINGS_FILE
if [ ${snakemake_wildcards[score_type]} != "None" ]; then
    echo -e gobnilp/score_type = \"${snakemake_wildcards[score_type]}\" >> $SETTINGS_FILE;
fi
if [ ${snakemake_wildcards[alpha_mu]} != "None" ]; then
    echo -e gobnilp/alpha_mu = ${snakemake_wildcards[alpha_mu]} >> $SETTINGS_FILE;
fi
if [ ${snakemake_wildcards[alpha_omega_minus_nvars]} != "None" ]; then
    echo -e gobnilp/alpha_omega_minus_nvars = ${snakemake_wildcards[alpha_omega_minus_nvars]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[initpalim]} != "None" ]; then
    echo -e gobnilp/initpalim = ${snakemake_wildcards[initpalim]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[maxinitfvars]} != "None" ]; then
    echo -e gobnilp/maxinitfvars = ${snakemake_wildcards[maxinitfvars]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[disallowedpalim]} != "None" ]; then
    echo -e gobnilp/disallowedpalim = ${snakemake_wildcards[disallowedpalim]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[time_limit]} != "None" ]; then
    echo -e limits/time = ${snakemake_wildcards[time_limit]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[gap_limit]} != "None" ]; then
    echo -e limits/gap = ${snakemake_wildcards[gap_limit]} >> $SETTINGS_FILE ;
fi

cat resources/extra_args/${snakemake_wildcards[extra_args]} >> $SETTINGS_FILE

# gobnilp neat needs .bnsl extension for reader
INPUT_FILE=${snakemake_output[adjmat]}.bnsl
cp ${snakemake_input[data]} $INPUT_FILE

# different execution depending on timeout
if [ ${snakemake_wildcards[timeout]} != "None" ]; then                    
    STR="/home/uw20605/repos/gobnilp/bin/gobnilp -s "${snakemake_output[adjmat]}".gobnilp.set -f "${snakemake_output[adjmat]}.bnsl;
    (timeout --signal=SIGKILL ${snakemake_wildcards[timeout]} bash -c "$STR" || exit 0)
else
    /home/uw20605/repos/gobnilp/bin/gobnilp -s $SETTINGS_FILE -f $INPUT_FILE;
fi

# saving the results
if [ -f ${snakemake_output[adjmat]} ]; then
    sed --in-place s/\ /,/g ${snakemake_output[adjmat]}
    head -n 1 ${snakemake_input[data]} > ${snakemake_output[adjmat]}.header
    cat ${snakemake_output[adjmat]} >> ${snakemake_output[adjmat]}.header
    awk '{{print $2}}' ${snakemake_output[adjmat]}.scoretime > ${snakemake_output[time]}
    mv ${snakemake_output[adjmat]}.header ${snakemake_output[adjmat]}
    rm -f ${snakemake_output[adjmat]}.scoretime;
else # if the time limit was reached, create emtpy file
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]};
fi
rm -f $SETTINGS_FILE
rm -f $INPUT_FILE
