#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=a.out
#SBATCH --output=cuda_%j_.out
#SBATCH --error=cuda_%j_.err
#SBATCH --time=1:00:00
#SBATCH --gres=gpu:1
./a.out
