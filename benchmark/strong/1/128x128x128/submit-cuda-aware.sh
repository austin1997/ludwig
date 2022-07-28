#!/bin/bash
#
#SBATCH --job-name=128_1
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --partition=gpu-cascade
#SBATCH --qos=gpu

NVHPC_VERSION=22.2
module load nvidia/nvhpc-nompi/$NVHPC_VERSION
module load gcc
module load openmpi/4.1.2-cuda-11.6

date
echo $LD_LIBRARY_PATH

EXE_PATH=../../Ludwig.exe

srun --ntasks=1 --tasks-per-node=1 --cpus-per-task=2 --hint=nomultithread \
    --distribution=block:block $EXE_PATH ./input

date
