##
#   Function that does some nonsense operations to the gene and returns some properties 
#   of its phenotype. 
#   The nonse operations are defined as they are for testing reasons.
##
function [height, width, branchesnumber] = LsystemGeneratorNP_test(gene)

    axiom = "G";
    symbolsset = {"+", "-"};
    openbracket = "[";

    height = width = branchesnumber = 0;
    
    # A very easy way to get the phenotype for testing reasons
    phenotype = strrep(gene, axiom, gene); 

    # Here it's supposed the phenotype to be represented graphically using a Lsystem tool 
    # but it's not relevant for this question so the following calculations will be silly oeprations

    # An easy silly operation to get the height of the phenotype
    height = length(strfind(phenotype, axiom));
    
    # Another easy and silly operation to get the width of the phenotype
    candidate = symbolsset{randi(length(symbolsset))};
    width = length(strfind(phenotype, candidate));

    # A nonsense way to calculate the branches number of the phenotype
    branchesnumber = length(strfind(phenotype, openbracket));

endfunction