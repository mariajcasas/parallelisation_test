##
# 
#   Function that generates balanced genes according to a limited set of rules, 
#   ensuring the output is always syntactically correct.
#   
#   usage: P = geneGenerator(maxgenelength, maxnestingnum, populationsize)
#   
#   Parameters:
#   -----------
#   maxgenelength: int
#                   Maximun length of the generated gene. 
#
#   maxnestingnum: int
#                   Maximum number of nesting levels permitted in the generated gene.
#
#   populationsize: int
#                   Number of individuals of the population
#
#   targetaspectratio: float
#                      The target aspect ratio value
#
#   branchingweight: float
#                    The weight given to the branching number property when calculating the aspect ratio
#   Returns:
#   --------
#   P: Cell array of N elements, being N the population size and each cell has the following structure:
#               [1,1]: gene: string that represents the gene of each individual of the population
#               [1,2]: aspectratiorange: float that represents the aspect ratio value
#               [1,3]: branchingweight: float that represents the weight given to the branching number property when calculating the aspect ratio
#
##
function P = populationGenerator(maxgenelength, maxnestingnum, populationsize, targetaspectratio, branchingweight)

    nucleotides = {"G", "+", "-", "["}; # The close bracket is excluded from this original set of candidates
    logger.initSLF4O();

    for i=1:populationsize
        # set variables
        gene = "";
        genelength = ceil(rand(1) * maxgenelength);
        nestingnum = ceil(rand(1) * maxnestingnum);

        #retrieve the first nucleotide
        nucleotide = nucleotides{randi(length(nucleotides))};
        gene = nucleotide;

        while length(gene) < genelength
            candidates = {};
            nestingdepth = getNestingDepth(gene);
            lastnucleotide = length(gene);

            if (genelength - length(gene) == OpenBrackets(gene))
                candidates = [candidates, {"]"}];
            else
                candidates = [candidates, {"G"}];
                if (genelength - length(gene) - OpenBrackets(gene)) > 2
                    if gene(lastnucleotide) != "-"
                        candidates = [candidates, {"+"}];
                    endif

                    if gene(lastnucleotide) != "+"
                        candidates = [candidates, {"-"}];
                    endif

                    if nestingnum > nestingdepth
                        candidates = [candidates, {"["}];
                    endif
                endif

                if ! IsGeneBalanced(gene) && gene(lastnucleotide) != "[" && gene(lastnucleotide) != "+" && gene(lastnucleotide) != "-"
                    candidates = [candidates, {"]"}];
                endif
            endif
            #get the next random nucleotide candidate
            candidate = candidates{randi(length(candidates))};
            gene = strcat(gene, candidate);
        endwhile
        
        P{i} = [{gene num2str(targetaspectratio) num2str(branchingweight)}];

    endfor

endfunction

##
# 
#   Function that calculates the depth nested bracket level of a gene.
#   
#   usage: getNestingDepth(gene)
#   
#   Parameters:
#   -----------
#   gene: string
#         It can contains brackets (balanced or not). 
#
#   Returns:
#   --------
#   nestinglevel: Number of nesting level the input parameter has in its structure
#
##
function nestinglevel = getNestingDepth(gene)
    
    nestinglevel = 0;
    if length(gene) != 0
        #Removing the characters excluding the brackets
        onlybracketsstring = strjoin(strsplit(gene,{'G','+','-'}),'');
        if length(onlybracketsstring) != 0
            nestinglevel = max(cumsum(ifelse(onlybracketsstring == "[", 1, -1)));
        endif
    endif

endfunction

##
# 
#   Function that calculates the number of the unbalanced open brackets in a gene.
#   
#   usage: OpenBrackets(g)
#   
#   Parameters:
#   -----------
#   g: string
#      It can contains brackets (balanced or not). 
#
#   Returns:
#   --------
#   num: Number of unbalanced open brackets.
##
##
function num = OpenBrackets(g)
    num = length(strfind(g,"[")) - length(strfind(g,"]"));

endfunction

##
# 
#   Function that checks if the gene is bracket balanced.
#   
#   usage: IsGeneBalanced(g)
#   
#   Parameters:
#   -----------
#   g: string
#      It can contains brackets (balanced or not). 
#
#   Returns:
#   --------
#   isbalanced: Boolean
#               1 if the gene is balanced. 0 otherwise.
#
#   Examples:
#   ----------
#   y = IsGeneBalanced("GG+[++[")
#   y = 0
#
#   y = IsGeneBalanced("GG+[+G]+[")
#   y = 0
##
function isbalanced = IsGeneBalanced(g)
    isbalanced = length(strfind(g,"[")) == length(strfind(g,"]"));

endfunction