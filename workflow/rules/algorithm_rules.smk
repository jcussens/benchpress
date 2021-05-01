rule glasso:
    input:
        data = alg_input_data(),
        glasso="workflow/scripts/glasso.py"
    output:
        adjmat = alg_output_adjmat_path("glasso"),
        time = alg_output_time_path("glasso")
    singularity:
        docker_image("pydatascience")
    script:
        "../scripts/glasso.py"

rule summarise_glasso:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("glasso"),
        time = summarise_alg_input_time_path("glasso")
    output:
        res = summarise_alg_output_res_path("glasso")
    shell:
        summarise_alg_shell("glasso")
       
rule join_summaries_glasso:
    input:
        conf=configfilename,
        res=join_string_sampled_model("glasso")
    output:
        join_summaries_output("glasso")
    script:
        "../scripts/join_csv_files.R"

rule tabu:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("tabu"),
        time = alg_output_time_path("tabu")
    shell:
        alg_shell("tabu")

rule summarise_tabu:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("tabu"),
        time = summarise_alg_input_time_path("tabu")
    output:
        res = summarise_alg_output_res_path("tabu")
    shell:
        summarise_alg_shell("tabu")
       
rule join_summaries_tabu:
    input:
        conf=configfilename,
        res=join_string_sampled_model("tabu")
    output:
        join_summaries_output("tabu")
    script:
        "../scripts/join_csv_files.R"

rule notears:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("notears"),
        time = alg_output_time_path("notears")
    singularity:
        docker_image("notears")
    shell:
        alg_shell("notears")

rule summarise_notears:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("notears"),
        time = summarise_alg_input_time_path("notears")
    output:
        res = summarise_alg_output_res_path("notears")
    shell:
        summarise_alg_shell("notears")
       
rule join_summaries_notears:
    input:
        conf=configfilename,
        res=join_string_sampled_model("notears")
    output:
        join_summaries_output("notears")
    script:
        "../scripts/join_csv_files.R"

rule hc:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("hc"),
        time = alg_output_time_path("hc")
    shell:
        alg_shell("hc")

rule summarise_hc:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("hc"),
        time = summarise_alg_input_time_path("hc")
    output:
        res = summarise_alg_output_res_path("hc")
    shell:
        summarise_alg_shell("hc")
       
rule join_summaries_hc:
    input:
        conf=configfilename,
        res=join_string_sampled_model("hc")
    output:
        join_summaries_output("hc")
    script:
        "../scripts/join_csv_files.R"

rule interiamb:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("interiamb"),
        time = alg_output_time_path("interiamb")
    script:
        "../scripts/run_inter-iamb.R"

rule summarise_interiamb:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("interiamb"),
        time = summarise_alg_input_time_path("interiamb")
    output:
        res = summarise_alg_output_res_path("interiamb")
    shell:
        summarise_alg_shell("interiamb")
       
rule join_summaries_interiamb:
    input:
        conf=configfilename,
        res=join_string_sampled_model("interiamb")
    output:
        join_summaries_output("interiamb")
    script:
        "../scripts/join_csv_files.R"

rule gs:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gs"),
        time = alg_output_time_path("gs")
    script:
        "../scripts/run_gs.R"

rule summarise_gs:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gs"),
        time = summarise_alg_input_time_path("gs")
    output:
        res = summarise_alg_output_res_path("gs")
    shell:
        summarise_alg_shell("gs")
       
rule join_summaries_gs:
    input:
        conf=configfilename,
        res=join_string_sampled_model("gs")
    output:
        join_summaries_output("gs")
    script:
        "../scripts/join_csv_files.R"

rule blip:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("blip"),
        time = alg_output_time_path("blip")
    shell:        
        alg_shell("blip")

rule summarise_blip:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("blip"),
        time = summarise_alg_input_time_path("blip")
    output:
        res = summarise_alg_output_res_path("blip")
    shell:
        summarise_alg_shell("blip")

rule join_summaries_blip:
    input:
        conf=configfilename,
        res=join_string_sampled_model("blip")
    output:
        join_summaries_output("blip")
    script:
        "../scripts/join_csv_files.R"

rule itsearch:
    input:
        "workflow/scripts/run_iterative_search.R",
        data = alg_input_data(),
    output:
        adjmat = alg_output_adjmat_path("itsearch"),
        time = alg_output_time_path("itsearch")
    singularity:
        docker_image("bidag")
    script:
        "../scripts/run_iterative_search.R"

rule summarise_itsearch:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("itsearch"),
        time = summarise_alg_input_time_path("itsearch")
    output:
        res = summarise_alg_output_res_path("itsearch")
    shell:
        summarise_alg_shell("itsearch")

