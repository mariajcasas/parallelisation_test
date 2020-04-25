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
    
    if (height != 0 && width != 0 && branchesnumber != 0)        
        aspectratio = height/width/(branchesnumber^branchingweight);
        distancetoar = abs(targetaspectratio - aspectratio);
    endif

endfunction