# Bulk RNA-seq decision guide

## Input

Use raw integer counts for edgeR and DESeq2. Do not feed TPM/FPKM into count-based negative-binomial models.

## Model

Start with the experimental unit and contrast. Use `~ group` only when group is the intended comparison and no estimable batch/covariate needs adjustment. Use `~ batch + group` only when the design is supported by the sample layout.

## Method

- edgeR QL: primary count-based test for small designs.
- DESeq2 Wald: sensitivity analysis and signed ranking.
- limma-voom: sensitivity analysis, especially useful when mean-variance modeling is stable.
- camera/fry/ROAST: competitive or rotation-based gene-set tests; keep their hypotheses distinct.

## Reporting

Always report library size, filtering rule, normalization, design matrix, contrast, effect-size threshold, FDR method, software versions, and full result tables.
