# singleCellGRNAnalysisModeling
The aims of this project are:  
1. Infer from single cell genomics data gene regulatory network (GRN) topologies involving cross regulatory interactions between
transcription factors (TFs).
2. Uncover a higher-level regulatory organization of TFs beyond regulons, which embody complex design principles and
dynamical behaviors.
3. Interrogate the repertoire of dynamic behaviors realizable by the inferred TF-TF network topologies based on systems biology-oriented network modeling techniques (e.g. Boolean/ODE network modeling).
4. Based on the extracted knowledge suggest potential new experiments aimed toward the elucidation of candidate systems-level molecular mechanisms underlying robust cell type specification, gene expression heterogeneity within cell populations, as well as regulatory divergence between homologous cell types.

The data analyzed was downloaded as a loom file from the data base [Scope](https://github.com/aertslab/SCope). Here I focused on the data reported in: [A single-cell transcriptome atlas of the ageing Drosophila brain](https://www.cell.com/cell/fulltext/S0092-8674(18)30720-7?_ga=2.184157922.514952307.1529625600-1425723436.1529625600). The data set encompass ~57k cells. Boolean network modeling is used as a first approximation to gain intuition on the possible repertoire of dynamic behaviors that the inferred GRNs can exhibit.
