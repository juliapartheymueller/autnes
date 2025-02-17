* ==============================================================================
* PROJECT:		AUTNES Online Panel Study (2017-2024)
* OBJECTIVE:	        Data Paper: Panel Participation
* AUTHOR:		JP
* DATE: 		2025-02-17
* ==============================================================================

* Paths
global MAIN "INSERT_PATH"
global DATA "$MAIN/data"
global GRAPHS "$MAIN/graphs"

* Install required packages
* ssc install fre, replace		// Optional: To display frequency tables
ssc install coefplot, replace

* Settings
set more off

* Open data file
use "$DATA/10874_da_en_v1_0.dta", clear

* ------------------------------------------------------------------------------
* Recoding
* ------------------------------------------------------------------------------

* Panel Participation: Number of Waves
* ------------------------------------------------------------------------------
egen num_waves = rowtotal(w1_panelist-w23_panelist)
lab var num_waves "Number of waves"

* Panel Participation: Entry Wave
* ------------------------------------------------------------------------------
foreach num of numlist 1/23 {
	gen w`num'_panelist_num = `num' if w`num'_panelist==1
}
egen entry_wave = rowmin(w1_panelist_num-w23_panelist_num)
lab var entry_wave "Entry wave"

* Gender
* ------------------------------------------------------------------------------
* fre sd3 sd3_y*
gen gender = sd3_y24 
replace gender = sd3_y22 if gender==.
replace gender = sd3_y19 if gender==.
replace gender = sd3 if gender==.
recode gender (1=1 "Gender: Male") (2=0 "Gender: Female") (3/4=.), gen(gender_male)
lab var gender_male "Gender: Male"

* Age (in 2024)
* ------------------------------------------------------------------------------
* fre age age_y19 age_y22 age_y24
gen year_birth = .
replace year_birth = 2024-age_y24 if year_birth==.
replace year_birth = 2022-age_y22 if year_birth==.
replace year_birth = 2019-age_y19 if year_birth==.
replace year_birth = 2017-age if year_birth==.
lab var year_birth "Year of Birth"

gen age24 = 2024-year_birth
lab var age24 "Age (in 2024)"

recode age24 (min/29=1 "<29") (30/39=2 "30-39") (40/49=3 "40-49") 	///
	(50/59=4 "50-59") (60/69=5 "60-69") (70/max=6 "70+"), gen(age24_6cat)
lab var age24_6cat "Age (in 2024, 6 cat.)"
		 			
* Gender X Age Interaction
* ------------------------------------------------------------------------------
gen genage24_6cat = .
replace genage24_6cat = 1 if gender_male ==1 & age24_6cat==1
replace genage24_6cat = 2 if gender_male ==1 & age24_6cat==2
replace genage24_6cat = 3 if gender_male ==1 & age24_6cat==3
replace genage24_6cat = 4 if gender_male ==1 & age24_6cat==4
replace genage24_6cat = 5 if gender_male ==1 & age24_6cat==5
replace genage24_6cat = 6 if gender_male ==1 & age24_6cat==6
replace genage24_6cat = 7 if gender_male ==2 & age24_6cat==1	
replace genage24_6cat = 8 if gender_male ==2 & age24_6cat==2
replace genage24_6cat = 9 if gender_male ==2 & age24_6cat==3
replace genage24_6cat = 10 if gender_male ==2 & age24_6cat==4
replace genage24_6cat = 11 if gender_male ==2 & age24_6cat==5
replace genage24_6cat = 12 if gender_male ==2 & age24_6cat==6
lab var genage24_6cat "Gender X Age Interaction"

* Region (Bundesland)
* ------------------------------------------------------------------------------
clonevar bula = sd4_y24 
replace bula = sd4_y22 if bula==.
replace bula = sd4_y19 if bula==.
replace bula = sd4 if bula==.
recode bula (1 = 1) (2 = 2) (3 = 3) (6 = 4) (5 = 5) 	///
	(4 = 6) (8 = 7) (9 = 8) (7 = 9)

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
lab var bula "Region"

* Houshold Size
* ------------------------------------------------------------------------------
* fre sd5 sd5_y*
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

replace hhsize3caty24 = hhsize3caty22 if hhsize3caty24 ==.
replace hhsize3caty24 = hhsize3caty19 if hhsize3caty24 ==.
replace hhsize3caty24 = hhsize3cat if hhsize3caty24 ==.

