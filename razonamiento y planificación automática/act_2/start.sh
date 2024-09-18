#!/bin/bash

#wget https://bitbucket.org/ipc2018-classical/team23/raw/ipc-2018-seq-opt/Singularity
singularity build planner.img Singularity
mkdir rundir
cp /usr/local/actividad3/domain.pddl rundir
cp /usr/local/actividad3/problem1.pddl rundir
RUNDIR="$(pwd)/rundir"
DOMAIN="$RUNDIR/domain_minerales.pddl"
PROBLEM="$RUNDIR/problem_minerales_v2.pddl"
PLANFILE="$RUNDIR/sas_plan"
COSTBOUND=42 
ulimit -t 1800
ulimit -v 8388608
singularity run -C -H $RUNDIR planner.img $DOMAIN $PROBLEM $PLANFILE $COSTBOUND