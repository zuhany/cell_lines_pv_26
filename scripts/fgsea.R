# --------------------------------------------------
# Load packages
# --------------------------------------------------

library(openxlsx)
library(fgsea)


# --------------------------------------------------
# Settings
# --------------------------------------------------

RANKED_FILE <- "./data/processed/rnk.csv"

HALLMARK_FILE <- "./data/processed/hallmark_2020.gmt"
REACTOME_FILE <- "./data/processed/reactome_2022.gmt"

HALLMARK_OUTPUT <- "./results/GSEA/glass_GSEA_Hallmark.xlsx"
REACTOME_OUTPUT <- "./results/GSEA/glass_GSEA_Reactome.xlsx"


# --------------------------------------------------
# Load ranked gene list
# --------------------------------------------------

rnk_df <- read.delim(
  RANKED_FILE,
  header = TRUE,
  stringsAsFactors = FALSE
)

ranks <- rnk_df$T_STATISTIC
names(ranks) <- rnk_df$GENE

valid <- !is.na(ranks) &
         !is.na(names(ranks)) &
         names(ranks) != ""

ranks <- ranks[valid]
ranks <- ranks[!duplicated(names(ranks))]
ranks <- sort(ranks, decreasing = TRUE)


# --------------------------------------------------
# Check ranked list
# --------------------------------------------------

cat("Number of ranked genes:", length(ranks), "\n")

cat("Top genes:\n")
print(head(ranks))


# --------------------------------------------------
# GSEA helper function
# --------------------------------------------------

run_gsea <- function(ranks, gmt_file) {

  pathways <- gmtPathways(gmt_file)

  cat("\nGene-set file:", gmt_file, "\n")
  cat("Number of pathways:", length(pathways), "\n")

  results <- fgseaMultilevel(
    pathways = pathways,
    stats = ranks
  )

  results <- results[
    order(results$padj),
    c("pathway", "NES", "pval", "padj")
  ]

  names(results) <- c(
    "PATHWAY",
    "NES",
    "NOMINAL_P",
    "FDR"
  )

  return(results)
}


# --------------------------------------------------
# Hallmark GSEA
# --------------------------------------------------

cat("\nRunning Hallmark GSEA...\n")

hallmark_res <- run_gsea(
  ranks = ranks,
  gmt_file = HALLMARK_FILE
)

write.xlsx(
  hallmark_res,
  HALLMARK_OUTPUT,
  rowNames = FALSE
)

cat(
  "\nHallmark results saved to:",
  HALLMARK_OUTPUT,
  "\n"
)

print(head(hallmark_res))


# --------------------------------------------------
# Reactome GSEA
# --------------------------------------------------

cat("\nRunning Reactome GSEA...\n")

reactome_res <- run_gsea(
  ranks = ranks,
  gmt_file = REACTOME_FILE
)

write.xlsx(
  reactome_res,
  REACTOME_OUTPUT,
  rowNames = FALSE
)

cat(
  "\nReactome results saved to:",
  REACTOME_OUTPUT,
  "\n"
)

print(head(reactome_res))