lab var hhsize3caty24 "Houshold size"
lab def hhsize_lb 1 "1 person" 2 "2 persons" 3 "3+ persons"
lab val hhsize3caty24 hhsize_lb

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

replace edu5caty24 = edu5caty22 if edu5caty24==.	
replace edu5caty24 = edu5caty19 if edu5caty24==.
replace edu5caty24 = edu5cat if edu5caty24==.

lab var edu5caty24 "Education"
lab def edu_lb 1 "Primary/lower secondary school"	///
	2 "Vocational school"	///
	3 "Polytechnic, BMS"	///
	4 "Upper secondary school" 	///
	5 "University degree"	
lab val edu5caty24 edu_lb

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

replace migrationy24 = migrationy22 if migrationy24==.
replace migrationy24 = migrationy19 if migrationy24==.
replace migrationy24 = migration if migrationy24==.

lab var migrationy24 "Migration background"
lab def migration_lb 0 "Migration background: No"  1 "Migration background: Yes"
lab val migrationy24 migration_lb

* Employment Status (4 cat.)
* ------------------------------------------------------------------------------
*fre sd10 sd10_y*
recode sd10 	(1=1 "Employed") 		///
				(2=2 "Retired") 		///
				(3/5=3 "Pupil/Student") 	///
				(6/11=4 "Others") (99=.), gen(erwerb4cat)

recode sd10_y19 (1=1 "Employed") 		///
				(2=2 "Retired") 		///
				(3/5=3 "Pupil/Student") 	///
				(6/11=4 "Others") (99=.), gen(erwerb4caty19)


recode sd10_y22 (1=1 "Employed") 		///
				(2=2 "Retired") 		///
				(3/5=3 "Pupil/Student") 	///
				(6/11=4 "Others") (99=.), gen(erwerb4caty22)
				
recode sd10_y24 (1=1 "Employed") 		///
				(2=2 "Retired") 		///
				(3/5=3 "Pupil/Student") 	///
				(6/11=4 "Others") (99=.), gen(erwerb4caty24)

replace erwerb4caty24 = erwerb4caty22 if erwerb4caty24==.				
replace erwerb4caty24 = erwerb4caty19 if erwerb4caty24==.
replace erwerb4caty24 = erwerb4cat if erwerb4caty24==.

lab var erwerb4caty24 "Employment status"
lab def erwerb_lb 1 "Employed"		///
	2 "Retired"	///
	3 "Pupil/Student"	///
	4 "Others"
lab val erwerb4caty24 erwerb_lb

* Political Interest
* ------------------------------------------------------------------------------
ds, has(varlabel "POLITICAL INTEREST")
return list

