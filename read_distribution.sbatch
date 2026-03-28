#!/bin/bash
#SBATCH --job-name=rseqc_read_dist
#SBATCH --output=/athena/angsd/scratch/yiw4021/project/logs/rseqc_read_dist_%j.out
#SBATCH --error=/athena/angsd/scratch/yiw4021/project/logs/rseqc_read_dist_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=02:00:00

module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate rseqc

read_distribution.py \
  -i /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/${1}_trimmed_Aligned.sorted.bam \
  -r /athena/angsd/scratch/yiw4021/project/refseq/GCF_000001405.40_GRCh38.p14_genomic.bed \
  > /athena/angsd/scratch/yiw4021/project/rseqc/${1}_read_distribution.txt