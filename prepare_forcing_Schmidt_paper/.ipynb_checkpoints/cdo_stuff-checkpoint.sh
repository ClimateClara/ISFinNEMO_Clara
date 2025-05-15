

path1=/data/cburgard/PREPARE_FORCING/PREPARE_CAVITY_MASKS/raw
path2=/data/cburgard/PREPARE_FORCING/PREPARE_PRESCRIBED_MELT/interim
path3=/data/cburgard/PREPARE_FORCING/PREPARE_PRESCRIBED_MELT/Schmidt_stuff
path4=/data/cburgard/PREPARE_FORCING/PREPARE_PRESCRIBED_MELT

# regrid BedMachine on 0.5 degree grid
cdo remapbil,$path4/grid_05degrees.txt $path1/BedMachineAntarctica-v3.nc $path3/BedMachine3_05degrees.nc