foreach var of varlist `r(varlist)' {
	local splitpos = ustrpos("`var'","_")
	local prefix = substr("`var'",1,`splitpos'-1) 
	local stub = "polint"
	rename `var' `stub'_`prefix'
}
recode polint_w* (1=4) (2=3) (3=2) (4=1)
egen mean_interest = rowmean(polint_w*)
lab var mean_interest "Political interest"

* Left-Right Self-Placement
* ------------------------------------------------------------------------------
ds, has(varlabel "LEFT-RIGHT SELF-PLACEMENT")
return list

foreach var of varlist `r(varlist)' {
	local splitpos = ustrpos("`var'","_")
	local prefix = substr("`var'",1,`splitpos'-1) 
	local stub = "leftright"
	rename `var' `stub'_`prefix'
}
recode leftright_w* (88/99=.)
egen mean_leftright = rowmean(leftright_w*)

lab var mean_leftright "Left-right self-placement"

* ------------------------------------------------------------------------------
* Save data file
* ------------------------------------------------------------------------------
* Select variables
keep id w*_panelist entry_wave num_waves age24_6cat gender_male		///
	edu5caty24 hhsize3caty24 erwerb4caty24 migrationy24 bula		///
	mean_interest mean_leftright 

* Save
save "$DATA/panel_participation.dta", replace

* ------------------------------------------------------------------------------
* Number of Interviews By Entry Wave
* ------------------------------------------------------------------------------

* Open data file
use "$DATA/panel_participation.dta", clear
foreach num of numlist 1/23 {
	rename w`num'_panelist panelist_w`num'
}

* Reshape to long format
keep entry_wave panelist_w* id
reshape long panelist_w, i(id) j(wave)

tab entry_wave, gen(entry_wave_d)
foreach var of varlist entry_wave_d* {
	replace `var' =. if `var'==0
}

* Stacked Bar Chart: Number of Interviews By Entry Wave
* ------------------------------------------------------------------------------
graph bar (count) entry_wave_d* if panelist_w==1, 							///
	over(wave, label(labsize(medium)))										///
	stack 																	///
 	ylabel(0(500)4000,angle(0) labsize(large))								///
	ytitle("Number of respondents", size(large))							///
	bar(1, color("220 220 220") lcolor(black) lwidth(0.1))					///
	bar(2, color("192 192 192") lcolor(black) lwidth(0.1))					///
	bar(3, color("169 169 169") lcolor(black) lwidth(0.1))					///
	bar(4, color("128 128 128") lcolor(black) lwidth(0.1))					///
	bar(5, color("105 105 105") lcolor(black) lwidth(0.1))					///
	bar(6, color("80 80 80") lcolor(black) lwidth(0.1))						///
	bar(7, color("60 60 60") lcolor(black) lwidth(0.1))						///
	bar(8, color("40 40 40") lcolor(black) lwidth(0.1))						///
	bar(9, color("30 30 30") lcolor(black) lwidth(0.1))						///
	bar(10, color("20 20 20") lcolor(black) lwidth(0.1))					///
	bar(11, color("200 200 200") lcolor(black) lwidth(0.1))					///
	bar(12, color("180 180 180") lcolor(black) lwidth(0.1))					///
	bar(13, color("150 150 150") lcolor(black) lwidth(0.1))					///
	bar(14, color("120 120 120") lcolor(black) lwidth(0.1))					///
	bar(15, color("100 100 100") lcolor(black) lwidth(0.1))					///
	bar(16, color("80 80 80") lcolor(black) lwidth(0.1))					///
	bar(17, color("60 60 60") lcolor(black) lwidth(0.1))					///
	bar(18, color("40 40 40") lcolor(black) lwidth(0.1))					///
	bar(19, color("30 30 30") lcolor(black) lwidth(0.1))					///
	bar(20, color("20 20 20") lcolor(black) lwidth(0.1))					///
	legend(	lab(1 "W1") lab(2 "W4")						 					///
			lab(3 "W6") lab(4 "W7")											///
			lab(5 "W8") lab(6 "W9")											///
			lab(7 "W10") lab(8 "W11")										///
			lab(9 "W12") lab(10 "W13")										///
			lab(11 "W14") lab(12 "W15")										///									
			lab(13 "W16") lab(14 "W17")										///		
			lab(15 "W18") lab(16 "W19")										///
			lab(17 "W20") lab(18 "W21")										///
			lab(19 "W22") lab(20 "W23")										///	
			col(1) title("Entry wave", size(medsmall))						///
			region(col(white)) size(medsmall) 								///
			position(right) symxsize(4))									///
	scheme(white_tableau)													///
	yline(3000, lpattern("dash"))											///
	b1title("Wave", size(large) margin(top)) xsize(8)

* Export graph
graph export "$GRAPHS/figure3_panel_retention_sw.png", replace


* ------------------------------------------------------------------------------
* Determinants of Panel Participation
* ------------------------------------------------------------------------------

* Open data file
use "$DATA/panel_participation.dta", clear

/* fre num_waves age24_6cat gender_male								///
	edu5caty24 hhsize3caty24 erwerb4caty24 migrationy24 bula		///
	mean_interest mean_leftright */

* Linear Regression
regress num_waves b2.age24_6cat b0.gender_male			///
	b2.edu5caty24 b1.hhsize3caty24 b1.erwerb4caty24 	///
	b0.migrationy24 b2.bula								///
	mean_interest mean_leftright

* Coefficient Plot: Determinants of Panel Participation
set scheme white_tableau	
coefplot, drop(_cons) xline(0) xtitle("Number of waves") xlabel(-2(1)4) 	///
	 headings(	1.age24_6cat = "Age in years (ref. 30-39)"					///
		 		1.edu5caty24 = "Education (ref. vocational school)"			///
				2.hhsize3caty24 = "Household size (ref. 1 person)"			///
				2.erwerb4caty24 = "Employment status (ref. employed)"		///
				1.bula = "Federal state (ref. Tyrol)" ) ysize(10)			///
				 mcolor("gs6") ciopts(color(gs6))

* Export graph
graph export "$GRAPHS/coefplot.png", replace

* ------------------------------------------------------------------------------
* END OF FILE
* ------------------------------------------------------------------------------
exit


