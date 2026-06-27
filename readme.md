# Analysis scripts for: Matrix metalloproteinase-8 as a potential therapeutic target in Parkinson's disease

This repository contains all analysis scripts used in the multi-omics integration study for MMP8 in Parkinson's disease.

## 

## Repository Structure

PD\_MMP8\_multiomics/

│

├── README.md

│

├── scripts/

│   ├── MR.R                      # Main R script for two‑sample MR analyses

│   ├── MROmics\_GO.R              # GO enrichment analysis using clusterProfiler

│   ├── MROmics\_KEGG.R            # KEGG pathway enrichment analysis

│   └── MROmics\_drugEnrich.R      # Drug‑gene enrichment analysis using DSigDB

│

├── results/

│   ├── MR.zip                    # Complete MR outputs (IVW, sensitivity tests)

│   ├── GO.txt                    # Full GO enrichment results

│   ├── KEGG.txt                  # Full KEGG pathway enrichment results

│   └── DRUG.enrich.xls           # DSigDB drug‑gene enrichment results

│

└── docking/

&#x20;   ├── MMP8-ALDOSTERONE.log                 # Docking log for aldosterone

&#x20;   ├── MMP8-ALDOSTERONE.zip                 # Docking poses for aldosterone

&#x20;   ├── MMP8-Medroxyprogesteroneacetate.log  # Docking log for medroxyprogesterone acetate

&#x20;   ├── MMP8-Medroxyprogesteroneacetate.zip  # Docking poses for medroxyprogesterone acetate

&#x20;   └── openbabel\_work.zip                   # Ligand preparation files



**NOTE:** The protein‑protein interaction (PPI) network was constructed directly using the STRING database (v12.0) web interface (https://string-db.org) with a minimum required interaction score of 0.7 (high confidence). The network was exported and visualized in Cytoscape (v3.10.3), and hub genes were identified using the CytoHubba plugin (v0.1) with the Maximal Clique Centrality (MCC) algorithm.



Single‑cell transcriptomic data were obtained from PanglaoDB (SRA: SRA866994; sample: SRS4545963). Due to file size constraints, the single‑cell expression matrix files are not included in this repository but can be accessed directly from PanglaoDB.



## Requirements

* R version 4.3.3 or higher
* TwoSampleMR v0.5.8
* clusterProfiler v4.10.1
* STRING database v12.0 (web interface)
* Cytoscape v3.10.3 (with CytoHubba v0.1)
* AutoDock Vina (default version, distributed with MGLTools 1.5.6)
* GROMACS 2022



## Data Sources

* Plasma proteome GWAS ──deCODE Genetics (n = 35,559)
* PD GWAS──FinnGen biobank, Release 10 (4,681 cases / 407,500 controls)
* Single‑cell data──PanglaoDB (SRA: SRA866994; sample: SRS4545963)



## Contact

For questions regarding the analysis scripts or data, please contact the corresponding author as listed in the manuscript.



## License

This repository is provided for transparency and reproducibility purposes. Please refer to the manuscript for full details and appropriate citation.

