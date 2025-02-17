* ==============================================================================
* PROJECT:		AUTNES Online Panel Study (2017-2024)
* OBJECTIVE:		Data Paper: Accuracy (RMSE)
* AUTHOR:		JP
* DATE: 		2025-02-17
* ==============================================================================

* Paths
global MAIN "INSERT_PATH"
global DATA "$MAIN/data"
global GRAPHS "$MAIN/graphs"

* Install required packages
* ssc install fre, replace		// Optional: To display frequency tables

* Settings
set more off

* Open data file
use "$DATA/10874_da_en_v1_0.dta", clear

* ------------------------------------------------------------------------------
* Recoding
* ------------------------------------------------------------------------------

* Gender
* ------------------------------------------------------------------------------
*fre sd3 sd3_y*
recode sd3 (1=1 "male") (2=2 "female") (3=.) (99=.), gen(gender)
recode sd3_y19 (1=1 "male") (2=2 "female") (3=.) (99=.), gen(gendery19)
recode sd3_y22 (1=1 "male") (2=2 "female") (3/4=.) (99=.), gen(gendery22)
recode sd3_y24 (1=1 "male") (2=2 "female") (3/4=.) (99=.), gen(gendery24)

* Age
* ------------------------------------------------------------------------------
*fre age age_y*
recode age 	(min/24=1 "15-24") 		///
			(25/34=2 "25-34")		///
			(35/44=3 "35-44")		///
	 	   	(45/54=4 "45-54") 		///
			(55/64=5 "55-64") 		///
			(65/max= 6 "65+"),		///
			gen(age6cat)
			 
recode age_y19 	(min/24=1 "15-24") 	///
 			(25/34=2 "25-34")		///
 			(35/44=3 "35-44")		///
 	 	   	(45/54=4 "45-54") 		///
 			(55/64=5 "55-64") 		///
 			(65/max= 6 "65+"),		///
 			gen(age6caty19)

recode age_y22 	(min/24=1 "15-24") 	///
 			(25/34=2 "25-34")		///
 			(35/44=3 "35-44")		///
 	 	   	(45/54=4 "45-54") 		///
 			(55/64=5 "55-64") 		///
 			(65/max= 6 "65+"),		///
 			gen(age6caty22)

recode age_y24 	(min/24=1 "15-24") 	///
 			(25/34=2 "25-34")		///
 			(35/44=3 "35-44")		///
 	 	   	(45/54=4 "45-54") 		///
 			(55/64=5 "55-64") 		///
 			(65/max= 6 "65+"),		///
 			gen(age6caty24)
			 			

* Gender X Age Interaction
* ------------------------------------------------------------------------------
gen genage6cat = .
replace genage6cat = 1 if gender ==1 & age6cat==1
replace genage6cat = 2 if gender ==1 & age6cat==2
replace genage6cat = 3 if gender ==1 & age6cat==3
replace genage6cat = 4 if gender ==1 & age6cat==4
replace genage6cat = 5 if gender ==1 & age6cat==5
replace genage6cat = 6 if gender ==1 & age6cat==6
replace genage6cat = 7 if gender ==2 & age6cat==1	
replace genage6cat = 8 if gender ==2 & age6cat==2
replace genage6cat = 9 if gender ==2 & age6cat==3
replace genage6cat = 10 if gender ==2 & age6cat==4
replace genage6cat = 11 if gender ==2 & age6cat==5
replace genage6cat = 12 if gender ==2 & age6cat==6

gen genage6caty19 = .
replace genage6caty19 = 1 if gendery19 ==1 & age6caty19==1
replace genage6caty19 = 2 if gendery19 ==1 & age6caty19==2
replace genage6caty19 = 3 if gendery19 ==1 & age6caty19==3
replace genage6caty19 = 4 if gendery19 ==1 & age6caty19==4
replace genage6caty19 = 5 if gendery19 ==1 & age6caty19==5
replace genage6caty19 = 6 if gendery19 ==1 & age6caty19==6
replace genage6caty19 = 7 if gendery19 ==2 & age6caty19==1
replace genage6caty19 = 8 if gendery19 ==2 & age6caty19==2
replace genage6caty19 = 9 if gendery19 ==2 & age6caty19==3
replace genage6caty19 = 10 if gendery19 ==2 & age6caty19==4
replace genage6caty19 = 11 if gendery19 ==2 & age6caty19==5
replace genage6caty19 = 12 if gendery19 ==2 & age6caty19==6

gen genage6caty22 = .
replace genage6caty22 = 1 if gendery22 ==1 & age6caty22==1
replace genage6caty22 = 2 if gendery22 ==1 & age6caty22==2
replace genage6caty22 = 3 if gendery22 ==1 & age6caty22==3
replace genage6caty22 = 4 if gendery22 ==1 & age6caty22==4
replace genage6caty22 = 5 if gendery22 ==1 & age6caty22==5
replace genage6caty22 = 6 if gendery22 ==1 & age6caty22==6
replace genage6caty22 = 7 if gendery22 ==2 & age6caty22==1
replace genage6caty22 = 8 if gendery22 ==2 & age6caty22==2
replace genage6caty22 = 9 if gendery22 ==2 & age6caty22==3
replace genage6caty22 = 10 if gendery22 ==2 & age6caty22==4
replace genage6caty22 = 11 if gendery22 ==2 & age6caty22==5
replace genage6caty22 = 12 if gendery22 ==2 & age6caty22==6

gen genage6caty24 = .
replace genage6caty24 = 1 if gendery24 ==1 & age6caty24==1
replace genage6caty24 = 2 if gendery24 ==1 & age6caty24==2
replace genage6caty24 = 3 if gendery24 ==1 & age6caty24==3
replace genage6caty24 = 4 if gendery24 ==1 & age6caty24==4
replace genage6caty24 = 5 if gendery24 ==1 & age6caty24==5
replace genage6caty24 = 6 if gendery24 ==1 & age6caty24==6
replace genage6caty24 = 7 if gendery24 ==2 & age6caty24==1
replace genage6caty24 = 8 if gendery24 ==2 & age6caty24==2
replace genage6caty24 = 9 if gendery24 ==2 & age6caty24==3
replace genage6caty24 = 10 if gendery24 ==2 & age6caty24==4
replace genage6caty24 = 11 if gendery24 ==2 & age6caty24==5
replace genage6caty24 = 12 if gendery24 ==2 & age6caty24==6

