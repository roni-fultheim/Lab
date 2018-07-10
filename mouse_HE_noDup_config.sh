source_dir="/private7/projects/beta_cells/mouse_A_B/inputHE_mouse_A_B.txt"

genome_bwa_ind="/home/alu/ilanas/genomes/mm9/bwa_index/MM9"
genome_trans_bwa_ind="/home/alu/ilanas/genomes/mm9/transformed.bwa_index/MM9"
genome_fasta="/home/alu/ilanas/genomes/mm9/MM9.fa"  

Q="33" # PHRED score of base quality (33 or 64) http://en.wikipedia.org/wiki/FASTQ_format
PE="0" # 0 => single end, 1 => paired end. for paired end the file of the reads suppose to contain the paired end one by one with the same out_pre
GAP=500000 # gap max size between the pairs. 
dir_pre="/private7/projects/beta_cells/mouse_A_B/HE" #output directory that will be created  

bwa_run="1" # 0 => pipeline will not run BWA mapping if analyseMM file exists, 1 => first run BWA mapping of the source files  
analyse="2" # 0 => just detect UE without analysis, 1=> analyse each src file (or PE) results, 2=> analyse each src file (or PE) results and combine and analyse all the files together
ue_detect_args="0.05 0.8 30 0.6 0.1 0.8 0.2" # args meaning: -Min of edit sites at Ultra-Edit read -Min fraction of edit sites/mm sites -Min sequence quality for counting editing event -Max fraction of same letter in cluster -Min of cluster length -Max initiate index of cluster -Min ending index of cluster

run_ue_script="/home/alu/ilanas/Scripts/config/run_hyper_editing_mm9_withStat.sh"  #################
 
$run_ue_script $genome_bwa_ind $genome_trans_bwa_ind $genome_fasta $Q $PE $GAP $dir_pre $bwa_run $analyse $ue_detect_args $source_dir
