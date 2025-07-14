* ==============================================================================
* PROJECT:		AUTNES Online Panel Study (2017-2024)
* OBJECTIVE:	Data Paper: Design Effect (DEFF)
* AUTHOR:		JP
* DATE: 		2025-07-14
* ==============================================================================

* Paths
global MAIN "INSERT_PATH"
global DATA "$MAIN/data"
global GRAPHS "$MAIN/graphs"

* Settings
set more off

* ------------------------------------------------------------------------------
* Calculating design effects for demographic weights (w*_weightd)
* ------------------------------------------------------------------------------

* Open data file
use "$DATA/10874_da_en_v1_0.dta", clear

* Create empty matrix to hold results
matrix results_d = J(23, 4, .)  // 23 rows, 4 columns (mean, min, max, deff)

* Set up index
local i = 1

foreach var in w1_weightd w2_weightd w3_weightd w4_weightd w5_weightd ///
              w6_weightd w7_weightd w8_weightd w9_weightd w10_weightd ///
              w11_weightd w12_weightd w13_weightd w14_weightd w15_weightd ///
              w16_weightd w17_weightd w18_weightd w19_weightd w20_weightd ///
              w21_weightd w22_weightd w23_weightd {

    quietly summarize `var'
    local mean = r(mean)
    local min  = r(min)
    local max  = r(max)
    local sd   = r(sd)
    local cv   = `sd' / `mean'
    local deff = 1 + (`cv')^2

    * Save to matrix
    matrix results_d[`i',1] = `mean'
    matrix results_d[`i',2] = `min'
    matrix results_d[`i',3] = `max'
    matrix results_d[`i',4] = `deff'

    local ++i
}

* Now summarize across waves
matrix colnames results_d = mean min max deff

* Average, min, max of DEFF across waves
matrix list results_d

* Generate summary statistics of DEFF across waves
svmat results_d, names(col)

* Summarize deff results (w*_weightd)
summarize deff

* ------------------------------------------------------------------------------
* Calculating design effects for demographic weights (w*_weightp)
* ------------------------------------------------------------------------------

* Open data file
use "$DATA/10874_da_en_v1_0.dta", clear

* Create empty matrix to hold results
matrix results_d = J(23, 4, .)  // 23 rows, 4 columns (mean, min, max, deff)

* Set up index
local i = 1

foreach var in w1_weightp w2_weightp w3_weightp w4_weightp w5_weightp ///
              w6_weightp w7_weightp w8_weightp w9_weightp w10_weightp ///
              w11_weightp w12_weightp w13_weightp w14_weightp w15_weightp ///
              w16_weightp w17_weightp w18_weightp w19_weightp w20_weightp ///
              w21_weightp w22_weightp w23_weightp {

    quietly summarize `var'
    local mean = r(mean)
    local min  = r(min)
    local max  = r(max)
    local sd   = r(sd)
    local cv   = `sd' / `mean'
    local deff = 1 + (`cv')^2

    * Save to matrix
    matrix results_d[`i',1] = `mean'
    matrix results_d[`i',2] = `min'
    matrix results_d[`i',3] = `max'
    matrix results_d[`i',4] = `deff'

    local ++i
}

* Now summarize across waves
matrix colnames results_d = mean min max deff

* Average, min, max of DEFF across waves
matrix list results_d

* Generate summary statistics of DEFF across waves
svmat results_d, names(col)

* Summarize deff results (w*_weightp)
summarize deff

* ------------------------------------------------------------------------------
* END OF FILE
* ------------------------------------------------------------------------------
exit
