data baseball;
input Team $ Payroll Wins @@;
datalines;
NYY 206 95 BOS 162 89 CHC 146 75 PHI 142 97 NYM 134 79 DET 123 81 CHW 106 88
LAA 105 80 SF 99 92 MIN 98 94 LAD 95 80 HOU 92 76 SEA 86 61 STL 86 86 
ATL 84 91 COL 84 83 BAL 82 66 MIL 81 77 TB 72 96 CIN 71 91 KC 71 67 TOR 62 85
ARZ 61 65 CLE 61 69 WAS 61 69 FA 57 80 TEX 55 90 OAK 52 81 SD 38 90 PIT 35 57
;
run;
proc print data = baseball;
run;
symbol1 v=star i = rl;
proc gplot;
plot Wins * Payroll;
run;
proc corr data = baseball;
var Payroll Wins;
title "Correlation Between Team Payroll and Number of Wins (without SD)";
run;
data baseball_2;
input Team $ Payroll Wins @@;
datalines;
NYY 206 95 BOS 162 89 CHC 146 75 PHI 142 97 NYM 134 79 DET 123 81 CHW 106 88
LAA 105 80 SF 99 92 MIN 98 94 LAD 95 80 HOU 92 76 SEA 86 61 STL 86 86 
ATL 84 91 COL 84 83 BAL 82 66 MIL 81 77 TB 72 96 CIN 71 91 KC 71 67 TOR 62 85
ARZ 61 65 CLE 61 69 WAS 61 69 FA 57 80 TEX 55 90 OAK 52 81 PIT 35 57
;
run;
proc print data = baseball_2;
run;
symbol1 v = star i = rl;
proc gplot;
plot Wins * Payroll;
run;
proc corr data = baseball_2;
var Payroll Wins;
title "Correlation Between Team Payroll and Number of Wins";
proc reg data = baseball;
model Wins = Payroll / r cli clm;
run;
