#!/bin/bash
#SBATCH --job-name=sort_bam
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=02:00:00
#SBATCH --output=sort_%j.out
#SBATCH --error=sort_%j.err
module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd
samtools sort /athena/angsd/scratch/yiw4021/project/${1}_Aligned.out.bam -o /athena/angsd/scratch/yiw4021/${1}_Aligned.sorted.bam
samtools index /athena/angsd/scratch/yiw4021/${1}_Aligned.sorted.bam
