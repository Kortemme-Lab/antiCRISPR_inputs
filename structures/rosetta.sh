#!/usr/bin/env bash
set -euo pipefail

# Expect $ROSETTA and $ROSETTA_BUILD to be set as environment variables.

BIN=$ROSETTA/source/bin
STRUCTS=$(pwd)
LIGAND=$(readlink -f $STRUCTS/../ligand_2018)

function header() {
    echo "Host: $(hostname)"
    echo "Date: $(date)"
    echo "Directory: $(pwd)"
    echo "Command: SGE_TASK_ID=$SGE_TASK_ID $0 $@"
}

function relax_cas9 () {
    header
    $BIN/relax.$ROSETTA_BUILD                                               \
        -in:file:s $STRUCTS/$1                                              \
        -out:suffix _relax/$2                                               \
        -out:no_nstruct_label                                               \
        -out:overwrite                                                      \
        -relax:constrain_relax_to_start_coords                              \
        -relax:coord_constrain_sidechains                                   \
        -relax:ramp_constraints false                                       \
        -packing:ex1                                                        \
        -packing:ex2                                                        \
        -packing:use_input_sc                                               \
        -packing:flip_HNQ                                                   \
        -packing:no_optH false                                              #
}

function repack_cas9 () {
    header
    $BIN/fixbb.$ROSETTA_BUILD                                               \
        -in:file:s $STRUCTS/$1                                              \
        -out:suffix _repack/$2                                              \
        -out:no_nstruct_label                                               \
        -out:overwrite                                                      \
        -resfile default_resfile                                            \
        -packing:ex1                                                        \
        -packing:ex2                                                        \
        -packing:use_input_sc                                               #
}

function score_cas9_models () {
    rm -f $1/score.tab
    $BIN/score.$ROSETTA_BUILD                                               \
        -in:file:s                                                          \
            $STRUCTS/*.pdb                                                  \
            $STRUCTS/$1/*.pdb                                               \
        -in:file:native $STRUCTS/5vw1.pdb                             \
        -out:file:scorefile $1/score.tab                                    \
        -out:file:scorefile_format json                                     #
}

function minimize_cas9_models () {

    header
    $BIN/minimize.$ROSETTA_BUILD                                            \
        -in:file:s $STRUCTS/$1                                              \
        -out:no_nstruct_label                                               \
        -out:overwrite                                                      \
        -out:suffix _minimized                                              \
        -packing                                                            #

}
