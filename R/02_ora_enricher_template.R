run_enricher_ora <- function(gene_ids, universe, term2gene, term2name = NULL) {
  # Keep the universe equal to genes that passed expression filtering.
  clusterProfiler::enricher(
    gene = unique(gene_ids),
    universe = unique(universe),
    TERM2GENE = term2gene,
    TERM2NAME = term2name,
    pAdjustMethod = "BH",
    pvalueCutoff = 0.05,
    qvalueCutoff = 0.2,
    minGSSize = 10,
    maxGSSize = 500
  )
}

split_direction <- function(de_table, lfc_col = "logFC", fdr_col = "FDR",
                            lfc_cutoff = 1, fdr_cutoff = 0.05) {
  list(
    up = subset(de_table, de_table[[lfc_col]] >= lfc_cutoff & de_table[[fdr_col]] <= fdr_cutoff),
    down = subset(de_table, de_table[[lfc_col]] <= -lfc_cutoff & de_table[[fdr_col]] <= fdr_cutoff)
  )
}
