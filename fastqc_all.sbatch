#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --output=fastqc_%j.out
#SBATCH --error=fastqc_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=02:00:00
module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

fastqc /athena/angsd/scratch/yiw4021/project/${1}_1.fastq.gz \
       /athena/angsd/scratch/yiw4021/project/${1}_2.fastq.gz \
       -o /athena/angsd/scratch/yiw4021/project/fastqc_results/ \
       -t 4
