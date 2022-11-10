set style data histograms
set title "GCC Comparaison by version"
set ylabel 'SIZE in MIB/s'
set style fill solid
plot './plot_gcc.dat' using 2:xtic(1) linecolor 'blue' title 'GCC'
pause -1

