#!/bin/bash
#SBATCH --job-name=STAR_align
#SBATCH --output=/athena/angsd/scratch/yiw4021/project/logs/star_align_%j.out
#SBATCH --error=/athena/angsd/scratch/yiw4021/project/logs/star_align_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=07:00:00

module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

mkdir -p /athena/angsd/scratch/yiw4021/project/trimmed_bam_files
mkdir -p /athena/angsd/scratch/yiw4021/project/logs

STAR \
  --runMode alignReads \
  --runThreadN 8 \
  --genomeDir /athena/angsd/scratch/yiw4021/project/new_STAR_index \
  --readFilesIn \
    /athena/angsd/scratch/yiw4021/project/trimmed_fastq/${1}_1_trimmed.fastq.gz \
    /athena/angsd/scratch/yiw4021/project/trimmed_fastq/${1}_2_trimmed.fastq.gz \
  --readFilesCommand zcat \
  --outFileNamePrefix /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/${1}_trimmed_ \
  --outSAMtype BAM Unsorted
