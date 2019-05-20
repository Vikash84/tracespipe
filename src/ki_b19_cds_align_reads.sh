#!/bin/bash
# 
# ALIGNMENT OF B19 CDS READS
#
# IT ASSUMES THAT THE FOLLOWING FASTQ FILES EXIST (FOR INPUT):
# o_fw_pr.fq o_rv_pr.fq o_fw_unpr.fq o_rv_unpr.fq
#
# $1 -> REFERENCE FASTA FILE
# $2 -> ORGAN
#
rm -f index_file*
bowtie2-build $1 index_file
#
bowtie2 -a --threads 12 -x index_file -1 o_fw_pr.fq -2 o_rv_pr.fq -U o_fw_unpr.fq,o_rv_unpr.fq > aligned-$2.sam
samtools sort aligned-$2.sam > b19_cds_aligned_sorted-$2.bam
#
samtools index b19_cds_aligned_sorted-$2.bam b19_cds_aligned_sorted-$2.bam.bai
#
