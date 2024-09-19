#!/bin/bash 

# Concatenate corrected.bed files for all samples

#cat /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A1.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A2/A2.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A3/A3.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A4/A4.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B1/B1.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B2/B2.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B3/B3.corrected_all_corrected.bed \
#  /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B4/B4.corrected_all_corrected.bed > /projects/weng_lab/scratch/kdoshi/VGpacbio/results/concatenated_all_corrected.bed

# Define paths to your files and tools
GENOME="/projects/weng_lab/scratch/kdoshi/VGpacbio/refGenome/human_GRCh38_no_alt_analysis_set.fasta"
GTF_FILE="/projects/weng_lab/scratch/kdoshi/VGpacbio/refGenome/gencode.v39.annotation.gtf"

OUTPUT_DIR="/projects/weng_lab/scratch/kdoshi/VGpacbio/results/samples_combined"
INPUT_DIR="/projects/weng_lab/scratch/kdoshi/VGpacbio/results/samples_combined"
THREADS=64

mkdir $OUTPUT_DIR

# Collapse concatenated bed file to refine isoforms
flair collapse \
  -g $GENOME \
  --gtf $GTF_FILE \
  -q /projects/weng_lab/scratch/kdoshi/VGpacbio/results/concatenated_all_corrected.bed \
  --stringent \
  --check_splice \
  --generate_map \
  --annotation_reliant generate \
  --threads $THREADS \
  --output $OUTPUT_DIR/all_samples.collapsed_comprehensive \
  --filter comprehensive \
  --reads /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A1.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A2/A2.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A3/A3.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/A4/A4.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B1/B1.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B2/B2.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B3/B3.fa \
    /projects/weng_lab/scratch/kdoshi/VGpacbio/results/B4/B4.fa

# Quantify Each sample using the collapsed file 
flair quantify \
  -r /projects/weng_lab/results/kdoshi/scripts/read_manifest_fasta_files.tsv \
  --isoforms /projects/weng_lab/scratch/kdoshi/VGpacbio/results/samples_combined/all_samples.collapsed_comprehensive.isoforms.fa \
  --threads 64 \
  --output /projects/weng_lab/scratch/kdoshi/VGpacbio/results/samples_combined/all_samples_comprehensive.quant \
  --sample_id_only

