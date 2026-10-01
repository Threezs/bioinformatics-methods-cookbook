# Recent methods catalog

近期方法的完整字段、输入契约和执行状态在 [nature-methods-bioinformatics-catalog](https://github.com/Threezs/nature-methods-bioinformatics-catalog)。

| 功能 | 首选入口 | 最小输入 | 当前状态 | 关键审计 |
|---|---|---|---|---|
| 输入审计 | R/00_input_audit.R / python/00_input_audit.py | count/metadata 或 AnnData 路径 | smoke-tested | 行列方向、ID 顺序、sample/donor、batch |
| 单细胞表达变换 | R/01_single_cell_transformations.R | gene × cell raw counts | baseline-function | 变换会改变几何结构和下游距离 |
| 特征排序和正式 HVG | R/02_feature_selection_benchmark.R | counts + batch/labels | baseline + optional scran | 默认是透明 variance ranking；不要写成 replicate-aware DE |
| 长读长转录本发现/定量 | R/03_bambu_long_read.R | genome-aligned BAM + GTF + genome FASTA | reference-required | genome/reference 是否一致 |
| transcript usage / DTU | R/04_satuRn_dtu.R | transcript counts + replicates + tx2gene | transcript-input-required | biological replicate、isoform 数量和多重校正 |
| 轨迹、命运、velocity、多视图 | python/01_cellrank2_template.py | h5ad + kNN + time/velocity layer | runtime-required | fate 输出要按 sample/donor 汇总 |
| 细胞状态密度和时间连续化 | python/09_mellon_template.py | cell representation + optional time metadata | manifest-only | 固定 representation；density 不是 lineage probability |
| foundation model embedding | python/02–03 | h5ad/counts + pinned checkpoint | manifest-only | 许可、权重哈希、经典基线和 GPU 资源 |
| PINNACLE 蛋白上下文与靶点优先级 | python/14_pinnacle_manifest.py | expression + PPI network + context metadata | manifest-only | 网络版本、上下文标签、checkpoint 和 held-out 排序指标 |
| 空间 niche/context transfer | python/04_nicheformer_template.py | spatial/context data + checkpoint | manifest-only | domain shift、切片/患者和外部验证 |
| 多模态空间组学整合 | python/10_miso_manifest.py | aligned spatial modalities + optional image features | manifest-only | shared spot/cell key、坐标和 Python 3.7/Git-LFS |
| 多模态整合 benchmark | python/11_scmmib_manifest.py | paired/unpaired/mosaic dataset manifest | manifest-only | ranking 依赖 task、modality 和 metric |
| 多任务多模态整合 benchmark | python/12_scmultibench_manifest.py | dataset manifest + selected tasks | manifest-only | task、modality、split 和任务级指标 |
| nanopore RNA 修饰检测 benchmark | python/13_narmbench_manifest.py | direct-RNA reads + reference + chemistry | manifest-only | RNA002/RNA004、ground truth、retraining、site-level calibration |
| nascent/mature RNA 动力学 | python/05_monod_template.py | matched counts + official config | manifest-only | 不是常规 DE 或 RNA velocity 替代品 |
| 跨物种单细胞整合 | python/06_saturn_template.py | species-specific h5ad + protein embeddings | manifest-only | gene/protein coverage、标签质量和跨物种 QC |
| 零样本单细胞 embedding | python/07_uce_manifest.py | h5ad + pinned checkpoint | manifest-only | vocabulary、物种元数据和可解释 baseline |

选择顺序、样本级汇总和解释边界见 catalog 的 [docs/function_map.md](https://github.com/Threezs/nature-methods-bioinformatics-catalog/blob/main/docs/function_map.md) 和 [docs/sample_level_reporting.md](https://github.com/Threezs/nature-methods-bioinformatics-catalog/blob/main/docs/sample_level_reporting.md)。方法论文中的 benchmark 结果只用于形成候选方案，最终选择要结合自己的物种、样本量、平台、实验单位和独立验证。

Mellon、MISO 和 SCMMIB 目前只生成 manifest；manifest 校验表示输入契约已经记录，不表示官方模型或 benchmark 已经完成复现。
