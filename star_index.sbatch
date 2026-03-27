#!/bin/bash
#SBATCH --job-name=STAR_index_human
#SBATCH --output=star_index_%j.out
#SBATCH --error=star_index_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=60G                  
#SBATCH --time=06:00:00  

module purge

source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

mkdir -p /athena/angsd/scratch/yiw4021/new_STAR_index

STAR \
  --runMode genomeGenerate \
  --runThreadN 8 \
  --genomeDir /athena/angsd/scratch/yiw4021/new_STAR_index \
  --genomeFastaFiles /athena/angsd/scratch/yiw4021/project/refseq/GCF_000001405.40_GRCh38.p14_genomic.fna \
  --sjdbGTFfile /athena/angsd/scratch/yiw4021/project/refseq/GCF_000001405.40_GRCh38.p14_genomic.gtf \
  --sjdbOverhang 75
