#!/bin/bash
#
#SBATCH --job-name=64_1_2
#SBATCH --gres=gpu:2
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --partition=gpu-cascade
#SBATCH --qos=gpu

#module load intel-mpi-19
#module load intel-comiplers-19
#module load nvidia/cuda-11.2
NVHPC_VERSION=22.2
module load nvidia/nvhpc/$NVHPC_VERSION
module load intel-20.4/compilers
module load intel-20.4/mpi
module load mpt

date
echo $LD_LIBRARY_PATH

EXE_PATH=../../Ludwig.exe

srun --ntasks=2 --tasks-per-node=2 $EXE_PATH ./input

date
