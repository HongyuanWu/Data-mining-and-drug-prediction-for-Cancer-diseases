OC = read.csv('ovarian_cancer.csv')
EC = read.csv('endometrial_cancer.csv')
BC = read.csv('breast_cancer.csv')

oc_select = data.frame(OC[c("Symbol")])
ec_select = data.frame(EC[c("Symbol")])
bc_select = data.frame(BC[c("Symbol")])

#Data filtering and preprocessing
#filtering of overian_cancer_data
duplicated(oc_select)
which(duplicated(oc_select))
oc_select=oc_select[!duplicated(oc_select),]
oc_select

#filtering of endometrial_cancer_data
duplicated(ec_select)
which(duplicated(ec_select))
ec_select=ec_select[!duplicated(ec_select),]
ec_select
#filtering of breast_cancer_data
duplicated(bc_select)
which(duplicated(bc_select))
bc_select=bc_select[!duplicated(bc_select),]
bc_select

#Data linkage and concordant genes identification 
# find concordant genes between ovarian cancer & endometrial cancer
result1 = intersect(oc_select,ec_select)
matrix(result1,ncol = 1,byrow = TRUE)
result1_frame = data.frame(matrix(result1,ncol = 1,byrow = TRUE))
colnames(result1_frame) = c("Symbol")
write.csv(result1_frame,"OC_and_EC.csv",row.names = FALSE)
result1_frame

# find concordant genes between ovarian cancer & breast cancer
result2 = intersect(oc_select,bc_select)
matrix(result2,ncol = 1,byrow = TRUE)
result2_frame = data.frame(matrix(result2,ncol = 1,byrow = TRUE))
colnames(result2_frame) = c("Symbol")
write.csv(result2_frame,"OC_and_BC.csv",row.names = FALSE)
result2_frame

# find concordant genes between breast cancer & endometrial cancer 
result3 = intersect(bc_select,ec_select)
matrix(result3,ncol = 1,byrow = TRUE)
result3_frame = data.frame(matrix(result3,ncol = 1,byrow = TRUE))
colnames(result3_frame) = c("Symbol")
write.csv(result3_frame,"BC_and_EC.csv",row.names = FALSE)
result3_frame

#concordant genes identification for OC,EC & BC
concordant_genes = intersect(result1,bc_select)
matrix(concordant_genes,ncol = 1,byrow = TRUE)
concordant_genes_frame = data.frame(matrix(concordant_genes,ncol = 1,byrow = TRUE))
colnames(concordant_genes_frame) = c("Symbol")
write.csv(concordant_genes_frame,"Concordant_genes.csv",row.names = FALSE)
concordant_genes_frame
















