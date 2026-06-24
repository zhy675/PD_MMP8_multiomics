# Analysis scripts for: Matrix metalloproteinase-8 as a potential therapeutic target in Parkinson's disease

This repository contains all analysis scripts used in the multi-omics integration study for MMP8 in Parkinson's disease.

## 

PD\_MMP8\_multimonics/

├── README.md

├── scripts/

│   ├── MR.R

│   ├── MROmics\_GO.R

│   ├── MROmics\_KEGG.R

│   └── MROmics\_drugEnrich.R

├── results/

│   ├── GO.txt

│   ├── KEGG.txt

│   └── DRUG.enrich.xls

├── docking/

│   ├── MMP8-ALDOSTERONE.log

│   ├── MMP8-ALDOSTERONE.zip

│   ├── MMP8-Medroxyprogesteroneacetate.log

│   └── MMP8-Medroxyprogesteroneacetate.zip

└── openbabel\_work.zipNotes on PPI network analysis

**NOTE:** The protein-protein interaction (PPI) network was constructed directly using the STRING database (v12.0) web interface (https://string-db.org) with a minimum required interaction score of 0.7 (high confidence). The network was exported and visualized in Cytoscape (v3.10.3), and hub genes were identified using the CytoHubba plugin (v0.1) with the Maximal Clique Centrality (MCC) algorithm.

## Requirements

* R version 4.3.3 or higher
* TwoSampleMR v0.5.8
* clusterProfiler v4.10.1
* STRING database v12.0 (web interface)
* Cytoscape v3.10.3 (with CytoHubba v0.1)
* AutoDock Vina (default version, distributed with MGLTools 1.5.6)
* GROMACS 2022

## Contact

Corresponding author: Hongyuan Zhang(18113619057@163.com)

