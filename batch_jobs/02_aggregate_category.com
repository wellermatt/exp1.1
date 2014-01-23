
cd ~/projects/exp1.1/DataPrep
#$ -S /bin/bash
#$ -l h_vmem=8.0G
#$ -m e
#$ -M wellermatt@hotmail.com
#$ -q serial
#$ -N mjw_job1

source /etc/profile

module add intel
module add R

echo Job running on compute node `uname -n`

R CMD BATCH --no-save 02_aggregate_category.R ../output/02_aggregate_category.output
mail -s "step 2 done" wellermatt@hotmail.com  < ../output/02_aggregate_category.output
