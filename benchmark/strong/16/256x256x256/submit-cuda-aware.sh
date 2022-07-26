#!/bin/bash
#
#SBATCH --job-name=256_16
#SBATCH --gres=gpu:4
#SBATCH --time=00:30:00
#SBATCH --nodes=4
#SBATCH --exclusive
#SBATCH --partition=gpu-cascade
#SBATCH --qos=gpu

NVHPC_VERSION=22.2
module load nvidia/nvhpc/$NVHPC_VERSION
module load intel-20.4/compilers

date
echo $LD_LIBRARY_PATH

EXE_PATH=../../Ludwig.exe

mpiexec $EXE_PATH ./input

date
