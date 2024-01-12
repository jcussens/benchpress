"""
    The shell commands should be put in a separate bash script.
"""

rule gobnilp_neat:
    input:
        data=alg_input_data(),
    output:
        adjmat=alg_output_adjmat_path("gobnilp_neat"),
        time=alg_output_time_path("gobnilp_neat"),
        ntests=touch(alg_output_ntests_path("gobnilp_neat"))
    container:
        None
    shell:
        """touch {output.adjmat}.gobnilp_neat.set
            echo -e gobnilp/outputfile/adjacencymatrix = \134\\042{output.adjmat}\134\\042 > {output.adjmat}.gobnilp_neat.set
            echo -e gobnilp/outputfile/scoreandtime = \134\\042{output.adjmat}.scoretime\134\\042 >> {output.adjmat}.gobnilp_neat.set
            echo -e misc/catchctrlc = FALSE >> {output.adjmat}.gobnilp_neat.set
            echo -e gobnilp/writebestsols = TRUE >> {output.adjmat}.gobnilp_neat.set
            echo -e gobnilp/initpalim = {wildcards.initpalim} >> {output.adjmat}.gobnilp_neat.set
            echo -e gobnilp/disallowedpalim = {wildcards.disallowedpalim} >> {output.adjmat}.gobnilp_neat.set
            if [ {wildcards.time_limit} != \"None\" ]; then
                echo -e limits/time = {wildcards.time_limit} >> {output.adjmat}.gobnilp_neat.set ;
            fi
            if [ {wildcards.gap_limit} != \"None\" ]; then
                echo -e limits/gap = {wildcards.gap_limit} >> {output.adjmat}.gobnilp_neat.set ;
            fi
            ln -sf {input.data} input.bnsl
            if [ {wildcards.timeout} != \"None\" ]; then                    
                (timeout --signal=SIGKILL {wildcards.timeout} bash -c '/home/uw20605/repos/gobnilp/bin/gobnilp -s {output.adjmat}.gobnilp_neat.set -f input.bnsl' || exit 0)
            else
                /home/uw20605/repos/gobnilp/bin/gobnilp  -s {output.adjmat}.gobnilp_neat.set -f input.bnsl;
            fi
            if [ -f {output.adjmat} ]; then
                sed --in-place s/\ /,/g {output.adjmat}
                head -n 1 {input.data} > {output.adjmat}.header
                cat {output.adjmat} >> {output.adjmat}.header
                if [ {wildcards.timeout} != \"None\" ]; then                    
                   echo -e {wildcards.timeout} > {output.time};
                else
                   awk '{{print $2}}' {output.adjmat}.scoretime > {output.time};
                fi
                mv {output.adjmat}.header {output.adjmat}
                rm -f {output.adjmat}.scoretime;
            else
                touch {output.adjmat}
                echo None > {output.time};
            fi
            rm -f input.bnsl
            rm -f {output.adjmat}.gobnilp_neat.set """
