#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alexander.vordermaier@student.tugraz.at
#SBATCH --output=slurm-%J.out
#SBATCH --error=slurm-%J.err
#SBATCH --partition=igi
#SBATCH --nodelist=nvcluster-node5
#SBATCH --ntasks=1

python cmp_dir --source ~/Projects/data/imagenet-drawing --target ~/Projects/data/train