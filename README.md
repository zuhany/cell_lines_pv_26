# Molecular States and Drug Sensitivities Associated with Gene Expression Changes in Recurrent Glioblastoma

This project investigates gene expression changes associated with glioblastoma
recurrence using paired primary and first-recurrence samples from the GLASS
cohort.
Documentation: notebooks/GLASS.ipynb:

The analysis includes:

1. **Cohort selection and data exploration**
2. **Gene expression processing and quality control**
3. **Paired primary–recurrence differential expression analysis**
4. **Pathway analysis using Hallmark and Reactome gene sets**
5. **Development of a recurrence-associated gene signature**
6. **Evaluation of the Recurrence Score**

## Reference

**Varn, F. S. et al. (2022). Glioma progression is shaped by genetic evolution and microenvironment interactions.** _Cell_, 185(12), **2184-2199.e16**. https://doi.org/10.1016/j.cell.2022.04.038

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