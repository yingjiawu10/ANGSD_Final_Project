#!/bin/bash
#SBATCH --job-name=fastp_trim
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=4:00:00
#SBATCH --output=/athena/angsd/scratch/yiw4021/project/logs/fastp_%j.log

module purge
source /home/fs01/yiw4021/miniforge3/etc/profile.d/conda.sh
conda activate angsd

INPUT_DIR=/athena/angsd/scratch/yiw4021/project/raw_fastq
OUTPUT_DIR=/athena/angsd/scratch/yiw4021/project/trimmed_fastq

mkdir -p $OUTPUT_DIR

for id in SRR25451156 SRR25451157 SRR25451158 SRR25451159 SRR25451160 \
           SRR25451161 SRR25451162 SRR25451163 SRR25451164 SRR25451165 \
           SRR25451166 SRR25451167 SRR25451168 SRR25451169 SRR25451170; do
  fastp \
    -i ${INPUT_DIR}/${id}_1.fastq.gz \
    -I ${INPUT_DIR}/${id}_2.fastq.gz \
    -o ${OUTPUT_DIR}/${id}_1_trimmed.fastq.gz \
    -O ${OUTPUT_DIR}/${id}_2_trimmed.fastq.gz \
    --trim_poly_g \
    --poly_g_min_len 10 \
    -q 20 \
    --length_required 20 \
    --thread 8 \
    -j ${OUTPUT_DIR}/${id}_fastp.json \
    -h ${OUTPUT_DIR}/${id}_fastp.html
done
