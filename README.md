# Bioinformatics Methods Cookbook

这里集中保存可以在多个科研项目之间复用的 R/Python 分析配方。每个配方都包含输入约定、输出约定和需要记录的参数，避免从旧项目复制一段无法解释的代码。

## 方法索引

~~~text
R/01_edgeR_ql_template.R       raw count → filterByExpr → edgeR QL
R/02_ora_enricher_template.R   gene list + universe → clusterProfiler ORA
R/03_gsea_fgsea_template.R     signed statistic → fgseaMultilevel
R/04_tf_activity_template.R    regulon activity and ortholog audit
R/theme_publication.R           统一 ggplot 主题和输出尺寸
python/validate_count_matrix.py count matrix 结构检查
docs/recent_methods_catalog.md  Nature Methods 近期方法选型地图\ndocs/function_map.md            按科研功能连接 bulk、单细胞、文献和对接
docs/                           方法选择和解释边界
templates/script_header.R       分析脚本头部模板
~~~

近期单细胞、长读长和 foundation model 方法的入口集中维护在 [nature-methods-bioinformatics-catalog](https://github.com/Threezs/nature-methods-bioinformatics-catalog)。其中 R 入口优先；Python 入口明确区分 runtime-required 和 manifest-only，不把配置生成误写成模型推理。

## 使用原则

- 先写输入、输出、设计、对比和软件版本，再运行代码。
- 可复用函数放在这里；具体项目的路径和参数放在项目自己的 config/。
- 统计方法不能只靠“显著基因数量”评价，必须保留完整结果和 QC。
- ORA 与 GSEA 是不同问题：前者依赖阈值和背景，后者利用全基因排序。
- PROGENy、GSVA、VIPER 和 decoupleR 输出的是表达 footprint 推断，不应直接写成蛋白磷酸化实测。
- 人源网络映射到小鼠时，保存 ortholog 表、版本、one-to-many 规则和保留边数。
- foundation model 的 checkpoint、许可证、版本、哈希、GPU 和基线比较必须单独记录。

## 与现有工作衔接

- [RNA_pipeline](https://github.com/Threezs/RNA_pipeline)：上游 Snakemake/GEO 处理。
- [rnaseq-analysis-template](https://github.com/Threezs/rnaseq-analysis-template)：完整的 bulk RNA-seq 项目骨架。
- [bioinformatics-literature-workbench](https://github.com/Threezs/bioinformatics-literature-workbench)：论文、阅读笔记和逐条证据。
- [nature-methods-bioinformatics-catalog](https://github.com/Threezs/nature-methods-bioinformatics-catalog)：近期方法、官方代码和 turnkey 入口。
- [network-pharmacology-target-acquisition](https://github.com/Threezs/network-pharmacology-target-acquisition)：网络药理学项目结构。
- [ligand-receptor-docking-workflow](https://github.com/Threezs/ligand-receptor-docking-workflow)：分子对接处理流程。

## 参考

- [Bioconductor](https://www.bioconductor.org/)
- [edgeR](https://bioconductor.org/packages/edgeR/)
- [clusterProfiler](https://bioconductor.org/packages/clusterProfiler/)
- [fgsea](https://bioconductor.org/packages/fgsea/)
- [decoupleR](https://saezlab.github.io/decoupleR/)
- [ropensci/targets](https://github.com/ropensci/targets)