* Region (Bundesland)
* ------------------------------------------------------------------------------
* fre sd4 sd4_y*
clonevar bula = sd4
clonevar bulay19 = sd4_y19
clonevar bulay22 = sd4_y22
clonevar bulay24 = sd4_y24

recode bula (1 = 1) (2 = 2) (3 = 3) (6 = 4) (5 = 5) (4 = 6) (8 = 7) (9 = 8) (7 = 9)
recode bulay19 (1 = 1) (2 = 2) (3 = 3) (6 = 4) (5 = 5) (4 = 6) (8 = 7) (9 = 8) (7 = 9)
recode bulay22 (1 = 1) (2 = 2) (3 = 3) (6 = 4) (5 = 5) (4 = 6) (8 = 7) (9 = 8) (7 = 9)
recode bulay24 (1 = 1) (2 = 2) (3 = 3) (6 = 4) (5 = 5) (4 = 6) (8 = 7) (9 = 8) (7 = 9)

lab def bula_lb 1 "Vorarlberg" ///
	2 "Tyrol" ///
	3 "Salzburg" ///
	4 "Styria" ///
	5 "Carinthia" ///
	6 "Upper Austria" ///
	7 "Lower Austria" ///
	8 "Vienna" ///
	9 "Burgenland"
lab val bula bula_lb
lab val bulay19 bula_lb
lab val bulay22 bula_lb
lab val bulay24 bula_lb

* Household Size
* ------------------------------------------------------------------------------
gen 		hhsize3cat = 1 if sd5  == 1
replace 	hhsize3cat = 2 if sd5  == 2
replace 	hhsize3cat = 3 if sd5  > 2 & sd5<.
tab hhsize3cat

gen 		hhsize3caty19 = 1 if sd5_y19  == 1
replace 	hhsize3caty19 = 2 if sd5_y19  == 2
replace 	hhsize3caty19 = 3 if sd5_y19  > 2 & sd5_y19 <.
tab hhsize3caty19

gen 		hhsize3caty22 = 1 if sd5_y22  == 1
replace 	hhsize3caty22 = 2 if sd5_y22  == 2
replace 	hhsize3caty22 = 3 if sd5_y22  > 2 & sd5_y22 <.
tab hhsize3caty22

gen 		hhsize3caty24 = 1 if sd5_y24  == 1
replace 	hhsize3caty24 = 2 if sd5_y24  == 2
replace 	hhsize3caty24 = 3 if sd5_y24  > 2 & sd5_y24 <.
tab hhsize3caty24

* Education
* ------------------------------------------------------------------------------
* fre sd7 sd7_y*
recode sd7 (1/4 =1 "Primary/lower secondary school") (5=.) 				///
	(6 8=3 "Polytechnic, BMS") (7=2 "Vocational school") 				///
	(9/10=4 "Upper secondary school") (11/15=5 "University degree")		///
	(16=.), gen(edu5cat)

recode sd7_y19  (1/4=1 "Primary/lower secondary school") (5=.) 			///
	(6 8=3 "Polytechnic, BMS") (7=2 "Vocational school") 				///
	(9/10=4 "Upper secondary school") (11/15=5 "University degree") 	///
	(16=.), gen(edu5caty19)
	
recode sd7_y22  (1/4=1 "Primary/lower secondary school") (5=.)			///
	(6 8=3 "Polytechnic, BMS") (7=2 "Vocational school") 				///
	(9/10=4 "Upper secondary school") (11/15=5 "University degree") 	///
	(16=.), gen(edu5caty22)	

recode sd7_y24  (1/4=1 "Primary/lower secondary school") (5=.) 			///
	(6 8=3 "Polytechnic, BMS") (7=2 "Vocational school") 				///
	(9/10=4 "Upper secondary school") (11/15=5 "University degree") 	///
	(16=.), gen(edu5caty24)

* Migration Background
* ------------------------------------------------------------------------------
/*People with a migrant background are defined as people ///
whose parents were both born abroad. (see Statistics Austria) */

*fre sd19 sd20 sd19_y19 sd20_y19
gen migration =. 
replace migration = 0 if sd19 == 1 | sd20 == 1
replace migration = 1 if (sd19 > 1 & sd19 <.) & (sd20 > 1 & sd20 <.)

gen migrationy19 =. 
replace migrationy19 = 0 if sd19_y19 == 1 | sd20_y19 == 1
replace migrationy19 = 1 if (sd19_y19 > 1 & sd19_y19 <.) & (sd20_y19 > 1 & sd20_y19 <.)

gen migrationy22 =. 
replace migrationy22 = 0 if sd19_y22 == 1 | sd20_y22 == 1
replace migrationy22 = 1 if (sd19_y22 > 1 & sd19_y22 <.) & (sd20_y22 > 1 & sd20_y22 <.)

gen migrationy24 =. 
replace migrationy24 = 0 if sd19_y24 == 1 | sd20_y24 == 1
replace migrationy24 = 1 if (sd19_y24 > 1 & sd19_y24 <.) & (sd20_y24 > 1 & sd20_y24 <.)

* Employment Status (4 cat)
* ------------------------------------------------------------------------------
*fre sd10 sd10_y19

recode sd10 	(1=1 "Erwerbstätig") 		///
				(2=2 "Pensionisten") 		///
				(3/5=3 "Schüler/Student") 	///
				(6/11=4 "Sonstiges") (99=.), gen(erwerb4cat)

recode sd10_y19 (1=1 "Erwerbstätig") 		///
				(2=2 "Pensionisten") 		///
				(3/5=3 "Schüler/Student") 	///
				(6/11=4 "Sonstiges") (99=.), gen(erwerb4caty19)


recode sd10_y22 (1=1 "Erwerbstätig") 		///
				(2=2 "Pensionisten") 		///
				(3/5=3 "Schüler/Student") 	///
				(6/11=4 "Sonstiges") (99=.), gen(erwerb4caty22)
				
recode sd10_y24 (1=1 "Erwerbstätig") 		///
				(2=2 "Pensionisten") 		///
				(3/5=3 "Schüler/Student") 	///
				(6/11=4 "Sonstiges") (99=.), gen(erwerb4caty24)				

