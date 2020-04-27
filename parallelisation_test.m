
# Package Loading
pkg("load", "struct");
pkg("load", "parallel");

# Init Variables
targetaspectratio = 0.01;
branchingweight = 0.2;
maxgenelength = 10;
maxgenenesting = 3;
populationsize = 1000;


fprintf("\n\n\n");
totaltime = tic();

geneGeneratorStart = tic();
fprintf("parallelisation_test: geneGenerator\n");

P = populationGenerator(maxgenelength, maxgenenesting, populationsize);

geneGeneratorelapsedtime = toc(geneGeneratorStart);
fprintf("parallelisation_test: Elapsed time %d\n", geneGeneratorelapsedtime);

numCores = nproc();

fprintf("parallelisation_test: parcellfun starts\n");
parallelisationStart = tic();

# Additional input parameters of the function to parallelise should be defined at this point
fun = @(row_idx) evaluationParallel_test(row_idx, targetaspectratio, branchingweight);

[aspectratio, distancetoaspectratio] = pararrayfun(numCores, fun, P, "UniformOutput", false);

parallelisationtime = toc(parallelisationStart);
fprintf("parallelisation_test: Elapsed time %d\n", parallelisationtime);

total_elapsed_time = toc(totaltime);
fprintf("parallelisation_test: TOTAL Elapsed time %d\n", total_elapsed_time);

