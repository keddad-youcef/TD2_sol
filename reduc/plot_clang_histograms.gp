set style data histograms
set title "CLANG Comparaison by version"
set ylabel 'SIZE in MIB/s'
set style fill solid
plot './plot_clang.dat' using 2:xtic(1) linecolor 'blue' title 'CLANG'
pause -1
