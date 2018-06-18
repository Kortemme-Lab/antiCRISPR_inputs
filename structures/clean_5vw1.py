
from prody import *

# Load the Cas9 + anti-CRISPR structure
cas9 = parsePDB('5vw1.pdb')

# Get rid of waters, ions, etc.
cas9 = cas9.select('protein or nucleic')
cas9 = cas9.copy()

# Sequentially renumber the residues
resis = cas9.getResindices() + 1
cas9.setResnums(resis)

# Save the cleaned PDB
writePDB('5vw1_clean.pdb',cas9)
