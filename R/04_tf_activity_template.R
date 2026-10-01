audit_regulon <- function(regulon, source_col = "source", target_col = "target",
                          weight_col = "mor", mapping = NULL) {
  stopifnot(all(c(source_col, target_col, weight_col) %in% names(regulon)))
  out <- regulon
  if (!is.null(mapping)) {
    out <- merge(out, mapping, by.x = target_col, by.y = "source_gene",
                 all = FALSE)
  }
  list(
    n_interactions = nrow(out),
    n_regulators = length(unique(out[[source_col]])),
    n_targets = length(unique(out[[target_col]])),
    regulon = out
  )
}

# Record whether a network is mouse native or human-to-mouse mapped.
# Do not compare activity values from differently scaled networks without stating it.
