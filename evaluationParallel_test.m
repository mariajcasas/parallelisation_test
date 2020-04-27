
function [aspectratio, distancetoaspectratio] = evaluationParallel_test(individual, targetaspectratio, branchingweight)

    [height, width, branchesnumber] = LsystemGeneratorNP_test(individual{1,1});
    
    [aspectratio, distancetoaspectratio] = getAspectRatioNP_test(height, width, branchesnumber, targetaspectratio, branchingweight);

endfunction
