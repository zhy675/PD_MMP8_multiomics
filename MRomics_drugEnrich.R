#install.packages("colorspace")
#install.packages("stringi")
#install.packages("ggplot2")

#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("org.Hs.eg.db")
#BiocManager::install("DOSE")
#BiocManager::install("clusterProfiler")
#BiocManager::install("enrichplot")


#引用包
library("clusterProfiler")
library("org.Hs.eg.db")
library("enrichplot")
library("ggplot2")

pvalueFilter=0.05      #p值过滤条件
adjPvalFilter=0.05     #矫正后的p值过滤条件

#定义图形的颜色
colorSel="p.adjust"
if(adjPvalFilter>0.05){
	colorSel="pvalue"
}

drugFile="DSigDB_All_detailed.txt"      #药物和基因的关系文件
hubFile="hubGene.csv"                   #核心基因的文件
setwd("C:\\Users\\lexb\\Desktop\\MRomics\\18.drugEnrich")      #设置工作目录

#读取核心基因的列表文件
rt=read.csv(hubFile, header=T, sep=",", check.names=F)
#提取核心基因的名称
genes=unique(as.vector(rt[,"name"]))

#读取药物数据库文件
drugRT=read.table(drugFile, header=T, sep="\t", check.names=F, quote="", comment.char="")
drugRT=drugRT[,1:2]

#药物富集分析
kk=enricher(genes,
	pvalueCutoff=1, qvalueCutoff=1,
	minGSSize = 10, maxGSSize = 500,
	TERM2GENE=drugRT)

#输出显著富集的结果
DRUG=as.data.frame(kk)
DRUG=DRUG[(DRUG$pvalue<pvalueFilter & DRUG$p.adjust<adjPvalFilter),]
write.table(DRUG[,-c(3,4)], file="DRUG.enrich.xls", sep="\t", quote=F, row.names = F)

#设置展示药物的数目
showNum=30
if(nrow(DRUG)<showNum){
	showNum=nrow(DRUG)
}

#柱状图
pdf(file="barplot.pdf", width=7, height=7)
barplot(kk, drop=TRUE, showCategory=showNum, label_format=100, color=colorSel)
dev.off()

#气泡图
pdf(file="bubble.pdf", width=7, height=7)
dotplot(kk, showCategory=showNum, orderBy="GeneRatio", label_format=100, color=colorSel)
dev.off()

#基因和药物的关系图
pdf(file="cnetplot.pdf", width=9, height=7)
cnet=cnetplot(kk, circular=TRUE, showCategory=10, colorEdge=TRUE)
print(cnet)
dev.off()


######生信自学网: https://www.biowolf.cn/
######课程链接1: https://shop119322454.taobao.com
######课程链接2: https://ke.biowolf.cn
######课程链接3: https://ke.biowolf.cn/mobile
######光俊老师邮箱: seqbio@foxmail.com
######光俊老师微信: eduBio


