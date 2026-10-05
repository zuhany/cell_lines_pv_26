# Molecular States and Drug Sensitivities Associated with Gene Expression Changes in Recurrent Glioblastoma
This project investigates transcriptional changes associated with glioblastoma recurrence and their relationship with pharmacological vulnerabilities. Paired primary and first-recurrence tumour samples from the Glioma Longitudinal Analysis Consortium (GLASS) were used to derive a recurrence-associated gene-expression signature and Recurrence Score. The signature was subsequently applied to glioma cell lines using Cancer Dependency Map (DepMap) RNA-seq data and integrated with drug-response data from the Profiling Relative Inhibition Simultaneously in Mixtures (PRISM) database. Pharmacogenomic findings were independently validated using GDSC, CTD², and CTRPv2.

## Analysis workflow

```text
GLASS
  │
  ├── Paired primary and first-recurrence samples
  │
  ├── Differential gene expression
  │
  ├── Recurrence-associated gene-expression signature
  │
  └── GLASS-derived Recurrence Score
          │
          ▼
      DepMap RNA-seq
          │
          └── Recurrence Score in glioma cell lines
                  │
                  ▼
              PRISM
                  │
                  └── Pharmacological vulnerability analysis
                          │
                          ├──────────────┐
                          │              │
                          ▼              ▼
                        GDSC           CTD²
                          │              │
                          └──────┬───────┘
                                 │
                                 ▼
                              CTRPv2
                                 │
                                 └── Independent pharmacogenomic
                                     class-level validation

DepMap CRISPR Gene Effect
          │
          └── Orthogonal genetic dependency analysis

GSE186332
          │
          └── Clinical analysis of selinexor
```

## Main datasets
* **GLASS** — paired primary and first-recurrence glioblastoma tumour samples
* **DepMap** — RNA-seq expression and CRISPR Gene Effect data from cancer cell lines
* **PRISM** — drug dose-response data for pharmacological vulnerability screening
* **GDSC** — independent pharmacogenomic validation
* **CTD²** — independent pharmacogenomic validation
* **CTRPv2** — independent pharmacogenomic validation
* **GSE186332** — clinical RNA-seq and treatment-response data for selinexor analysis

## Documentation
The main analysis is documented in:
`notebooks/GLASS.ipynb`
Additional analyses and results are organised in the corresponding notebooks, results, and data directories.

## Reference
GLASS:  
**The GLASS Consortium. (2018). Glioma through the looking GLASS: Molecular evolution of diffuse gliomas and the Glioma Longitudinal Analysis Consortium.** *Neuro-Oncology*, 20(7), **873–884**. 
https://doi.org/10.1093/neuonc/noy020  
**Varn, F. S. et al. (2022). Glioma progression is shaped by genetic evolution and microenvironment interactions.** *Cell*, 185(12), **2184–2199.e16**.
https://doi.org/10.1016/j.cell.2022.04.038  

DepMap 26Q1  
**DepMap, Broad (2026). DepMap Public 26Q1.** Dataset. depmap.org  

PRISM  
**Corsello, S. M. et al. (2019). Non-oncology drugs are a source of previously unappreciated anti-cancer activity** (p. 730119). *bioRxiv*. 
https://doi.org/10.1101/730119  

GDSC:  
**Iorio, F. et al. (2016). A Landscape of Pharmacogenomic Interactions in Cancer.** *Cell*, 166(3), **740–754**. 
https://doi.org/10.1016/j.cell.2016.06.017  
**Picco, G. et al. (2019). Functional linkage of gene fusions to cancer cell fitness assessed by pharmacological and CRISPR-Cas9 screening.** *Nature Communications*, 10(1), **2198**. 
https://doi.org/10.1038/s41467-019-09940-1  

CTD²:  
**Seashore-Ludlow, B. et al. (2015). Harnessing Connectivity in a Large-Scale Small-Molecule Sensitivity Dataset.** *Cancer Discovery*, 5(11), **1210–1223**. 
https://doi.org/10.1158/2159-8290.CD-15-0235  
**Rees, M. G. et al. (2016). Correlating chemical sensitivity and basal gene expression reveals mechanism of action.** *Nature Chemical Biology*, 12(2), **109–116**. 
https://doi.org/10.1038/nchembio.1986  

CTRPv2:  
**Basu, A. et al. (2013). An interactive resource to identify cancer genetic and lineage dependencies targeted by small molecules.** *Cell*, 154(5), **1151–1161**. 
https://doi.org/10.1016/j.cell.2013.08.003  

GSE186332  
**Lassman, A. B. et al. (2022). A Phase II Study of the Efficacy and Safety of Oral Selinexor in Recurrent Glioblastoma.** *Clinical cancer research : an official journal of the American Association for Cancer Research*, 28(3), **452–460**. 
https://doi.org/10.1158/1078-0432.CCR-21-2225

## Project structure

```text
cell_lines_pv_26/
├── data/
│   ├── raw/
│   │   ├── annotation/
│   │   ├── difg_glass/
│   │   ├── expression/
│   │   ├── sensitivity/
│   │   └── difg_glass.tar.tar
│   └── processed/
├── documents/
├── figures/
├── notebooks/
├── references/
├── results/
│   ├── differential_expression/
│   ├── GSEA/
│   ├── qc/
│   └── recurrence/
├── README.md
├── .gitattributes
└── .gitignore
```
