#!/usr/bin/env bash
set -euo pipefail

#$ -S /bin/bash
#$ -cwd
#$ -o 5vw1_repack_relax
#$ -j y
#$ -l mem_free=4G
#$ -l arch=linux-x64
#$ -l netapp=1G,scratch=1G
#$ -l h_rt=24:00:00
#$ -t 1-100

hostname
source rosetta.sh
relax_cas9 5vw1_repack.pdb $SGE_TASK_ID


