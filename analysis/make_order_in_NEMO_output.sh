# Make order in output files

path1=/ccc/scratch/cont003/gen7451/burgardc/NEMO_OUT/closcav-jra01/output
path2=/ccc/scratch/cont003/gen7451/burgardc/NEMO_OUT/closcav-jra01/yearly

for yy in {1960..1966}
do
for vv in {scalar,grid_T,grid_U,grid_V,grid_W,icemod,icemod_scalar,ocebudget,SBC}
do
echo $yy $vv
cdo mergetime $path1/closcav-jra01_1m_"$yy"*_"$vv".nc $path2/closcav-jra01_1y_"$yy"_"$vv".nc
done
done