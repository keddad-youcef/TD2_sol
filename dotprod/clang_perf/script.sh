paste -d' ' O1_perf/plot_clang.dat O2_perf/plot_clang.dat O3_perf/plot_clang.dat > Oflags_vs.dat
sed -i '1 i Title   O1    O2    O3' Oflags_vs.dat
gnuplot plot_Oflags_vs.gp
