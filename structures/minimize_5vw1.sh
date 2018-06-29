#!/usr/bin/env bash
set -euo pipefail

#$ -S /bin/bash
#$ -cwd
#$ -o 5vw1_minimize_o
#$ -e 5vw1_minimize_e
#$ -j y
#$ -l mem_free=2G
#$ -l arch=linux-x64
#$ -l netapp=1G,scratch=1G
#$ -l h_rt=24:00:00
#$ -t 1

source rosetta.sh
minimize_cas9_models 5vw1_repack_relax_repack.pdb $SGE_TASK_ID
