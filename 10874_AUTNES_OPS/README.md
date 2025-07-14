### README

#### **Project Overview**
This repository contains three Stata `.do` scripts:

1. **`10874_RMSE.do`** - A script to compute the Root Mean Squared Error (RMSE) 
2. **`10874_DEFF.do`** - A script to compute the Design Effect (DEFF)
3. **`10874_PANELPART.do`** - A script to describe and analyze panel participation and its effects of response behavior

It also includes four datasets (.dta format) with target values drawn from the Austrian Microcensus and the election results provided by the Austrian Ministry of the Interior (BMI).


#### **Dataset Requirement**
The dataset of the AUTNES Online Panel Study 2017-2024 is available from AUSSDA as Scientific Use File and must be placed in the `data` folder (see below):

Partheymüller, Julia; Aichholzer, Julian; Kritzinger, Sylvia; Wagner, Markus; Plescia, Carolina; Eberl, Jakob-Moritz; Meyer, Thomas; Boomgaarden, Hajo; Müller, Wolfgang C. (2024). **"AUTNES Online Panel Study 2017-2024 (SUF edition)"** [DOI: 10.11587/HNUFCC](https://doi.org/10.11587/HNUFCC), AUSSDA, V1, UNF:6:fPul6K0EtB3CEhJNCLaVqg== [fileUNF]


#### **Required Folder Structure**
To run the scripts the following folder structure is needed:
```
/project-root
│── data/           # Contains datasets
│   └── 10874_da_en_v1_0.dta
│   └── targets_2017.dta
│   └── targets_2019.dta
│   └── targets_2022.dta
│   └── targets_2024.dta
│── graphs/         # Stores generated graphs
│── scripts/        # Contains Stata `.do` scripts
│   ├── 10874_RMSE.do
│   ├── 10874_DEFF.do
│   ├── 10874_PANELPART.do
│── tables/         # Stores generated tables
│── README.md       # Project documentation
```


#### **Further Requirements**
- Stata installed on your system.
- Proper dataset(s) available in the `data` folder.
- Insert your path to main directory in each of the scripts.


#### **File Descriptions**
- **`10874_RMSE.do`**  
  - **Purpose:** Computes RMSE or performs model validation.
  - **Dependencies:** Requires Stata and input dataset from the `data` folder.
  - **Output:** A dataset containing RMSE values and a line graph visualizing those values.
  
- **`10874_DEFF.do`**  
  - **Purpose:** Computes the Design Effect (DEFF) of weighting variables.
  - **Dependencies:** Requires Stata and input dataset from the `data` folder.
  - **Output:** A matrix containing DEFF values for all waves and summary statistics.

- **`10874_PANELPART.do`**  
  - **Purpose:** Describes panel participation and its determinants
  - **Dependencies:** Requires Stata and input dataset from the `data` folder.
  - **Output:** A stacked bar chart showing the number of interviews by entry wave, a linear regression analysis of participation across waves, and a coefficient plot visualizing key predictors.


#### **Author & License**
- **Author:** JP
- **License:** MIT

