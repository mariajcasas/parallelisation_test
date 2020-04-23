
# Settings

# The content of P is not relevant for my parallelisation doubt so, a reduced set of strings is defined
P = {"G++GG[G]", "GG—G", "GG[G[GG]G[GG]G]", "G++GG", "GG[GG]", "G[—G+G][G]", "G-[-GG]", "[]", "[[GG]]", "G"};

targetaspectratio = 0.01;
branchingweight = 0.2;

numCores = nproc();

timeStart = tic();
fun = @(idx) evaluationParallel_test(P{idx,:}, targetaspectratio, branchingweight);
[outputparam1, outputparam2] = pararrayfun(numCores - 1, fun, rows(P), "UniformOutput", false);

elapsed_time = toc(timeStart);
fprintf("parallelisation_test: Elapsed time %d\n", elapsed_time);
