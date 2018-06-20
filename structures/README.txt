The following is a protocol for setting up the Cas9-acrII4 anti-CRISPR complex
such that it containts mutations from designed Cas9s. 

1. Set up a resfile with the desired mutations and repack:
        $./qsub_repack_5vw1.sh (cluster)
        Note that we want to do this before cleaning the model so that
        we can be sure that the numbering is correct.

2. Pick the lowest-scoring repacked model:
        $ ./pick_repack.sh

3. Clean the structure: 
        $ ./clean_5vw1.pdb


