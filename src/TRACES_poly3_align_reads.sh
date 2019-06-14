#!/bin/bash
#
# ALIGNMENT OF POLY3 READS
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
bowtie2 -a --threads $3 -x index_file -1 o_fw_pr.fq -2 o_rv_pr.fq -U o_fw_unpr.fq,o_rv_unpr.fq > aligned-$2.sam
samtools sort aligned-$2.sam > poly3_aligned_sorted-$2.bam
#
samtools index poly3_aligned_sorted-$2.bam poly3_aligned_sorted-$2.bam.bai
#