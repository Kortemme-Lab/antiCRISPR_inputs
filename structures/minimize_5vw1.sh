#!/usr/bin/env bash
set -euo pipefail

#$ -S /bin/bash
#$ -cwd
#$ -o 1qjg_clean_relax_repack
#$ -j y
#$ -l mem_free=1G
#$ -l arch=linux-x64
#$ -l netapp=1G,scratch=1G
#$ -l h_rt=12:00:00
#$ -t 1

source rosetta.sh
minimize_cas9_models 5vw1_repack_relax_repack.pdb $SGE_TASK_ID
