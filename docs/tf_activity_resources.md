# TF activity resource notes

TF activity methods infer regulator activity from the expression of target genes.

- TRRUST mouse: species-matched, but coverage can be limited.
- DoRothEA/CollecTRI human: useful when mapped through orthologs, but the mapping becomes part of the analysis and may lose or duplicate edges.
- ChEA3: enrichment-style evidence from human datasets; treat species translation explicitly.
- VIPER/decoupleR: report the network, confidence tiers, scaling and mapping version.

For STAT3 in mouse, do not infer that a human network contains an equivalent mouse regulator without checking the actual network table. Record the exact regulator ID and retained target set.