rule join_summaries_itsearch:
    input:
        conf=configfilename,
        res=join_string_sampled_model("itsearch")
    output:
        join_summaries_output("itsearch")
    script:
        "../scripts/join_csv_files.R"

rule pcalg:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("pcalg"),
        time = alg_output_time_path("pcalg")
    singularity:
        docker_image("bidag")
    script:
        "../scripts/run_pcalg.R"

rule summarise_pcalg:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("pcalg"),
        time = summarise_alg_input_time_path("pcalg")
    output:
        res = summarise_alg_output_res_path("pcalg")
    shell:
        summarise_alg_shell("pcalg")

rule join_summaries_pcalg:
    input:
        conf=configfilename,
        res=join_string_sampled_model("pcalg")
    output:
        join_summaries_output("pcalg")
    script:
        "../scripts/join_csv_files.R"

rule mmhc:
    input:        
        "workflow/scripts/run_mmhc.R",
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("mmhc"),
        time = alg_output_time_path("mmhc")
    script:
        "../scripts/run_mmhc.R"

rule summarise_mmhc:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("mmhc"),
        time = summarise_alg_input_time_path("mmhc")
    output:
        res = summarise_alg_output_res_path("mmhc")
    shell:
       summarise_alg_shell("mmhc")

rule join_summaries_mmhc:
    input:
        conf=configfilename,
        res=join_string_sampled_model("mmhc")
    output:
        join_summaries_output("mmhc")  
    script:
        "../scripts/join_csv_files.R"

rule gobnilp:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gobnilp"),
        time = alg_output_time_path("gobnilp")
    singularity:
        docker_image("gobnilp")        
    shell: 
        alg_shell("gobnilp")

rule summarise_gobnilp:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gobnilp"),
        time = summarise_alg_input_time_path("gobnilp")
    output:
        res = summarise_alg_output_res_path("gobnilp")
    shell:
        summarise_alg_shell("gobnilp")

rule join_summaries_gobnilp:
    input:
        conf=configfilename,
        res=join_string_sampled_model("gobnilp")
    output:
        join_summaries_output("gobnilp")
    script:
        "../scripts/join_csv_files.R"

rule fges:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("fges"),
        time = alg_output_time_path("fges") 
    script:
        "../scripts/run_fges.py"

rule summarise_fges:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("fges"),
        time = summarise_alg_input_time_path("fges")
    output:
        res = summarise_alg_output_res_path("fges")
    shell:
        summarise_alg_shell("fges")

rule join_summaries_fges:
    input:
        conf=configfilename,
        res=join_string_sampled_model("fges")
    output:
        join_summaries_output("fges")
    script:
        "../scripts/join_csv_files.R"

rule fci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("fci"),
        time = alg_output_time_path("fci")
    script:
        "../scripts/run_fci.py"

rule summarise_fci:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("fci"),
        time = summarise_alg_input_time_path("fci")
    output:
        res = summarise_alg_output_res_path("fci")
    shell:
        summarise_alg_shell("fci")

rule join_summaries_fci:
    input: 
        conf=configfilename,
        res=join_string_sampled_model("fci")
    output:
        join_summaries_output("fci")
    script:
        "../scripts/join_csv_files.R"

rule gfci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("gfci"),
        time = alg_output_time_path("gfci")
    script:
        "../scripts/run_gfci.py"
        
rule summarise_gfci:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gfci"),
        time = summarise_alg_input_time_path("gfci")
    output:
        res = summarise_alg_output_res_path("gfci")
    shell:
        summarise_alg_shell("gfci")

rule join_summaries_gfci:
    input: 
        conf=configfilename,
        res=join_string_sampled_model("gfci")
    output:
        join_summaries_output("gfci")
    script:
        "../scripts/join_csv_files.R"

rule rfci:
    input:
        data = alg_input_data()
    output:
        adjmat = alg_output_adjmat_path("rfci"),
        time = alg_output_time_path("rfci")
    shell:
        alg_shell("rfci")

rule summarise_rfci:
    input:
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("rfci"),
        time = summarise_alg_input_time_path("rfci")
    output:
        res = summarise_alg_output_res_path("rfci")
    shell:
        summarise_alg_shell("rfci")

rule join_summaries_rfci:
    input: 
        conf=configfilename,
        res=join_string_sampled_model("rfci")
    output:
        join_summaries_output("rfci")
    script:
        "../scripts/join_csv_files.R"

rule order_mcmc:
    input:
        "workflow/scripts/run_order_mcmc.R",
        data = alg_input_data(),
        startspace = "{output_dir}/adjmat_estimate/{data}/algorithm=/{startspace_algorithm}/seed={replicate}/adjmat.csv"
    output:
        seqgraph = alg_output_seqgraph_path("order_mcmc"),
        time = alg_output_time_path("order_mcmc")
    singularity:
        docker_image("bidag")
    script:
        "../scripts/run_order_mcmc.R"

