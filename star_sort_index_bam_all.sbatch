#!/bin/bash
#SBATCH --job-name=sort_bam
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=02:00:00
#SBATCH --output=/athena/angsd/scratch/yiw4021/project/logs/sort_%j.out
#SBATCH --error=/athena/angsd/scratch/yiw4021/project/logs/sort_%j.err

module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

samtools sort /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/${1}_trimmed_Aligned.out.bam \
-@ 4 \
-o /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/${1}_trimmed_Aligned.sorted.bam

samtools index /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/${1}_trimmed_Aligned.sorted.bam
