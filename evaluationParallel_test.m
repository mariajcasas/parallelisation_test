
function [outputparams] = evaluationParallel_test(inputparams)

    # conversion to proper data types
    individual = inputparams{1,1};
    targetaspectratio = str2double(inputparams(1,2));
    branchingweight = str2double(inputparams(1,3));

    [height, width, branchesnumber] = LsystemGeneratorNP_test(individual);

    [aspectratio, distancetoaspectratio] = getAspectRatioNP_test(height, width, branchesnumber, targetaspectratio, branchingweight);

    outputparams = {individual, targetaspectratio, branchingweight, aspectratio, distancetoaspectratio};

endfunction
