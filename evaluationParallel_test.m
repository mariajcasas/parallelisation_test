
function [outputparam1, outputparam2] = evaluationParallel_test(individual, inputparam2, inputparam3)

    # Checking what is received on each input parameter
    fprintf("evaluationParallel: individual %s\n", individual);
    # In the next two log instructions, instead of %s should be %f because inputparam2 and inputparam3 are float type. Here there is my first question:  why are they receiving the second and third individual of P instead of the second and third input parameters defined in main program parallelisation_test?
    fprintf("evaluationParallel: inputparam2 %s\n", inputparam2); 
    fprintf("evaluationParallel: inputparam3 %s\n", inputparam3);
    
    fprintf("evaluationParallel: Building the phenotype of the individual %s\n", individual);
    [height, width, branchesnumber] = LsystemGeneratorNP_test(individual)

    fprintf("evaluationParallel: Calculating the aspect ratio of the individual %s\n", individual);
    [outputparam1, outputparam2] = getAspectRatioNP_test(height, width, branchesnumber, inputparam2, inputparam3)


endfunction
