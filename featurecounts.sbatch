#!/bin/bash
#SBATCH --job-name=featureCounts
#SBATCH --output=/athena/angsd/scratch/yiw4021/project/logs/featureCounts_%j.out
#SBATCH --error=/athena/angsd/scratch/yiw4021/project/logs/featureCounts_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30G
#SBATCH --time=02:00:00

module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

featureCounts \
  -T 8 \
  -p \
  --countReadPairs \
  -s 2 \
  -a /athena/angsd/scratch/yiw4021/project/refseq/GCF_000001405.40_GRCh38.p14_genomic.gtf \
  -o /athena/angsd/scratch/yiw4021/project/rseqc/counts.txt \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451156_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451157_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451158_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451159_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451160_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451161_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451162_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451163_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451164_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451165_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451166_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451167_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451168_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451169_trimmed_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/trimmed_bam_files/SRR25451170_trimmed_Aligned.sorted.bam
