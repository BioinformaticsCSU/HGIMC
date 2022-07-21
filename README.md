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
* ```fBMC.m```: this function can implement the bounded matrix completion algorithm;
* ```fGRB.m```: this function can implement the Gaussian radial basis function;
* ```fHGI.m```: this function can implement the heterogeneous graph inference algorithm;
* ```fNorm.m```: this function can normalize the similarity matrix;
* ```svt.m```: this function can implement singular value thresholding operator.

# Instructions
We provide detailed step-by-step instructions for running HGIMC model.

**Step 1**: add datasets\functions paths
```
addpath('Datasets');
addpath('Functions');
```
**Step 2**: load datasets with association matirx and similarity matrices
```
load Fdataset_ms
A_DR = didr;
R = (drug_ChemS+drug_AtcS+drug_SideS+drug_DDIS+drug_TargetS)/5;
D = (disease_PhS+disease_DoS)/2;
```
**Step 3**: parameter Settings

The hyper-parameters are fixed.
```
alpha = 10; 
beta = 10; 
gamma = 0.1; 
threshold = 0.1;
maxiter = 300; 
tol1 = 2*1e-3;   
tol2 = 1*1e-5;
```
**Step 4**: run the bounded matrix completion (BMC)
```
trIndex = double(A_DR ~= 0);
[A_bmc, iter] = fBMC(alpha, beta, A_DR, trIndex, tol1, tol2, maxiter, 0, 1);
A_DR0 = A_bmc.*double(A_bmc > threshold);
```
**Step 5**: run Gaussian Radial Basis function (GRB)
```
A_RR = fGRB(R, 0.5);
A_DD = fGRB(D, 0.5);
```
**Step 5**: run the heterogeneous graph based inference (HGBI)
```
A_recovery = fHGI(gamma, A_DD, A_RR, A_DR0);
```

# A Quickstart Guide
Users can immediately start playing with HGIMC running ```Demo_HGIMC.m``` in matlab.
* ```Demo_HGIMC.m```: it demonstrates a process of predicting drug-disease associations on the gold standard dataset (Fdataset_ms) by HGIMC algorithm.

# Run HGIMC on User's Own Data
We provided instructions on implementing HGIMC model with user's own data. One could directly run HGIMC model in ```Demo_HGIMC.m``` with custom data by the following instructions.

**Step 1**: Prepare your own data and add into the ```Datasets``` folder

The required data includes drug-disease association matirx and similarity matrices, which are all saved by ```mat``` files.

**Step 2**: Modify four lines in ```Demo_HGIMC.m```

You can find ```Fdataset_ms, A_DR, R, D``` in ```Demo_HGIMC.m```. All you need to do is to replace them with your own data.

# Docker Image Link of HGIMC

https://hub.docker.com/repository/docker/yangmy84/hgimc

# Contact
If you have any questions or suggestions with the code, please let us know. 
Contact Mengyun Yang at mengyun_yang@126.com

# Citation
Yang M, Huang L, Xu Y, et al. Heterogeneous graph inference with matrix completion for computational drug repositioning[J]. Bioinformatics, 2020, 36(22-23): 5456-5464.
```
@article{yang2020heterogeneous,
  title={Heterogeneous graph inference with matrix completion for computational drug repositioning},
  author={Yang, Mengyun and Huang, Lan and Xu, Yunpei and Lu, Chengqian and Wang, Jianxin},
  journal={Bioinformatics},
  volume={36},
  number={22-23},
  pages={5456--5464},
  year={2020},
  publisher={Oxford University Press}
}
```
