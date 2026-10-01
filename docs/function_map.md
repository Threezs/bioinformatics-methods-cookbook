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


## 新增多模态/状态空间功能

- Mellon：用固定的高维 representation 估计 cell-state density；先做 representation 与邻域敏感性分析，不把密度写成谱系概率。
- MISO：对齐空间组学和图像/特征后再做 multimodal embedding 与 clustering；先检查 spot/cell key 和坐标。
- SCMMIB：把 paired、unpaired、mosaic 任务分开记录，并同时保留 accuracy、robustness、scalability；benchmark 不是万能排名。


## 长读长与 benchmark 分支

- scMultiBench：把 multimodal integration 评估拆成 reduction、batch correction、clustering、classification、imputation、feature selection 和 spatial registration，保留 task-level metrics。
- NaRMBench：把 direct-RNA modification detection 拆成 preprocessing、retraining、evaluation 和 downstream validity；不要把 chemistry-specific performance 外推成普遍修饰机制。

## 蛋白上下文与靶点优先级

PINNACLE 将表达上下文、PPI 网络和 cell-type/tissue 层级放进同一个图表示框架。使用顺序是 `input audit → network/context audit → PPI baseline → PINNACLE manifest/inference → held-out ranking → independent validation`。结果回链到 literature-workbench 的 P017，并明确不能把 target score 写成因果功能或治疗疗效。

## 多模态复杂分支轨迹

PHLOWER 适合多模态 cell ID 已对齐、且问题包含复杂分支树的场景。统一顺序是 `input audit → modality/key audit → root/direction audit → CellRank/graph baseline → PHLOWER → branch stability → independent validation`。结果回链到 literature-workbench 的 P018，不能把无向 embedding 或 regulator score升级成谱系和因果结论。
## 空间数据基础设施

SpatialData 不是一个自动完成生物学推断的模型，而是进入空间分析前的互操作层。统一顺序是 `input audit → element/coordinate/unit audit → platform-native QC → SpatialData read/write → Nicheformer/MISO 或邻域分析 → independent validation`。先记录 table/image/labels/shapes/points、坐标变换和存储格式；成功读写不等于 segmentation、registration 或空间信号已经正确。
