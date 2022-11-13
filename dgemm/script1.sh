

echo Enter a compiler gcc or clang
read compiler
make clean
make  CC=$compiler



sudo cpupower -c 3 frequency-set -g performance

taskset -c 3 ./dgemm 100 100 > perf_${compiler}.dat

sed -n '1p;2p' perf_${compiler}.dat > perf_IJK_${compiler}.dat
sed -i '1d' perf_IJK_${compiler}.dat
cut -d';' -f-1,11 perf_IJK_${compiler}.dat > plot_${compiler}.dat

sed -n '1p;3p' perf_${compiler}.dat > perf_IKJ_${compiler}.dat
sed -i '1d' perf_IKJ_${compiler}.dat
cut -d';' -f-1,11 perf_IKJ_${compiler}.dat >> plot_${compiler}.dat

sed -n '1p;4p' perf_${compiler}.dat > perf_IEX_${compiler}.dat
sed -i '1d' perf_IEX_${compiler}.dat
cut -d';' -f-1,11 perf_IEX_${compiler}.dat >> plot_${compiler}.dat

sed -n '1p;5p' perf_${compiler}.dat > perf_UNROLL_${compiler}.dat
sed -i '1d' perf_UNROLL_${compiler}.dat
cut -d';' -f-1,11 perf_UNROLL_${compiler}.dat >> plot_${compiler}.dat

sed -n '1p;6p' perf_${compiler}.dat > perf_UNROLL8_${compiler}.dat
sed -i '1d' perf_UNROLL8_${compiler}.dat
cut -d';' -f-1,11 perf_UNROLL8_${compiler}.dat >> plot_${compiler}.dat

sed -n '1p;7p' perf_${compiler}.dat > perf_CBLAS_${compiler}.dat
sed -i '1d' perf_CBLAS_${compiler}.dat
cut -d';' -f-1,11 perf_CBLAS_${compiler}.dat >> plot_${compiler}.dat



if [ "$compiler" = "gcc" ]; then
    gnuplot plot_gcc_histograms.gp
else
    gnuplot plot_clang_histograms.gp
fi






