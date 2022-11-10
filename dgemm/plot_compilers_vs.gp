clang = "#4671d5"; gcc = "#ff0000";
set title "Compilers performance compare"
clang = "#4671d5"; gcc = "#ff0000";
set auto x
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9
set xtic scale 0
plot 'compilers_vs.dat' using 2:xtic(1) ti col fc rgb gcc, '' u 4 ti col fc rgb clang
pause -1
