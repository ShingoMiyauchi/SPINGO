# Visual selection pressure with SPINGO
# Descriptions

Welcome to the Visual Omics Tools (a.k.a. SHINGO-Tool)! Quantifying the evolutionary similarity of multiple species is a challenge. Measuring the similarity of entire genome-wide protein sequences could be misleading due to the varied quality of genomes (i.e., low-quality genomes contain fewer proteins). This approach may only be consistent when closely related species are compared. Also, measuring amino acid changes in protein sequences overlooks synonymous codon substitutions. Therefore, we need a new method that counts nucleotide changes among diverged species. We developed a new pipeline that estimates species similarity at the nucleotide level. To conduct fair comparisons, we used single-copy orthologues of 45 species. We aligned codon sequences based on the alignment of protein sequences, measured nucleotide substitution rates, and calculated dN, dS, and dN/dS ratios. With Selection Pressure Inference of Nucleotides using Gene Orthologues (SPINGO), we can identify orthologous genes under positive and negative selection pressure among numerous species (Bonito et al., 2025).

NOTE 1: SPINGO itself does not produce bioinformatic results. It is a visualisation tool for complex genomic data.

# Methods

Orthologues with aligned protein sequences were identified with OrthoFinder (Emms & Kelly, 2019). Nucleotide sequences (coding region assemblies) were aligned based on protein alignment with the R package orthologr (Drost et al., 2015). Aligned codons were used to calculate nucleotide substitutions, synonymous and non-synonymous rates, dNdS ratio with the model, γ-MYN for substitution corrections using the R package MSAdist (Ullrich 2022; Wang et al., 2009). The calculated dNdS values with statistical significance (p < 0.05) were selected for further analyses. All procedures above were orchestrated and output files were visualised with Selection Pressure Inference of Nucleotide using Gene Orthologues (SPINGO).

NOTE 2: The sequence alignment and dNdS calculation are excluded because they are computationally intensive. A high-performance computing cluster may be required for these calculations. This process is out of scope for this demo. Please consult AI models (e.g., ChatGPT, Copilot) for further assistance. 

# Requirement for R and packages

R Studio, R 4.4.0, MoMAColors 0.0.0.9, MetBrewer 0.2.0, ggpubr 0.6.0, ggplot2 3.5.1, dplyr 1.1.4 

# How to run this demo

    Download INPUT folder
    Start up R Studio by clicking an R script
    Make sure your working directory is in INPUT folder so that R recognises input files.
    Read instructions in the scripts and execute the code (line by line).
    Figures are generated as output in the same folder.

Input files - SPINGO_INPUT.zip

1. 45_Morchella_dNdS_|Cazy|.csv (dNdS values of all vs all species for orthologous CAZymes)
2. 45_Morchella_JGI_Taxonomy.csv (45 Morchella species and taxonomic information) 

# Output files (for busy people)

SPINGO_OUTPUT.zip

SPINGO_OverallStats.jpg (Density heatmaps of dNdS values from all vs all comparisons)

NOTE 3: Raw figures generated may not be aesthetic enough and it may require adjustments and beautification with Adobe Illustrator.

# References

1. Emms DM, Kelly S. OrthoFinder: phylogenetic orthology inference for comparative genomics. Genome Biol. 2019 Nov 14;20(1):238. doi: 10.1186/s13059-019-1832-y. PMID: 31727128; PMCID: PMC6857279.
2. Drost HG, Gabel A, Grosse I, Quint M. Evidence for active maintenance of phylotranscriptomic hourglass patterns in animal and plant embryogenesis. Mol Biol Evol. 2015 May;32(5):1221-31. doi: 10.1093/molbev/msv012. Epub 2015 Jan 27. PMID: 25631928; PMCID: PMC4408408.
3. Ullrich K (2022). MSA2dist: MSA2dist calculates pairwise distances between all sequences of a DNAStringSet or a AAStringSet using a custom score matrix and conducts codon based analysis. https://gitlab.gwdg.de/mpievolbio-it/MSA2dist; https://mpievolbio-it.pages.gwdg.de/MSA2dist/
4. Wang, D.P., Wan, H.L., Zhang, S. and Yu, J. 2009. Gamma-MYN: a new algorithm for estimating Ka and Ks with consideration of variable substitution rates. Biol Direct, 4: 20
