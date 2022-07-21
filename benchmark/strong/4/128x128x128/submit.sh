#!/bin/bash
#
#SBATCH --job-name=64_1_4
#SBATCH --gres=gpu:4
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

EXE_PATH=/mnt/lustre/indy2lfs/work/dc134/dc134/s2225484/ludwig/benchmark/Ludwig.exe

srun --ntasks=4 --tasks-per-node=4 $EXE_PATH ./input

date
