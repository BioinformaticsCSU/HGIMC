# HGIMC
Inspired by the low-rank completion of BNNR and the guilt-by-association principle of HGBI, we propose a heterogeneous graph inference with matrix completion (HGIMC) method to predict potential indications for drugs. 

# Requirements
* Matlab >= 2014

# Dataset Description
Wrname: the DrugBank IDs of drugs;

Wdname: the OMIM IDs of diseases;

drug_ChemS: chemical structure similarity matrix;

drug_AtcS: drug's ATC code similarity matrix;

drug_SideS: side-effect similarity matrix;

drug_DDIS: drug-drug interaction similarity matrix;

drug_TargetS: drug's target profile similarity matrix;

disease_PhS: disease phenotype similarity matrix;

disease_DoS: disease ontology similarity matrix;

didr: disease-drug association matrix.

# Description
"Demo_HGIMC.m" demonstrates the experimental result on Fdataset_ms by HGIMC algorithm.

# Contact:
If you have any questions or suggestions with the code, please let us know. 
Contact Mengyun Yang at mengyunyang@csu.edu.cn
