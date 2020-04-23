# parallelisation_test

## ⚠️ Warning: Experimental ⚠️

Parallelisation test is a simple program in Octave where I would like to learn how to parallelise only a piece of code (function) in a sequential process.

## OS and Octave specs

It runs in Octave 5.2.0 version in Mac OS Catalina version 10.15.5 Beta (19F62f)

## Additional packages needed

* `parallel-4.0.0` hosted in Octave Forge (<https://sourceforge.net/p/octave/package-releases/413/attachment/parallel-4.0.0.tar.gz).> Previous releases didn't work for me. This package needs `struct` pkg to be installed first.  
* `struct-1.0.16` hosted in Octave Forge (<https://octave.sourceforge.io/download.php?package=struct-1.0.16.tar.gz).> As a dependency of `parallel` package.

The packages loading instructions are included in `parallelisation_test.m` initial lines. It could have been done also in `.octaverc` file but for doing the initialisation of the environment easier, they have been included in the main program file.  So, prior to run the `parallelisation_test` program you need to install the packages from an octave terminal:

### option 1

On this case, the tarball files are packages/ folder
`pkg("install", "./packages/struct-1.0.16.tar.gz");`
`pkg("install", "./packages/parallel-4.0.0.tar.gz");`

### option 2

Or you can do it downloading directly the files from Octave Forge running the following instructions:
`pkg("install", "-forge", "struct");`
`pkg("install", "-forge", "parallel");`

Once the packages have been installed, the environment is ready to execute the program. The `parallelisation_test.m` file is the main one.

* `evaluationParallel_test.m` is the piece of code that I'm interested in parallelising
* `LsystemGeneratorNP_test.m` and `getAspectRatioNP_test.m` (invoked by `evaluationParallel_test.m`) should be kept as sequential execution functions
* `outputparam1` and `outputparam2` returned by `getAspectRationNP_test` function and later by `evaluationParallel_test` to the main program, ought to be the same size of P which is a cell string array with the initial set of elements.

## How to run it

From a terminal (in my case it's a -zsh bash) it can execute as following:

`octave parallelisation_test.m`

or from an octave terminal:

`parallelisation_test.m`
