#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alexander.vordermaier@student.tugraz.at
#SBATCH --output=slurm-%J.out
#SBATCH --error=slurm-%J.err
#SBATCH --partition=igi
#SBATCH --nodelist=nvcluster-node5
#SBATCH --ntasks=1

cd src-imagenet-cartoon
python3 --load_folder /home/a09v98/imagenet/validation --save_folder /home/a09v98/Projects/datasets/imagenet-cartoon