* VOTE (NRW 2013) - W1, W4
* ------------------------------------------------------------------------------
* fre w1_q23 w4f_q28
* fre w1_q24 w4f_q29

recode w1_q24 (1=2 "SPÖ")					///
				(2=3 "ÖVP")					///
				(3=4 "FPÖ")					///
				(5=5 "GREENS")				///
				(7=6 "NEOS")				///
				(4=7 "BZÖ")					///
				(8=7 "FRANK")				///
				(6  9  10 =7 "Other/invalid") 	///
				(88/99=.), gen(nrvote13_w1)
recode w4f_q29 (1=2 "SPÖ")					///
				(2=3 "ÖVP")					///
				(3=4 "FPÖ")					///
				(5=5 "GREENS")				///
				(7=6 "NEOS")				///
				(4=7 "BZÖ")					///
				(8=7 "FRANK")				///
				(6  9  10 =7 "Other/invalid") 	///
				(88/99=.), gen(nrvote13_w4)				
				
replace nrvote13_w1 = 1 if w1_q23<4 
replace nrvote13_w4 = 1 if w4f_q28<4

lab def nrvote13_w1 1 "Non-Voter", modify
lab def nrvote13_w4 1 "Non-Voter", modify

lab var nrvote13_w1 "VOTE – NRW 2013"
lab var nrvote13_w4 "VOTE – NRW 2013"

clonevar nrvote13 = nrvote13_w1
replace nrvote13 = nrvote13_w4 if nrvote13==.
*fre nrvote13

* VOTE (NRW 2017) - W5, W6, W7, W8, W9, W10, W11, W12
* ------------------------------------------------------------------------------
* fre w5_q10 w6f_q19 w7_q5 w8_q63 w9f_q48 w10f_q87 w11f_q28 w12f_q24

