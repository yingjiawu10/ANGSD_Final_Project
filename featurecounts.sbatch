#!/bin/bash
#SBATCH --job-name=featureCounts
#SBATCH --output=featureCounts_%j.out
#SBATCH --error=featureCounts_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=40G
#SBATCH --time=02:00:00
module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

featureCounts \
  -T 8 \
  -p \
  --countReadPairs \
  -a /athena/angsd/scratch/yiw4021/project/refseq/GCF_000001405.40_GRCh38.p14_genomic.gtf \
  -o /athena/angsd/scratch/yiw4021/project/counts.txt \
  /athena/angsd/scratch/yiw4021/project/SRR25451156_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451157_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451158_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451159_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451160_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451161_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451162_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451163_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451164_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451165_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451166_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451167_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451168_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451169_Aligned.sorted.bam \
  /athena/angsd/scratch/yiw4021/project/SRR25451170_Aligned.sorted.bam
