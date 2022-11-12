paste -d' ' gcc_perf/O3_perf/plot_gcc.dat clang_perf/O3_perf/plot_clang.dat > compilers_vs.dat
sed -i '1 i Title   GCC    CLANG ' compilers_vs.dat
gnuplot plot_compilers_vs.gp
