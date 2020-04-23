##
# Function that calculates the aspect ratio of the phenotype
#
#   Parameters:
#   --------------
#   targetaspectratio: float
#                target aspect ratio defined in the main experiment
#
#   branchingweight: float
#                branching weight defined in the main experiment
#
#   Returns:
#   ---------
#   aspectratio: float
#                Aspect ratio of the given individual
#
#   distancetoar: float
#                 Distance to the aspect ratio value
##
function [aspectratio, distancetoar] = getAspectRatioNP_test(height, width, branchesnumber, targetaspectratio, branchingweight);

    aspectratio = 0;
    distancetoar = -1;
    
    # Checking what is received on each input parameter
    fprintf("getAspectRatio_test: height %f\n", height);
    fprintf("getAspectRatio_test: width %f\n", width);
    fprintf("getAspectRatio_test: branchesnumber %f\n", branchesnumber);
    # In the next two log instructions, instead of %s should be %f because targetaspectratio and branchingweight are float type. However as they are received wrongly in evaluationParallel_test function, the error is propagated until here
    fprintf("getAspectRatio_test: targetaspectratio %s\n", targetaspectratio);
    fprintf("getAspectRatio_test: branchingweight %s\n", branchingweight);

    if (height != 0 && width != 0 && branchesnumber != 0)        
        aspectratio = height/width/(branchesnumber.^branchingweight);
        distancetoar = abs(targetaspectratio - aspectratio);
    endif

endfunction