* Rename and change prefix to suffix
foreach var of varlist w5_q10 w6f_q19 w7_q5 w8_q63 w9f_q48 w10f_q87 w11f_q28 w12f_q24 {
	local splitpos = ustrpos("`var'","_")
	local prefix = substr("`var'",1,`splitpos'-1) 
	local stub = "nrvote17"
	clonevar `stub'_`prefix' = `var'
}
rename (nrvote17_w#f) (nrvote17_w#)

recode nrvote17_w* (1=2)	///
				(2=3)		///
				(3=4)		///
				(4=5)		///
				(5=6)		///
				(6=7)		///
				(7 8 9 10 11 12=8)		///
				(88/99=.)

replace nrvote17_w5 = 1 if w5_q9<4
replace nrvote17_w6 = 1 if w6f_q18<4
replace nrvote17_w7 = 1 if w7_q4<4
replace nrvote17_w8 = 1 if w8_q63<4
replace nrvote17_w9 = 1 if w9f_q48<4
replace nrvote17_w10 = 1 if w10f_q87<4
replace nrvote17_w11 = 1 if w11f_q27<4
replace nrvote17_w12 = 1 if w12f_q23<4
			
lab def nrvote17 1 "Non-Voter "2 "SPÖ" 3 "ÖVP" 4 "FPÖ" 5 "GREENS" 6 "NEOS" 7 "PILZ" 8 "Other/invalid"
lab val nrvote17_w* nrvote17
foreach num of numlist 5/12 {
	lab var nrvote17_w`num' "VOTE – NRW 2017"
}

clonevar nrvote17 = nrvote17_w5
replace nrvote17 = nrvote17_w6 if nrvote17==. 
replace nrvote17 = nrvote17_w7 if nrvote17==. 
replace nrvote17 = nrvote17_w8 if nrvote17==.
replace nrvote17 = nrvote17_w9 if nrvote17==.
replace nrvote17 = nrvote17_w10 if nrvote17==.
replace nrvote17 = nrvote17_w11 if nrvote17==.
replace nrvote17 = nrvote17_w12 if nrvote17==.
* fre nrvote17

* VOTE (NRW 2019) - W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23
* ------------------------------------------------------------------------------
* fre w12_q12 w13f_q30 w14_q22 w15f_q31 w16_q23 w17f_q18 w18f_q13 w19f_q40 w20f_q38 w21f_q30 w22f_q28 w23f_q43

recode w12_q12 w13f_q30 w14_q22 w15f_q31 w16_q23 w17f_q18 w18f_q13 w19f_q40 w20f_q38 w21f_q30 w22f_q28 w23f_q43	///
	 	 (1=3) (2=2) (3=4) (4=6) (5=7) (6=5) (7/12=7) (88=.) (99=.),					///
	 gen(nrvote19_w12 nrvote19_w13 nrvote19_w14 nrvote19_w15 nrvote19_w16 				///
		 nrvote19_w17 nrvote19_w18 nrvote19_w19 nrvote19_w20 nrvote19_w21 				///
		 nrvote19_w22 nrvote19_w23)
replace nrvote19_w12= 1 if w12_q11<4	 
replace nrvote19_w13 = 1 if w13f_q29<4
replace nrvote19_w14 = 1 if w14_q21<4
replace nrvote19_w15 = 1 if w15f_q30<4
replace nrvote19_w16 = 1 if w16_q22<4
replace nrvote19_w17 = 1 if w17f_q17<4
replace nrvote19_w18 = 1 if w18f_q12<4
replace nrvote19_w19 = 1 if w19f_q39<4
replace nrvote19_w20 = 1 if w20f_q37<4
replace nrvote19_w21 = 1 if w21f_q29<4
replace nrvote19_w22 = 1 if w22f_q27<4
replace nrvote19_w23 = 1 if w23f_q42<4

lab def nrvote19 1 "Non-Voter"		///
				2 "SPÖ"		///
				3 "ÖVP"		///
				4 "FPÖ"		///
				5 "GREENS"		///
				6 "NEOS"		///
				7 "Other/invalid"
lab val nrvote19_w* nrvote19
fre nrvote19_w*

clonevar nrvote19 = nrvote19_w12
replace nrvote19 = nrvote19_w13 if nrvote19==. 
replace nrvote19 = nrvote19_w14 if nrvote19==. 
replace nrvote19 = nrvote19_w15 if nrvote19==.
replace nrvote19 = nrvote19_w16 if nrvote19==.
replace nrvote19 = nrvote19_w17 if nrvote19==.
replace nrvote19 = nrvote19_w18 if nrvote19==.
replace nrvote19 = nrvote19_w19 if nrvote19==.
replace nrvote19 = nrvote19_w20 if nrvote19==.
replace nrvote19 = nrvote19_w21 if nrvote19==.
replace nrvote19 = nrvote19_w22 if nrvote19==.
replace nrvote19 = nrvote19_w23 if nrvote19==.

lab var nrvote19_w12 "VOTE – NRW 2019"
lab var nrvote19_w13 "VOTE – NRW 2019"
lab var nrvote19_w14 "VOTE – NRW 2019"
lab var nrvote19_w15 "VOTE – NRW 2019"
lab var nrvote19_w16 "VOTE – NRW 2019"
lab var nrvote19_w17 "VOTE – NRW 2019"
lab var nrvote19_w18 "VOTE – NRW 2019"
lab var nrvote19_w19 "VOTE – NRW 2019"
lab var nrvote19_w20 "VOTE – NRW 2019"
lab var nrvote19_w21 "VOTE – NRW 2019"
lab var nrvote19_w22 "VOTE – NRW 2019"
lab var nrvote19_w23 "VOTE – NRW 2019"
lab var nrvote19 "VOTE – NRW 2019"
* fre nrvote19

* VOTE (NRW 2024) - W24
* ------------------------------------------------------------------------------
fre w23_q10 w23_q11

recode w23_q11 (1=3) (2=2) (3=4) (4=5) (5=6) ///
                (6/12=7) (77=7) (88/99=.), gen(nrvote24_w23)
				
replace nrvote24_w23 = 1 if w23_q10<4 // Non-voter				

* Value labels
label define nrvote24 1 "Non-voter" ///
                      2 "SPÖ" ///
                      3 "ÖVP" ///
                      4 "FPÖ" ///
                      5 "GREENS" ///
                      6 "NEOS" ///
                      7 "Other/invalid"
label values nrvote24_w23 nrvote24
fre nrvote24_w23					  


clonevar nrvote24 = nrvote24_w23
fre nrvote24

lab var nrvote24_w23 "VOTE – NRW 2024"
lab var nrvote24 "VOTE – NRW 2024"

* EUROPEAN VOTE - W10
* ------------------------------------------------------------------------------
fre w10_q51 w10_q52
recode w10_q52 (1=3) (2=2) (3=4) (4=6) (5=7) (6=5) (7/12=7) (88/99=.), gen(epvote19)
replace epvote19= 1 if w10_q51<4

lab var epvote19 "VOTE – EP 2019"

lab def epvote19 1 "Non-Voter"		///
					2 "SPÖ"			///
					3 "ÖVP"			///
					4 "FPÖ"			///
					5 "GREENS"			///
					6 "NEOS"			///
					7 "Other/invalide"
lab val epvote19 epvote19
fre	epvote19		


* PRESIDENTIAL VOTE - W15
* ------------------------------------------------------------------------------
fre w15_q14 w15_q15
recode w15_q15 (5=2 "Van der Bellen")		///
	(3=3 "Rosenkranz")	///
	(7=4 "Wlazny")	///
	(6=5 "Wallentin")	///
	(2=6 "Grosz")	///
	(1 4 10 = 7 "Other/invalid")	///
	(88/99=.), gen(bpvote22)
replace bpvote22 = 1 if w15_q14<4
lab def bpvote22 1 "Non-Voter", modify

lab var bpvote22 "VOTE – BP 2022"


* ------------------------------------------------------------------------------
* Save disaggregated data
* ------------------------------------------------------------------------------

* 2017
preserve
foreach var of varlist gender age6cat genage6cat bula hhsize3cat edu5cat 		///
	migration erwerb4cat nrvote13 nrvote17 {
	tab `var', gen(`var'_d)
}
keep w*_panelist w*_weightd w*_weightp gender_d* age6cat_d* genage6cat_d* 		///
	bula_d* hhsize3cat_d* edu5cat_d* 											///
	migration_d* erwerb4cat_d* nrvote13_d* nrvote17_d*
save "$DATA/sozdem_vote_2017.dta", replace
restore

* 2019
preserve
foreach var of varlist gendery19 age6caty19 genage6caty19 bulay19 				///
	hhsize3caty19 edu5caty19 migrationy19 erwerb4caty19 nrvote17 			///
	epvote19 nrvote19 {
	tab `var', gen(`var'_d)
}

keep w*_panelist w*_weightd w*_weightp gendery19_d* age6caty19_d* 				///
	genage6caty19_d* bulay19_d* hhsize3caty19_d* 								///
	edu5caty19_d* migrationy19_d* erwerb4caty19_d* nrvote17_d* 			///
	epvote19_d*  nrvote19_d*
save "$DATA/sozdem_vote_2019.dta", replace
restore

* 2022
preserve
foreach var of varlist gendery22 age6caty22 genage6caty22 bulay22 				///
	hhsize3caty22 edu5caty22 migrationy22 erwerb4caty22 						///
	bpvote22 nrvote19 {
	tab `var', gen(`var'_d)
}

keep w*_panelist w*_weightd w*_weightp gendery22_d* age6caty22_d* 				///
	genage6caty22_d* bulay22_d* hhsize3caty22_d* 								///
	edu5caty22_d* migrationy22_d* erwerb4caty22_d*					 			///
	bpvote22_d* nrvote19_d*
save "$DATA/sozdem_vote_2022.dta", replace
restore

* 2024
preserve
foreach var of varlist gendery24 age6caty24 genage6caty24 bulay24 				///
	hhsize3caty24 edu5caty24 migrationy24 erwerb4caty24 						///
	nrvote19 nrvote24 {
	tab `var', gen(`var'_d)
}

keep w*_panelist w*_weightd w*_weightp gendery24_d* age6caty24_d* 				///
	genage6caty24_d* bulay24_d* hhsize3caty24_d* 								///
	edu5caty24_d* migrationy24_d* erwerb4caty24_d*					 			///
	nrvote19_d* nrvote24_d*
save "$DATA/sozdem_vote_2024.dta", replace
restore

* ------------------------------------------------------------------------------
* Agggregated data: Unweighted
* ------------------------------------------------------------------------------

foreach num of numlist 1/6 {
	use "$DATA/sozdem_vote_2017.dta", clear
	collapse gender_d* age6cat_d* genage6cat_d* bula_d* hhsize3cat_d* 			///
	edu5cat_d* migration_d* erwerb4cat_d* nrvote13_d* 					///
	nrvote17_d* 															///
	if w`num'_panelist==1
	save "$DATA/W`num'_actual_share_2017.dta", replace
	}

foreach num of numlist 7/13 {
	use "$DATA/sozdem_vote_2019.dta", clear
	collapse gendery19_d* age6caty19_d* genage6caty19_d* bulay19_d* 			///
	hhsize3caty19_d* edu5caty19_d* migrationy19_d* erwerb4caty19_d* 			///
	nrvote17_d* epvote19_d* nrvote19_d*							///
	if w`num'_panelist==1
	save "$DATA/W`num'_actual_share_2019.dta", replace
	}
	
foreach num of numlist 14/15 {
	use "$DATA/sozdem_vote_2022.dta", clear
	collapse gendery22_d* age6caty22_d* genage6caty22_d* bulay22_d* 			///
	hhsize3caty22_d* edu5caty22_d* migrationy22_d* erwerb4caty22_d* 			///
	bpvote22_d* nrvote19_d*											///
	if w`num'_panelist==1
	save "$DATA/W`num'_actual_share_2022.dta", replace
	}
	
foreach num of numlist 16/23 {
	use "$DATA/sozdem_vote_2024.dta", clear
	collapse gendery24_d* age6caty24_d* genage6caty24_d* bulay24_d* 			///
	hhsize3caty24_d* edu5caty24_d* migrationy24_d* erwerb4caty24_d* 			///
	nrvote19_d* nrvote24_d*														///
	if w`num'_panelist==1
	save "$DATA/W`num'_actual_share_2024.dta", replace
	}	
	
* ------------------------------------------------------------------------------
* Append Aggregated Data: Unweighted
* ------------------------------------------------------------------------------

* 2017: Unweighted
* ------------------------------------------------------------------------------
use "$DATA/W1_actual_share_2017.dta", clear
foreach num of numlist 2/6 {
append using "$DATA/W`num'_actual_share_2017.dta"
}

append using "$DATA/targets_2017.dta"

xpose, clear varname

foreach num of numlist 1/6 {
	rename v`num' W`num'
}
rename v7 targets2017
save "$DATA/target_actual_shares_all_2017.dta", replace

* 2019: Unweighted
* ------------------------------------------------------------------------------
use "$DATA/W7_actual_share_2019.dta", clear
foreach num of numlist 8/13 {
append using "$DATA/W`num'_actual_share_2019.dta"
}
rename	gendery19_d1	gender_d1
rename	gendery19_d2	gender_d2
rename	age6caty19_d1	age6cat_d1
rename	age6caty19_d2	age6cat_d2
rename	age6caty19_d3	age6cat_d3
rename	age6caty19_d4	age6cat_d4
rename	age6caty19_d5	age6cat_d5
rename	age6caty19_d6	age6cat_d6
rename	genage6caty19_d1	genage6cat_d1
rename	genage6caty19_d2	genage6cat_d2
rename	genage6caty19_d3	genage6cat_d3
rename	genage6caty19_d4	genage6cat_d4
rename	genage6caty19_d5	genage6cat_d5
rename	genage6caty19_d6	genage6cat_d6
rename	genage6caty19_d7	genage6cat_d7
rename	genage6caty19_d8	genage6cat_d8
rename	genage6caty19_d9	genage6cat_d9
rename	genage6caty19_d10	genage6cat_d10
rename	genage6caty19_d11	genage6cat_d11
rename	genage6caty19_d12	genage6cat_d12
rename	bulay19_d1	bula_d1
rename	bulay19_d2	bula_d2
rename	bulay19_d3	bula_d3
rename	bulay19_d4	bula_d4
rename	bulay19_d5	bula_d5
rename	bulay19_d6	bula_d6
rename	bulay19_d7	bula_d7
rename	bulay19_d8	bula_d8
rename	bulay19_d9	bula_d9
rename	hhsize3caty19_d1	hhsize3cat_d1
rename	hhsize3caty19_d2	hhsize3cat_d2
rename	hhsize3caty19_d3	hhsize3cat_d3
rename	edu5caty19_d1	edu5cat_d1
rename	edu5caty19_d2	edu5cat_d2
rename	edu5caty19_d3	edu5cat_d3
rename	edu5caty19_d4	edu5cat_d4
rename	edu5caty19_d5	edu5cat_d5
rename	migrationy19_d1	migration_d1
rename	migrationy19_d2	migration_d2
rename	erwerb4caty19_d1	erwerb4cat_d1
rename	erwerb4caty19_d2	erwerb4cat_d2
rename	erwerb4caty19_d3	erwerb4cat_d3
rename	erwerb4caty19_d4	erwerb4cat_d4

append using "$DATA/targets_2019.dta"

xpose, clear varname

foreach num of numlist 1/7 {
	local wave = `num'+6
	rename v`num' W`wave'
}
rename v8 targets2019
save "$DATA/target_actual_shares_all_2019.dta", replace

* 2022: Unweighted
* ------------------------------------------------------------------------------
use "$DATA/W14_actual_share_2022.dta", clear
foreach num of numlist 15 {
append using "$DATA/W`num'_actual_share_2022.dta"
}

rename gendery22_d1 gender_d1
rename gendery22_d2 gender_d2
rename age6caty22_d1 age6cat_d1
rename age6caty22_d2 age6cat_d2
rename age6caty22_d3 age6cat_d3
rename age6caty22_d4 age6cat_d4
rename age6caty22_d5 age6cat_d5
rename age6caty22_d6 age6cat_d6
rename genage6caty22_d1 genage6cat_d1
rename genage6caty22_d2 genage6cat_d2
rename genage6caty22_d3 genage6cat_d3
rename genage6caty22_d4 genage6cat_d4
rename genage6caty22_d5 genage6cat_d5
rename genage6caty22_d6 genage6cat_d6
rename genage6caty22_d7 genage6cat_d7
rename genage6caty22_d8 genage6cat_d8
rename genage6caty22_d9 genage6cat_d9
rename genage6caty22_d10 genage6cat_d10
rename genage6caty22_d11 genage6cat_d11
rename genage6caty22_d12 genage6cat_d12
rename bulay22_d1 bula_d1
rename bulay22_d2 bula_d2
rename bulay22_d3 bula_d3
rename bulay22_d4 bula_d4
rename bulay22_d5 bula_d5
rename bulay22_d6 bula_d6
rename bulay22_d7 bula_d7
rename bulay22_d8 bula_d8
rename bulay22_d9 bula_d9
rename hhsize3caty22_d1 hhsize3cat_d1
rename hhsize3caty22_d2 hhsize3cat_d2
rename hhsize3caty22_d3 hhsize3cat_d3
rename edu5caty22_d1 edu5cat_d1
rename edu5caty22_d2 edu5cat_d2
rename edu5caty22_d3 edu5cat_d3
rename edu5caty22_d4 edu5cat_d4
rename edu5caty22_d5 edu5cat_d5
rename migrationy22_d1 migration_d1
rename migrationy22_d2 migration_d2
rename erwerb4caty22_d1 erwerb4cat_d1
rename erwerb4caty22_d2 erwerb4cat_d2
rename erwerb4caty22_d3 erwerb4cat_d3
rename erwerb4caty22_d4 erwerb4cat_d4

append using "$DATA/targets_2022.dta"

xpose, clear varname

foreach num of numlist 1/2 {
	local wave = `num'+13
	rename v`num' W`wave'
}
rename v3 targets2022
save "$DATA/target_actual_shares_all_2022.dta", replace

* 2024: Unweighted
* ------------------------------------------------------------------------------
use "$DATA/W16_actual_share_2024.dta", clear
foreach num of numlist 17/23 {
 append using "$DATA/W`num'_actual_share_2024.dta"
 }

rename gendery24_d1 gender_d1
rename gendery24_d2 gender_d2
rename age6caty24_d1 age6cat_d1
rename age6caty24_d2 age6cat_d2
rename age6caty24_d3 age6cat_d3
rename age6caty24_d4 age6cat_d4
rename age6caty24_d5 age6cat_d5
rename age6caty24_d6 age6cat_d6
rename genage6caty24_d1 genage6cat_d1
rename genage6caty24_d2 genage6cat_d2
rename genage6caty24_d3 genage6cat_d3
rename genage6caty24_d4 genage6cat_d4
rename genage6caty24_d5 genage6cat_d5
rename genage6caty24_d6 genage6cat_d6
rename genage6caty24_d7 genage6cat_d7
rename genage6caty24_d8 genage6cat_d8
rename genage6caty24_d9 genage6cat_d9
rename genage6caty24_d10 genage6cat_d10
rename genage6caty24_d11 genage6cat_d11
rename genage6caty24_d12 genage6cat_d12
rename bulay24_d1 bula_d1
rename bulay24_d2 bula_d2
rename bulay24_d3 bula_d3
rename bulay24_d4 bula_d4
rename bulay24_d5 bula_d5
rename bulay24_d6 bula_d6
rename bulay24_d7 bula_d7
rename bulay24_d8 bula_d8
rename bulay24_d9 bula_d9
rename hhsize3caty24_d1 hhsize3cat_d1
rename hhsize3caty24_d2 hhsize3cat_d2
rename hhsize3caty24_d3 hhsize3cat_d3
rename edu5caty24_d1 edu5cat_d1
rename edu5caty24_d2 edu5cat_d2
rename edu5caty24_d3 edu5cat_d3
rename edu5caty24_d4 edu5cat_d4
rename edu5caty24_d5 edu5cat_d5
rename migrationy24_d1 migration_d1
rename migrationy24_d2 migration_d2
rename erwerb4caty24_d1 erwerb4cat_d1
rename erwerb4caty24_d2 erwerb4cat_d2
rename erwerb4caty24_d3 erwerb4cat_d3
rename erwerb4caty24_d4 erwerb4cat_d4

append using "$DATA/targets_2024.dta"

xpose, clear varname

foreach num of numlist 1/8 {
	local wave = `num'+15
	rename v`num' W`wave'
}
rename v9 targets2024
save "$DATA/target_actual_shares_all_2024.dta", replace


* Merge: 2017-2024 (Unweighted)
* ------------------------------------------------------------------------------
use "$DATA/target_actual_shares_all_2017.dta", clear
*merge 1:1 _varname using "$DATA/target_actual_shares_all_2017.dta", nogenerate
merge 1:1 _varname using "$DATA/target_actual_shares_all_2019.dta", nogenerate
merge 1:1 _varname using "$DATA/target_actual_shares_all_2022.dta", nogenerate
merge 1:1 _varname using "$DATA/target_actual_shares_all_2024.dta", nogenerate
order _varname, first
order targets2017 targets2019 targets2022 targets2024, a(_varname)
order W1 W2 W3 W4 W5 W6 W7 W8 W9 W10 W11 W12 W13 W14 W15 W16 W17 W18 W19 W20 W21 W22 W23, after(targets2024)


foreach num of numlist 7 8 9 11 12 13 14 15 16 17/23 {
replace W`num' =. if _varname == "epvote19_d1"
replace W`num' =. if _varname == "epvote19_d2"
replace W`num' =. if _varname == "epvote19_d3"
replace W`num' =. if _varname == "epvote19_d4"
replace W`num' =. if _varname == "epvote19_d5"
replace W`num' =. if _varname == "epvote19_d6"
replace W`num' =. if _varname == "epvote19_d7"
replace W`num' =. if _varname == "epvote19_d8"
}

replace targets2022 = . if _varname == "epvote19_d1"
replace targets2022 = . if _varname == "epvote19_d2"
replace targets2022 = . if _varname == "epvote19_d3"
replace targets2022 = . if _varname == "epvote19_d4"
replace targets2022 = . if _varname == "epvote19_d5"
replace targets2022 = . if _varname == "epvote19_d6"
replace targets2022 = . if _varname == "epvote19_d7"
replace targets2022 = . if _varname == "epvote19_d8"

replace targets2019 = . if _varname == "nrvote13_d1"
replace targets2019 = . if _varname == "nrvote13_d2"
replace targets2019 = . if _varname == "nrvote13_d3"
replace targets2019 = . if _varname == "nrvote13_d4"
replace targets2019 = . if _varname == "nrvote13_d5"
replace targets2019 = . if _varname == "nrvote13_d6"
replace targets2019 = . if _varname == "nrvote13_d7"

replace targets2022 = . if _varname == "nrvote13_d1"
replace targets2022 = . if _varname == "nrvote13_d2"
replace targets2022 = . if _varname == "nrvote13_d3"
replace targets2022 = . if _varname == "nrvote13_d4"
replace targets2022 = . if _varname == "nrvote13_d5"
replace targets2022 = . if _varname == "nrvote13_d6"
replace targets2022 = . if _varname == "nrvote13_d7"

replace targets2022 = . if _varname == "nrvote17_d1"
replace targets2022 = . if _varname == "nrvote17_d2"
replace targets2022 = . if _varname == "nrvote17_d3"
replace targets2022 = . if _varname == "nrvote17_d4"
replace targets2022 = . if _varname == "nrvote17_d5"
replace targets2022 = . if _varname == "nrvote17_d6"
replace targets2022 = . if _varname == "nrvote17_d7"
replace targets2022 = . if _varname == "nrvote17_d8"

replace targets2024 = . if _varname == "epvote19_d1"
replace targets2024 = . if _varname == "epvote19_d2"
replace targets2024 = . if _varname == "epvote19_d3"
replace targets2024 = . if _varname == "epvote19_d4"
replace targets2024 = . if _varname == "epvote19_d5"
replace targets2024 = . if _varname == "epvote19_d6"
replace targets2024 = . if _varname == "epvote19_d7"
replace targets2024 = . if _varname == "epvote19_d8"

replace targets2024 = . if _varname == "nrvote13_d1"
replace targets2024 = . if _varname == "nrvote13_d2"
replace targets2024 = . if _varname == "nrvote13_d3"
replace targets2024 = . if _varname == "nrvote13_d4"
replace targets2024 = . if _varname == "nrvote13_d5"
replace targets2024 = . if _varname == "nrvote13_d6"
replace targets2024 = . if _varname == "nrvote13_d7"

replace targets2024 = . if _varname == "nrvote17_d1"
replace targets2024 = . if _varname == "nrvote17_d2"
replace targets2024 = . if _varname == "nrvote17_d3"
replace targets2024 = . if _varname == "nrvote17_d4"
replace targets2024 = . if _varname == "nrvote17_d5"
replace targets2024 = . if _varname == "nrvote17_d6"
replace targets2024 = . if _varname == "nrvote17_d7"
replace targets2024 = . if _varname == "nrvote17_d8"

replace targets2024 = . if _varname == "bpvote22_d1"
replace targets2024 = . if _varname == "bpvote22_d2"
replace targets2024 = . if _varname == "bpvote22_d3"
replace targets2024 = . if _varname == "bpvote22_d4"
replace targets2024 = . if _varname == "bpvote22_d5"
replace targets2024 = . if _varname == "bpvote22_d6"
replace targets2024 = . if _varname == "bpvote22_d7"
replace targets2024 = . if _varname == "bpvote22_d8"

replace W6 = . if _varname == "nrvote13_d1"
replace W6 = . if _varname == "nrvote13_d2"
replace W6 = . if _varname == "nrvote13_d3"
replace W6 = . if _varname == "nrvote13_d4"
replace W6 = . if _varname == "nrvote13_d5"
replace W6 = . if _varname == "nrvote13_d6"
replace W6 = . if _varname == "nrvote13_d7"

foreach num of numlist 14 16/23 {
replace W`num' =. if _varname == "bpvote22_d1"
replace W`num' =. if _varname == "bpvote22_d2"
replace W`num' =. if _varname == "bpvote22_d3"
replace W`num' =. if _varname == "bpvote22_d4"
replace W`num' =. if _varname == "bpvote22_d5"
replace W`num' =. if _varname == "bpvote22_d6"
replace W`num' =. if _varname == "bpvote22_d7"
replace W`num' =. if _varname == "bpvote22_d8"
}


foreach num of numlist 1/6 7/11 {
replace W`num' =. if _varname == "nrvote19_d1"
replace W`num' =. if _varname == "nrvote19_d2"
replace W`num' =. if _varname == "nrvote19_d3"
replace W`num' =. if _varname == "nrvote19_d4"
replace W`num' =. if _varname == "nrvote19_d5"
replace W`num' =. if _varname == "nrvote19_d6"
replace W`num' =. if _varname == "nrvote19_d7"
replace W`num' =. if _varname == "nrvote19_d8"
}

foreach num of numlist 1/4 13/23 {
replace W`num' =. if _varname == "nrvote17_d1"
replace W`num' =. if _varname == "nrvote17_d2"
replace W`num' =. if _varname == "nrvote17_d3"
replace W`num' =. if _varname == "nrvote17_d4"
replace W`num' =. if _varname == "nrvote17_d5"
replace W`num' =. if _varname == "nrvote17_d6"
replace W`num' =. if _varname == "nrvote17_d7"
replace W`num' =. if _varname == "nrvote17_d8"
}

foreach num of numlist 6 {
replace W`num' =. if _varname == "nrvote13_d1"
replace W`num' =. if _varname == "nrvote13_d2"
replace W`num' =. if _varname == "nrvote13_d3"
replace W`num' =. if _varname == "nrvote13_d4"
replace W`num' =. if _varname == "nrvote13_d5"
replace W`num' =. if _varname == "nrvote13_d6"
replace W`num' =. if _varname == "nrvote13_d7"
}

foreach num of numlist 16/22 {
replace W`num' =. if _varname == "nrvote24_d1"
replace W`num' =. if _varname == "nrvote24_d2"
replace W`num' =. if _varname == "nrvote24_d3"
replace W`num' =. if _varname == "nrvote24_d4"
replace W`num' =. if _varname == "nrvote24_d5"
replace W`num' =. if _varname == "nrvote24_d6"
replace W`num' =. if _varname == "nrvote24_d7"
}

save "$DATA/target_actual_shares_all_2017-2024.dta", replace
* export excel "$DATA/table1_actual_shares.xlsx",  firstrow(variables) replace 

* ------------------------------------------------------------------------------
* RMSE (overall; unweighted)
* ------------------------------------------------------------------------------

use "$DATA/target_actual_shares_all_2017-2024.dta", clear
set more off
foreach num of numlist 1/6 {
	gen W`num'_sqerror = (W`num' - targets2017)^2
}

foreach num of numlist 7/13 {
	gen W`num'_sqerror = (W`num' - targets2019)^2
}

foreach num of numlist 14/15 {
	gen W`num'_sqerror = (W`num' - targets2022)^2
}

foreach num of numlist 16/23 {
	gen W`num'_sqerror = (W`num' - targets2024)^2
}

collapse  W*_sqerror

foreach num of numlist 1/23 {
	gen W`num'_rmse = sqrt(W`num'_sqerror)*100
}

* Save
gen vardim_numeric = 9
gen vardim = "overall"
keep  vardim vardim_numeric W*_rmse
gen weighted = "NO"
save "$DATA/rmse_all_2017-2024.dta", replace

* ------------------------------------------------------------------------------
* Add Group Variable
* ------------------------------------------------------------------------------
use "$DATA/target_actual_shares_all_2017-2024.dta", clear

gen group_var = substr(_varname, 1, strpos(_varname, "_") - 1)

* Create a new variable for the recoded groups
gen group_var_recode = group_var

* Recode variables containing "vote" into a single group
replace group_var_recode = "vote" if strpos(group_var, "vote") > 0

* Check the results
tab group_var_recode

* Save
save "$DATA/target_actual_shares_all_2017-2024_groupvar.dta", replace

* Get the unique levels of group_var_recode
levelsof group_var_recode, local(groups)

* ------------------------------------------------------------------------------
* RMSE (by variable; unweighted)
* ------------------------------------------------------------------------------

* Loop through each group
foreach group in `groups' {
   
* Display the current group
di "* ------------------------------------------------------------------------------"
di "* RMSE (by category – `group'; unweighted)"
di "* ------------------------------------------------------------------------------"

* Load the dataset
use "$DATA/target_actual_shares_all_2017-2024_groupvar.dta", clear

* Keep only the current group
keep if group_var_recode == "`group'"

* Set more off to suppress output
set more off

* Calculate squared errors for each year
foreach num of numlist 1/6 {
    gen W`num'_sqerror = (W`num' - targets2017)^2
}
foreach num of numlist 7/13 {
    gen W`num'_sqerror = (W`num' - targets2019)^2
}
foreach num of numlist 14/15 {
    gen W`num'_sqerror = (W`num' - targets2022)^2
}
foreach num of numlist 16/23 {
    gen W`num'_sqerror = (W`num' - targets2024)^2
}

* Collapse to mean squared error
collapse W*_sqerror

* Calculate RMSE for each variable
foreach num of numlist 1/23 {
    gen W`num'_rmse = sqrt(W`num'_sqerror)*100
}

* Add metadata
gen vardim_numeric = 1
gen vardim = "`group'"
gen weighted = "NO"

* Keep relevant variables
keep vardim vardim_numeric W*_rmse weighted

* Save the results
save "$DATA/rmse_all_2017-2024_`group'.dta", replace
}

