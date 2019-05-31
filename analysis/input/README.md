# Input Directory

This directory should contain unedited data files directly from the source. I typically put different data sources into different sub-directories and include any relevant data documentation in the same directory. 

Following the guidelines of [Code and Data](https://web.stanford.edu/~gentzkow/research/CodeAndData.xhtml#magicparlabel-270), this directory is dedicated to raw data from other sources ONLY. Datasets in this input directory should NEVER be edited. If newer data extracts are used, older raw data should just be replaced and changes commmitted. Constructed datasets should NEVER be placed in this directory. 


library(haven)
SJSD <- read_sav("analysis/input/SJSD.sav")

The Social Justice Sexuality Project is one of the largest ever national surveys of races and genders. There are respondants from all 50 states and Puerto Rico with a variety of race/ethnic identities, sexual orientations, and gender identities. SJS Project investigates the sociopolitical experiences of this population around five themes: racial and sexual identity; spirituality and religion; mental and physical health; family formations and dynamics; civic and community engagement. The purpose of the SJS Project is to document and celebrate the experiences of people of color and the LGBT community. SJS Project was designed to describe a more dynamic experience. 

https://socialjusticesexuality.com/projects/

