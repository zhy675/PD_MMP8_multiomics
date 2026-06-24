#if (!require("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("VariantAnnotation")

#install.packages("devtools")
#devtools::install_github("mrcieu/gwasglue", force = TRUE)

#install.packages("remotes")
#remotes::install_github("MRCIEU/TwoSampleMR")


#引用包
library(VariantAnnotation)
library(gwasglue)
library(TwoSampleMR)
library(R.utils)  # 加载R.utils包
exposureFile="exposure.F.csv"            #暴露数据文件
# 设置结局数据文件路径（需修改）
outcomeFile = "finngen_R10_C3_MULT_MYELOMA_EXALLC.gz"  # 结局数据文件

outcomeName="Multiple myeloma"     #图形中展示疾病的名称
setwd("D:\\教程\\4907血浆蛋白孟德尔随机化分析\\04本地（芬兰数据库）孟德尔随机化分析")     #设置工作目录

#读取暴露数据
exposure_dat=read_exposure_data(filename=exposureFile,
                                sep = ",",
                                snp_col = "SNP",
                                beta_col = "beta.exposure",
                                se_col = "se.exposure",
                                pval_col = "pval.exposure",
                                effect_allele_col="effect_allele.exposure",
                                other_allele_col = "other_allele.exposure",
                                eaf_col = "eaf.exposure",
                                phenotype_col = "exposure",
                                id_col = "id.exposure",
                                samplesize_col = "samplesize.exposure",
                                chr_col="chr.exposure", pos_col = "pos.exposure",
                                clump=FALSE)


# 读取结局数据文件
outcomeData = read_outcome_data(snps = exposure_dat$SNP,  # 指定SNP列表
                                filename = outcomeFile,  # 指定文件名
                                sep = "\t",  # 指定分隔符
                                snp_col = "rsids",  # 指定SNP列名
                                beta_col = "beta",  # 指定beta值列名
                                se_col = "sebeta",  # 指定标准误列名
                                effect_allele_col = "alt",  # 指定效应等位基因列名
                                other_allele_col = "ref",  # 指定其他等位基因列名
                                pval_col = "pval",  # 指定p值列名
                                eaf_col = "af_alt")  # 指定效应等位基因频率列名

# 保存结局数据到CSV文件
write.csv(outcomeData, file = "outcome.csv", row.names = FALSE)  # 输出结局数据到CSV文件

# 将暴露数据和结局数据合并
outcomeData$outcome = outcomeName  # 添加结局名称
dat = harmonise_data(exposure_dat, outcomeData)  # 合并数据

#将暴露数据和结局数据合并
#outcomeData$outcome=outcomeName
#dat=harmonise_data(exposure_dat, outcomeData)

#输出用于孟德尔随机化的工具变量
outTab=dat[dat$mr_keep=="TRUE",]
write.csv(outTab, file="table.SNP.csv", row.names=F)

#孟德尔随机化分析
mrResult=mr(dat)

#对结果进行OR值的计算
mrTab=generate_odds_ratios(mrResult)
write.csv(mrTab, file="table.MRresult.csv", row.names=F)

#异质性分析
heterTab=mr_heterogeneity(dat)
write.csv(heterTab, file="table.heterogeneity.csv", row.names=F)

#多效性检验
pleioTab=mr_pleiotropy_test(dat)
write.csv(pleioTab, file="table.pleiotropy.csv", row.names=F)

#绘制散点图
pdf(file="pic.scatter_plot.pdf", width=7.5, height=7)
mr_scatter_plot(mrResult, dat)
dev.off()

#森林图
res_single=mr_singlesnp(dat)      #得到每个工具变量对结局的影响
pdf(file="pic.forest.pdf", width=7, height=5.5)
mr_forest_plot(res_single)
dev.off()

#漏斗图
pdf(file="pic.funnel_plot.pdf", width=7, height=6.5)
mr_funnel_plot(singlesnp_results = res_single)
dev.off()

#留一法敏感性分析
pdf(file="pic.leaveoneout.pdf", width=7, height=5.5)
mr_leaveoneout_plot(leaveoneout_results = mr_leaveoneout(dat))
dev.off()


####

