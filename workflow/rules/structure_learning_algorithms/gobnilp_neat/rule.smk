rule:
    name: module_name
    input:
        data=alg_input_data(),
        extra_args="resources/extra_args/{extra_args}",
        constraints="resources/constraints/{constraints}",
    output:
        adjmat=alg_output_adjmat_path(module_name),
        time=alg_output_time_path(module_name),
        ntests=touch(alg_output_ntests_path(module_name))
    container:
        None
    script:
        "script.sh"