rule summarise_order_mcmc:
    input:
        "workflow/scripts/run_summarise.R",
        data = data_path(),
        adjmat_true = adjmat_true_path(),
        adjmat_est = adjmat_estimate_path_mcmc("order_mcmc"),
        time = time_path("order_mcmc")
    output:
        res = result_path_mcmc("order_mcmc")
    shell: 
        summarise_alg_shell("order_mcmc")

rule join_summaries_order_mcmc:
    input: 
        conf=configfilename,
        res=join_string_sampled_model("order_mcmc")
    output:
        join_summaries_output("order_mcmc")
    script:
        "../scripts/join_csv_files.R"

rule trilearn_loglin:
    input:
        data=alg_input_data()
    output:
        adjvecs = alg_output_seqgraph_path("trilearn_loglin"),
        time = alg_output_time_path("trilearn_loglin")
    singularity:
        docker_image("trilearn_loglin")
    shell:
        alg_shell("trilearn_loglin")

rule trilearn_loglin_est:
    input:
       "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("trilearn_loglin"),
    output:
        adjmat = alg_output_adjmat_path("trilearn_loglin")
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"
rule summarise_trilearn_loglin:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("trilearn_loglin"),
        time = summarise_alg_input_time_path("trilearn_loglin")
    output:
        res = summarise_alg_output_res_path("trilearn_loglin")
    shell:
        summarise_alg_shell("trilearn_loglin")
       
rule join_summaries_trilearn_loglin:
    input:
        conf=configfilename,
        res=join_string_sampled_model("trilearn_loglin")
    output:
        join_summaries_output("trilearn_loglin")
    script:
        "../scripts/join_csv_files.R"

rule gg_singlepair_fortran:
    input:
        data = alg_input_data()
    output:
        adjvecs = alg_output_seqgraph_path("gg_singlepair_fortran"),
        time = alg_output_time_path("gg_singlepair_fortran")
    singularity:
        docker_image("greenfortran")
    shell:
        alg_shell("gg_singlepair_fortran")

rule gg_singlepair_fortran_est:
    input:
        "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("gg_singlepair_fortran"),
    output:
        adjmat = alg_output_adjmat_path("gg_singlepair_fortran")
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule greenthomas:
    input:
        data = alg_input_data()
    output:
        seqgraph = alg_output_seqgraph_path("greenthomas"),
        time = alg_output_time_path("greenthomas")
    singularity:
        docker_image("thomasjava")
    shell:
        alg_shell("greenthomas")

rule greenthomas_est:
    input:
        "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("greenthomas"),
    output:
        adjmat = alg_output_adjmat_path("greenthomas")
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule summarise_greenthomas:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("greenthomas"),
        time = summarise_alg_input_time_path("greenthomas")
    output:
        res = summarise_alg_output_res_path("greenthomas")
    shell:
        summarise_alg_shell("greenthomas")
       
rule join_summaries_greenthomas:
    input:
        conf=configfilename,
        res=join_string_sampled_model("greenthomas")
    output:
        join_summaries_output("greenthomas")
    script:
        "../scripts/join_csv_files.R"

rule gg_singlepair:
    input:
        data = alg_input_data()
    output:
        seqgraph = alg_output_seqgraph_path("gg_singlepair"),
        time = alg_output_time_path("gg_singlepair")
    singularity:
        docker_image("thomasjava")
    shell:
        alg_shell("gg_singlepair")

rule gg_singlepair_est:
    input:
        "workflow/scripts/graphtraj_est.py",
        traj = alg_output_seqgraph_path("gg_singlepair"),
    output:
        adjmat = alg_output_adjmat_path("gg_singlepair")
    params:
        graph_type="chordal",
        estimator="map"
    singularity:
        docker_image("networkx")
    script:
        "../scripts/graphtraj_est.py"

rule summarise_gg_singlepair:
    input:
        "workflow/scripts/run_summarise.R",
        data = summarise_alg_input_data_path(),
        adjmat_true = summarise_alg_input_adjmat_true_path(),
        adjmat_est = summarise_alg_input_adjmat_est_path("gg_singlepair"),
        time = summarise_alg_input_time_path("gg_singlepair")
    output:
        res = summarise_alg_output_res_path("gg_singlepair")
    shell:
        summarise_alg_shell("gg_singlepair")
       
rule join_summaries_gg_singlepair:
    input:
        conf=configfilename,
        res=join_string_sampled_model("gg_singlepair")
    output:
        join_summaries_output("gg_singlepair")
    script:
        "../scripts/join_csv_files.R"
