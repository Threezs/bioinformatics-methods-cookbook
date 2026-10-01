# Input: integer count matrix with genes in rows and sample metadata
# Output: DGEList, fitted QL model and contrast table

run_edgeR_ql <- function(counts, metadata, contrast, design_formula = ~ group) {
  stopifnot(all(metadata$sample_id %in% colnames(counts)))
  counts <- counts[, metadata$sample_id, drop = FALSE]
  design <- model.matrix(design_formula, metadata)
  y <- edgeR::DGEList(counts = counts)
  keep <- edgeR::filterByExpr(y, design = design)
  y <- y[keep, , keep.lib.sizes = FALSE]
  y <- edgeR::calcNormFactors(y)
  y <- edgeR::estimateDisp(y, design, robust = TRUE)
  fit <- edgeR::glmQLFit(y, design, robust = TRUE)
  qlf <- edgeR::glmQLFTest(fit, contrast = contrast)
  list(
    dge = y,
    design = design,
    fit = fit,
    test = qlf,
    filtered_genes = rownames(y)
  )
}
