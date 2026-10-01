# ORA versus GSEA

## ORA

ORA asks whether a thresholded gene list contains more genes from a set than expected under a stated universe. The universe must be the genes that had a chance to be selected, usually the filtered expressed genes.

## GSEA

GSEA uses a signed ranking over all tested genes. It avoids throwing away moderately changed genes but depends on a defensible ranking statistic and gene-set definition.

## Practical rule

Use ORA for a small, high-confidence list and GSEA for the complete ranked result. Present up/down ORA separately and do not reuse the whole genome as the ORA background by default.
