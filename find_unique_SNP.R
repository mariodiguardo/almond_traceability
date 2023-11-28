#SNPolisher is the standard output of the Axiom Analysis Suite (Export -> Genotypic Data ), 
## SNPs are displayed by rows, individuals by column
## the script can handle any type of genotypic call (e.g. AA/AB/BB, 00/01/11, nucleotides)

input_file = 'SNPolisher.txt'
almond_gt.1 = read.delim(input_file, comment.char = '#', na.strings = 'NoCall')
almond_gt.2 = t(almond_gt.1)
colnames(almond_gt.2) = almond_gt.2[1,]
almond_gt.3 = almond_gt.2[-1,]

sample_name = NULL
SNP_name = NULL
y = 1
for(snp in 1:ncol(almond_gt.3)){
if(min (table(almond_gt.3[,snp])) == 1){
  tmp = table(almond_gt.3[,snp])
  sample_name[y] = rownames(almond_gt.3)[almond_gt.3[,snp] %in% names(tmp[tmp == min(tmp)])]
  SNP_name[y] = colnames(almond_gt.3)[snp]
  y = y +1
}
  }

final = cbind.data.frame(sample_name, SNP_name) # table with the sample discriminated and the corresponding unique snp
