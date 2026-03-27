#!/bin/bash
#SBATCH --job-name=STAR_align
#SBATCH --output=star_align_%j.out
#SBATCH --error=star_align_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=07:00:00
module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd
STAR \
  --runMode alignReads \
  --runThreadN 8 \
  --genomeDir /athena/angsd/scratch/yiw4021/project/new_STAR_index \
  --readFilesIn \
    /athena/angsd/scratch/yiw4021/project/${1}_1.fastq.gz \
    /athena/angsd/scratch/yiw4021/project/${1}_2.fastq.gz \
  --readFilesCommand zcat \
  --outFileNamePrefix /athena/angsd/scratch/yiw4021/${1}_ \
  --outSAMtype BAM Unsorted
