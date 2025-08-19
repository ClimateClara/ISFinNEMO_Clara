path1=/ccc/work/cont003/igcmg/igcmg/IGCM/OCE/NEMO/FORCINGS/MRI-JRA55-do-1-4-0
path2=/ccc/scratch/cont003/gen7451/burgardc/NEMO_IN/INIT_JRA55

for vvar in {u_10,v_10,rsds,rlds,t_10,q_10,precip,snow,slp}
do
for yy in {1957..2023}
do
ln -s $path1/"$vvar"_"$yy".nc $path2/"$vvar"_y"$yy".nc
done
done