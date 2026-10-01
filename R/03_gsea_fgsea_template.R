make_signed_stats <- function(de_table, gene_col = "gene_id", stat_col = "stat") {
  x <- de_table[[stat_col]]
  names(x) <- de_table[[gene_col]]
  x <- x[is.finite(x) & !is.na(names(x)) & names(x) != ""]
  x <- x[!duplicated(names(x))]
  sort(x, decreasing = TRUE)
}

run_fgsea_multilevel <- function(stats, pathways, min_size = 10, max_size = 500) {
  fgsea::fgseaMultilevel(
    pathways = pathways,
    stats = stats,
    minSize = min_size,
    maxSize = max_size,
    eps = 0
  )
}
