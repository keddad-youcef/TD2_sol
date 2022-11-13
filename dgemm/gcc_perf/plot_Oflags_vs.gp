O1 = "#4671d5"; O2 = "#ff0000"; O3 = "#99ffff";
set title "Flag Optimization Comparaison (Gcc)"
set ylabel 'Vitesse MIB/s'
set auto x
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9
set xtic scale 0
plot 'Oflags_vs.dat' using 2:xtic(1) ti col fc rgb O1, '' u 4 ti col fc rgb O2, '' u 6 ti col fc rgb O3
pause -1