* ------------------------------------------------------------------------------
* Append overall and by group RMSE values
* ------------------------------------------------------------------------------

* Open file
use "$DATA/rmse_all_2017-2024.dta", clear

* Append each of the individual group files
append using "$DATA/rmse_all_2017-2024_age6cat.dta"
append using "$DATA/rmse_all_2017-2024_gender.dta"
append using "$DATA/rmse_all_2017-2024_vote.dta"
append using "$DATA/rmse_all_2017-2024_migration.dta"
append using "$DATA/rmse_all_2017-2024_hhsize3cat.dta"
append using "$DATA/rmse_all_2017-2024_genage6cat.dta"
append using "$DATA/rmse_all_2017-2024_erwerb4cat.dta"
append using "$DATA/rmse_all_2017-2024_edu5cat.dta"
append using "$DATA/rmse_all_2017-2024_bula.dta"

* Save the combined dataset
save "$DATA/rmse_combined_all_2017-2024.dta", replace

* Line graph: RMSE across Waves
* ------------------------------------------------------------------------------
gen lfdn = _n
reshape long W@_rmse, i(lfdn) j(WAVE)
	
* Line plot of RMSE by WAVE with a combined legend in greyscale and thicker overall line
replace W_rmse = W_rmse /100

tw (line W_rmse WAVE if vardim == "overall", lwidth(.8) lpattern(solid) lcolor(black)) ///
   (line W_rmse WAVE if vardim == "age6cat", lpattern(dash) lcolor(gs12)) ///
   (line W_rmse WAVE if vardim == "gender", lpattern(dash_dot) lcolor(gs8)) ///
   (line W_rmse WAVE if vardim == "genage6cat", lpattern(shortdash) lcolor(gs4)) ///
   (line W_rmse WAVE if vardim == "bula", lpattern(shortdash_dot) lcolor(gs4)) ///
   (line W_rmse WAVE if vardim == "edu5cat", lpattern(longdash) lcolor(gs8)) ///
   (line W_rmse WAVE if vardim == "erwerb4cat", lpattern(longdash_dot) lcolor(gs12)) ///   
   (line W_rmse WAVE if vardim == "hhsize3cat", lpattern(dash) lcolor(gs12)) ///
   (line W_rmse WAVE if vardim == "migration", lpattern(dash_dot) lcolor(gs8)) ///
   (line W_rmse WAVE if vardim == "vote", lpattern(longdash) lcolor(gs4)) ///
   , legend(order(1 "Overall" 2 "Age" 3 "Gender" 4 "Gender X Age" ///
                  5 "Federal State" 6 "Education" 7 "Employment" ///
                  8 "Household size" 9 "Migration Background" 10 "Vote") ///
            size(small)) ///
     xtitle("Wave") ///
     ytitle("RMSE") scale(*1.2) xsize(8)

* Export graph
graph export "$GRAPHS/RMSE_fig.png", replace	 

* ------------------------------------------------------------------------------
* END OF FILE
* ------------------------------------------------------------------------------
exit

