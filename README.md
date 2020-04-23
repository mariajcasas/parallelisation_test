# parallelisation_test
Parallelisation test is a simple program in Octave where I would like to learn how to parallelise only a piece of code (function) in a sequential process.

parallelisation_test.m is the main file. 
 * `evaluationParallel_test.m` is the piece of code that I'm interested on parallelising.
 * `LsystemGeneratorNP_test.m` and `getAspectRatioNP_test.m` (invoqued by `evaluationParallel_test.m`) should be kept as sequential execution functions.
 * `outputparam1` and `outputparam2` returned by `getAspectRationNP_test` function and later by `evaluationParallel_test` to the main program, ought to be the same size of P which is a cell string array with the initial set of elements. 
