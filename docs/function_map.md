# 按科研功能整理整个方法库

这个仓库负责可复用配方；近期论文方法的详细输入契约在 nature-methods-bioinformatics-catalog。

| 科研问题 | 先用什么 | 结果层 | 关联仓库 |
|---|---|---|---|
| 原始 count 是否可用于统计 | R/01_edgeR_ql_template.R、RNA-seq template | sample-level DE、完整结果表 | rnaseq-analysis-template |
| 一组基因是否过度代表 | R/02_ora_enricher_template.R | ORA、背景集和多重校正 | evidence notebook |
| 全基因排序是否支持通路方向 | R/03_gsea_fgsea_template.R | NES、FDR、leading edge | literature workbench |
| 先验网络是否支持 TF activity | R/04_tf_activity_template.R | regulon activity、ortholog audit | research-evidence-notebook |
| 配体/受体或细胞间信号 | 先做配体-受体/通路 baseline，再接近期模型 | 候选机制链 | CRLM/IR 项目 |
| 单细胞变换、feature selection、命运、空间和跨物种 | catalog 的 function map | method-specific output | nature-methods-bioinformatics-catalog |
| 文献如何支持一个机制结论 | literature workbench + evidence notebook | claim、替代解释、验证实验 | research-evidence-notebook |
| 分子结构和 docking | docking workflow | ligand/receptor preparation、pose、MD handoff | ligand-receptor-docking-workflow |

## 统一使用顺序

input audit → baseline → method-specific analysis → sample-level summary → evidence card

每个方法都要保存输入、输出、设计、对比、软件版本、随机种子和限制。人源网络映射到小鼠时，保存 ortholog 表、版本、one-to-many 规则和保留边数；foundation model 还要保存 checkpoint URL、版本、哈希、许可证和 GPU 资源。

## 细胞级输出的统一规则

CellRank、embedding、niche 和细胞比例输出先进入 catalog 的 docs/sample_level_reporting.md（https://github.com/Threezs/nature-methods-bioinformatics-catalog/blob/main/docs/sample_level_reporting.md），按 sample/donor 汇总后才进入条件比较。foundation model manifest 只表示输入和 checkpoint 已记录，不表示模型推理已经完成。
