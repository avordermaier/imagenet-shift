#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alexander.vordermaier@student.tugraz.at
#SBATCH --output=slurm-%J.out
#SBATCH --error=slurm-%J.err
#SBATCH --partition=igi
#SBATCH --nodelist=nvcluster-node5
#SBATCH --ntasks=1

cd src-imagenet-drawing
python3 drawing.py --load_folder /home/a09v98/imagenet/validation --save_folder /home/a09v98/Projects/data/imagenet-drawing2/validation --drawing-pattern drawing-patterns/drawing-pattern-II.jpg
python3 drawing.py --load_folder /home/a09v98/imagenet/validation --save_folder /home/a09v98/Projects/data/imagenet-drawing3/validation --drawing-pattern drawing-patterns/drawing-pattern-III.png
python3 drawing.py --load_folder /home/a09v98/imagenet/validation --save_folder /home/a09v98/Projects/data/imagenet-drawing4/validation --drawing-pattern drawing-patterns/drawing-pattern-IV.jpg
