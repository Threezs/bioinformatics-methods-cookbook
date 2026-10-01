theme_research <- function(base_size = 9, base_family = "Arial") {
  ggplot2::theme_classic(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", hjust = 0),
      axis.title = ggplot2::element_text(color = "black"),
      axis.text = ggplot2::element_text(color = "black"),
      legend.title = ggplot2::element_text(face = "bold"),
      panel.border = ggplot2::element_rect(fill = NA, color = "black", linewidth = 0.4)
    )
}

save_research_figure <- function(plot, path, width = 7, height = 5, dpi = 600) {
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  ggplot2::ggsave(path, plot = plot, width = width, height = height, dpi = dpi)
}
