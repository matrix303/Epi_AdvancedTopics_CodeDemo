******************************************;
*** Data steps;
******************************************;

*** Assigning libraries and creating temporary file;
libname nlsy 'C:\Dropbox\PW\TEACHING\EPIDEMIOLOGY\2023_9690S\5_DATA\NLSY'; 

data review;
set nlsy.NLSY_AllVariables;
run;

*** Review of the content of the data file;
proc contents data=review;                                                                                                                 
run; 

proc print data=review (obs=20);
run;

*** Administrative variables and baseline covariates;
proc freq data=review;
tables cohort sex race;
run;

*** Outcome variable;
* Risk taking behaviour (Age 21);
proc freq data=review;
tables riskA_23 risk1_23 risk2_23 risk3_23 risk4_23 risk5_23 risk6_23;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var riskA_23 risk1_23 risk2_23 risk3_23 risk4_23 risk5_23 risk6_23;
run;

proc corr data=review;
var riskA_23 risk1_23 risk2_23 risk3_23 risk4_23 risk5_23 risk6_23;
run;

*** Predictors;
* Home environment (Age 7-13);
proc freq data=review;
tables home_7 home_9 home_11 home_13;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var home_7 home_9 home_11 home_13;
run;

proc corr data=review;
var home_7 home_9 home_11 home_13;
run;

* Math achievement (Age 7-13);
proc freq data=review;
tables math_7 math_9 math_11 math_13;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var math_7 math_9 math_11 math_13;
run;

proc corr data=review;
var math_7 math_9 math_11 math_13;
run;

* School satisfaction and safty (Age 13);
proc freq data=review;
tables shsat_13 shsft_13;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var shsat_13 shsft_13;
run;

proc corr data=review;
var shsat_13 shsft_13;
run;

* School attitude (Age 17-13);
proc freq data=review;
tables shatA_17 shat1_17 shat2_17 shat3_17 shat4_17 shat5_17 shat6_17 shat7_17 shat8_17 shat9_17;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var shatA_17 shat1_17 shat2_17 shat3_17 shat4_17 shat5_17 shat6_17 shat7_17 shat8_17 shat9_17;
run;

proc corr data=review;
var shatA_17 shat1_17 shat2_17 shat3_17 shat4_17 shat5_17 shat6_17 shat7_17 shat8_17 shat9_17;
run;

* Mastery (Age 17);
proc freq data=review;
tables mastA_17 mast1_17 mast2_17 mast3_17 mast4_17 mast5_17 mast6_17 mast7_17;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var mastA_17 mast1_17 mast2_17 mast3_17 mast4_17 mast5_17 mast6_17 mast7_17;
run;

proc corr data=review;
var mastA_17 mast1_17 mast2_17 mast3_17 mast4_17 mast5_17 mast6_17 mast7_17;
run;

* Mastery (Age 21);
proc freq data=review;
tables mastA_21 mast1_21 mast2_21 mast3_21 mast4_21 mast5_21 mast6_21 mast7_21;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var mastA_21 mast1_21 mast2_21 mast3_21 mast4_21 mast5_21 mast6_21 mast7_21;
run;

proc corr data=review;
var mastA_21 mast1_21 mast2_21 mast3_21 mast4_21 mast5_21 mast6_21 mast7_21;
run;

* Depressive symptoms (Age 17);
proc freq data=review;
tables cesA_17 ces1_17 ces2_17 ces3_17 ces4_17 ces5_17 ces6_17 ces7_17;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var cesA_17 ces1_17 ces2_17 ces3_17 ces4_17 ces5_17 ces6_17 ces7_17;
run;

proc corr data=review;
var cesA_17 ces1_17 ces2_17 ces3_17 ces4_17 ces5_17 ces6_17 ces7_17;
run;

* Depressive symptoms (Age 21);
proc freq data=review;
tables cesA_21 ces1_21 ces2_21 ces3_21 ces4_21 ces5_21 ces6_21 ces7_21;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var cesA_21 ces1_21 ces2_21 ces3_21 ces4_21 ces5_21 ces6_21 ces7_21;
run;

proc corr data=review;
var cesA_21 ces1_21 ces2_21 ces3_21 ces4_21 ces5_21 ces6_21 ces7_21;
run;

* Drinking (Age 21);
proc freq data=review;
tables drunk_21;
run;

proc means data=review n nmiss mean median min max var stddev kurt skew;
var drunk_21;
run;

*** Creating Mplus data file;
* File review;
proc print data=nlsy.NLSY_AllVariables(obs=20);
run;

* Recoding missing values;
data missing; 
set nlsy.NLSY_AllVariables;
array allvars _numeric_ ;
do over allvars;
if missing(allvars) then allvars = -99999;
end;
run;

* Verification;
proc print data=missing(obs=20);
run;

* Saving text file;
proc export data=missing outfile='C:\Dropbox\PW\TEACHING\EPIDEMIOLOGY\2023_9690S\5_DATA\NLSY\NLSY_AllVariables.dat' dbms=dlm replace;
run;

*****************************************;
* List of variables;
*****************************************
id_ch weight_n cohort sex race 
home_7 home_9 home_11 home_13 
math_7 math_9 math_11 math_13 
shsat_13 
shsft_13 
shat1_17 shat2_17 shat3_17 shat4_17 shat5_17 shat6_17 shat7_17 shat8_17 shat9_17 shatA_17 
mast1_17 mast2_17 mast3_17 mast4_17 mast5_17 mast6_17 mast7_17 mastA_17 
mast1_21 mast2_21 mast3_21 mast4_21 mast5_21 mast6_21 mast7_21 mastA_21 
ces1_17 ces2_17 ces3_17 ces4_17 ces5_17 ces6_17 ces7_17 cesA_17 
ces1_21 ces2_21 ces3_21 ces4_21 ces5_21 ces6_21 ces7_21 cesA_21 
risk1_23 risk2_23 risk3_23 risk4_23 risk5_23 risk6_23 riskA_23 
drunk_21 
*****************************************;

*** Descriptive statistics for verification;
* Correlations - listwise deletion;
proc corr data=nlsy.NLSY_AllVariables nomiss cov;
var sex home_11 math_13 mastA_17 cesA_21 drunk_21 riskA_23;
run;

* Means - all values;
proc means data=nlsy.NLSY_AllVariables n nmiss mean;
var sex home_11 math_13 mastA_17 cesA_21 drunk_21 riskA_23;
run;

* Assessment of missing values;
data nomissing;
set nlsy.NLSY_AllVariables;
no_miss = nmiss(sex, home_11, math_13, mastA_17, cesA_21, drunk_21, riskA_23);
run;

proc freq data=nomissing;
tables no_miss;
run;

* Means - listwise deleted;
proc means data=nomissing n nmiss mean;
var sex home_11 math_13 mastA_17 cesA_21 drunk_21 riskA_23;
where no_miss = 0;
run;

*****************************************;
*** End;
*****************************************
