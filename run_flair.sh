#!/bin/bash

##### Usage ######################################
# run_flair.sh sample_name_without_bam_extension
##################################################

# Define paths to your files and tools
SAMPLE_NAME=$1
BAM_FILE="/projects/weng_lab/scratch/kdoshi/VGpacbio/raw_data/$SAMPLE_NAME.bam"
GENOME="/projects/weng_lab/scratch/kdoshi/VGpacbio/refGenome/human_GRCh38_no_alt_analysis_set.fasta"
GTF_FILE="/projects/weng_lab/scratch/kdoshi/VGpacbio/refGenome/gencode.v39.annotation.gtf"
#FLAIR_DIR="path/to/flair"
OUTPUT_DIR="/projects/weng_lab/scratch/kdoshi/VGpacbio/results/$SAMPLE_NAME"
THREADS=32

mkdir $OUTPUT_DIR
#mkdir $OUTPUT_DIR/fastq_used
#OUTPUT_DIR="/projects/weng_lab/scratch/kdoshi/VGpacbio/results/$SAMPLE_NAME/fastq_used"
# Step 1: Convert BAM to FASTQ
#echo "Converting BAM to FASTQ..."
#samtools fasta --threads $THREADS $BAM_FILE > $OUTPUT_DIR/$SAMPLE_NAME.fa

# Step 2: Align reads to the reference genome using minimap2
echo "Aligning reads to the reference genome..."
#minimap2 -ax splice --secondary=no -t $THREADS -uf --sam-hit-only $GENOME A1.fastq > aligned.sam
flair align -g $GENOME -r /projects/weng_lab/scratch/kdoshi/VGpacbio/results/samples_combined/$SAMPLE_NAME.fastq.gz \
  --output $OUTPUT_DIR/$SAMPLE_NAME.aligned \
  --threads $THREADS

# Step 3: Run FLAIR to correct and collapse isoforms
echo "Running FLAIR correct..."
# Flair correct
flair correct -q $OUTPUT_DIR/$SAMPLE_NAME.aligned.bed \
  -g $GENOME \
  --threads $THREADS \
  --output $OUTPUT_DIR/$SAMPLE_NAME.corrected \
  -f $GTF_FILE

echo "Running FLAIR collapse"
# Flair collapse
#flair collapse -g $GENOME -r $OUTPUT_DIR/A1.fa -q $OUTPUT_DIR/corrected_all_corrected.bed --output $OUTPUT_DIR/collapsed --threads $THREADS
flair collapse \
  -g $GENOME \
  --gtf $GTF_FILE \
  -q $OUTPUT_DIR/$SAMPLE_NAME.corrected_all_corrected.bed \
  -r /projects/weng_lab/scratch/kdoshi/VGpacbio/results/samples_combined/$SAMPLE_NAME.fastq.gz \
  --stringent \
  --check_splice \
  --generate_map \
  --annotation_reliant generate \
  --threads $THREADS \
  --output $OUTPUT_DIR/$SAMPLE_NAME.collapsed

echo "FLAIR pipeline completed. Results are in $OUTPUT_DIR."
