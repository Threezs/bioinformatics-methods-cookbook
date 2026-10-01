# Recent methods catalog

近期方法的入口和完整字段在 [nature-methods-bioinformatics-catalog](https://github.com/Threezs/nature-methods-bioinformatics-catalog)。

| 分析问题 | 首选入口 | 输入最小契约 | 关键审计 |
|---|---|---|---|
| 单细胞计数变换 | R/01_single_cell_transformations.R | gene × cell raw counts | 变换会改变几何结构和下游距离 |
| HVG、批次感知特征、lineage marker | R/02_feature_selection_benchmark.R | counts + batch/lineage labels | 特征选择要和 integration/query 任务一起评估 |
| 长读长转录本发现/定量 | R/03_bambu_long_read.R | aligned BAM + GTF + genome FASTA | 参考版本、比对参数和新转录本证据 |
| transcript usage / DTU | R/04_satuRn_dtu.R | transcript counts + replicates + tx2gene | 生物学重复、isoform 数量和多重校正 |
| 轨迹、命运、velocity、多视图 | python/01_cellrank2_template.py | h5ad + neighbors/kernel view | 动力学先验和概率输出不能省略 |
| foundation model embedding | python/02_scgpt_embedding_template.py / 03_scFoundation_embedding_template.py | h5ad/counts + pinned checkpoint | 许可、权重哈希、经典基线和 GPU 资源 |
| 空间 niche / context transfer | python/04_nicheformer_template.py | spatial or dissociated data + checkpoint | domain shift、组织平台和外部验证 |
| nascent/mature RNA 动力学 | python/05_monod_template.py | matched nascent and mature counts | 不是常规 DE 或 RNA velocity 的替代品 |
| 跨物种单细胞整合 | python/06_saturn_template.py | species-specific h5ad + protein embeddings | gene/protein coverage、标签质量和跨物种 QC |
| 零样本单细胞 embedding | python/07_uce_manifest.py | h5ad + pinned checkpoint | gene/protein vocabulary、物种元数据和可解释 baseline |

推荐先在 catalog 的 data/mock 上确认输入契约，再把路径和版本写进 config/methods.yml。方法论文中的 benchmark 结果只用于形成候选方案，最终选择要结合自己的物种、样本量、平台、实验单位和独立验证。
