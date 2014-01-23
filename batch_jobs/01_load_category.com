
cd ~/projects/exp1.1/DataPrep
#$ -S /bin/bash
#$ -l h_vmem=7.0G
#$ -m e
#$ -M wellermatt@hotmail.com
#$ -q serial
#$ -N mjw_job1

source /etc/profile

module add intel
module add R

echo Job running on compute node `uname -n`

R CMD BATCH --no-save 01_consolidate_category.R ../output/01_consolidate_category.output

mail -s "Milk step 1 done" wellermatt@hotmail.com < ../output/01_consolidate_category.output


