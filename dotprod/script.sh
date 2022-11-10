echo Enter a compiler gcc or clang
read compiler
make clean
make  CC=$compiler



sudo cpupower -c 3 frequency-set -g performance

taskset -c 3 ./dotprod 100 100 > perf_${compiler}.dat

sed -n '1p;2p' perf_${compiler}.dat > perf_BASE_${compiler}.dat
sed -i '1d' perf_BASE_${compiler}.dat
cut -d';' -f-1,12 perf_BASE_${compiler}.dat > plot_${compiler}.dat


sed -n '1p;3p' perf_${compiler}.dat > perf_UNROLL8_${compiler}.dat
sed -i '1d' perf_UNROLL8_${compiler}.dat
cut -d';' -f-1,12 perf_UNROLL8_${compiler}.dat >> plot_${compiler}.dat


if [ "$compiler" = "gcc" ]; then
    gnuplot plot_gcc_histograms.gp
else
    gnuplot plot_clang_histograms.gp
fi
