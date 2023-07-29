# Build command string 
CMD="java -jar /tetrad/causal-cmd-1.1.3-jar-with-dependencies.jar"
CMD="$CMD --data-type ${snakemake_wildcards[datatype]}"
CMD="$CMD --delimiter comma"
CMD="$CMD --prefix ${snakemake_output[adjmat]}"
CMD="$CMD --json-graph"

# Use data without range header for discrete data 
if [ ${snakemake_wildcards[datatype]} = "discrete" ]; then
    sed '2d' ${snakemake_input[data]} > ${snakemake_output[adjmat]}.no_range_header
    CMD="$CMD --dataset ${snakemake_output[adjmat]}.no_range_header"
else
    CMD="$CMD --dataset ${snakemake_input[data]}"
fi

CMD="$CMD --algorithm gfci"
CMD="$CMD --score ${snakemake_wildcards[score]}"
CMD="$CMD --structurePrior ${snakemake_wildcards[structurePrior]}"

if [ ${snakemake_wildcards[score]} = "sem-bic" ]; then
    CMD="$CMD --penaltyDiscount ${snakemake_wildcards[penaltyDiscount]}"
fi

if [ ${snakemake_wildcards[score]} = "bdeu-score" ]; then
    CMD="$CMD --samplePrior ${snakemake_wildcards[samplePrior]}"
fi

CMD="$CMD --test ${snakemake_wildcards[test]}"

if [ ${snakemake_wildcards[test]} = "fisher-z-test" ]; then
    CMD="$CMD --alpha ${snakemake_wildcards[alpha]}"
fi

# Shold support all tests
if [ ${snakemake_wildcards[test]} = "chi-square-test" ]; then
    CMD="$CMD --alpha ${snakemake_wildcards[alpha]}"
fi

# Run the command
if [ ${snakemake_wildcards[timeout]} != "None" ]; then 
     # run with timeout
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} timeout --signal SIGKILL ${snakemake_wildcards[timeout]} bash -c '$CMD'
else 
    # no timeout set
    /usr/bin/time -f "%e" -o ${snakemake_output[time]} $CMD
fi

# Process the output
if [ -f ${snakemake_output[adjmat]}_graph.json ]; then 
    Rscript workflow/scripts/utils/tetrad_graph_to_adjmat.R --jsongraph ${snakemake_output[adjmat]}_graph.json --filename ${snakemake_output[adjmat]}  
    rm -f ${snakemake_output[adjmat]}.no_range_header 
    rm ${snakemake_output[adjmat]}_graph.json 
    rm ${snakemake_output[adjmat]}.txt; 
else 
    # if timeout was reached, create empty files
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]}
fi
