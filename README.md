# HGIMC
Inspired by the low-rank completion of BNNR and the guilt-by-association principle of HGBI, we propose a heterogeneous graph inference with matrix completion (HGIMC) method to predict potential indications for drugs. The novelty of HGIMC method is improving the HGBI algorithm from two perspectives. The one is enriching the sparse heterogeneous association network by the bounded matrix completion (BMC). The BMC can add some strong drug-disease associations without any prior similarity, which can provide more reliable paths for the graph inference. The other one is enhancing similarity measures by the Gaussian radial basis function (GRB). The GRB can compute a comprehensive measure based on the row/column vectors of similarity matrix for the graph inference. It plays an important role in identifying potential associations for new nodes.

# Requirements
* Matlab >= 2014

# Installation
HGIMC can be downloaded by
```
git clone https://github.com/BioinformaticsCSU/HGIMC
```
Installation has been tested in a Windows platform.

# Dataset Description
* Wrname: the DrugBank IDs of drugs;
* Wdname: the OMIM IDs of diseases;
* drug_ChemS: chemical structure similarity matrix;
* drug_AtcS: drug's ATC code similarity matrix;
* drug_SideS: side-effect similarity matrix;
* drug_DDIS: drug-drug interaction similarity matrix;
* drug_TargetS: drug's target profile similarity matrix;
* disease_PhS: disease phenotype similarity matrix;
* disease_DoS: disease ontology similarity matrix;
* didr: disease-drug association matrix.

# Functions Description
* fBMC.m: this function can implement the bounded matrix completion algorithm;
* fGRB.m: this function can implement the Gaussian radial basis function;
* fHGI.m: this function can implement the heterogeneous graph inference algorithm;
* fNorm.m: this function can normalize the similarity matrix;
* svt.m: this function can implement singular value thresholding operator.

# A Quickstart Guide
Users can immediately start playing with HGIMC with 'Demo_HGIMC.m'.
* Demo_HGIMC.m: it demonstrates a experimental result on the gold standard dataset (Fdataset_ms) by HGIMC algorithm.

# Run HGIMC on your own data

hyper-parameters: alpha=10, beta=10, the threshold=0.1, and gamma=0.1.



# Contact:
If you have any questions or suggestions with the code, please let us know. 
Contact Mengyun Yang at mengyunyang@csu.edu.cn
