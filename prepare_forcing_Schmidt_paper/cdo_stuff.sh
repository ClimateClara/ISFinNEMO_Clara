

path1=/data/cburgard/PREPARE_FORCING/PREPARE_CAVITY_MASKS/raw
path2=/data/cburgard/PREPARE_FORCING/PREPARE_PRESCRIBED_MELT/interim
path3=/data/cburgard/PREPARE_FORCING/PREPARE_PRESCRIBED_MELT/Schmidt_stuff
path4=/data/cburgard/PREPARE_FORCING/PREPARE_PRESCRIBED_MELT

# regrid BedMachine on 0.5 degree grid
cdo remapbil,$path4/grid_05degrees.txt -selname,bed $path1/BedMachineAntarctica-v3.nc $path3/BedMachine3_bathy_05degrees.nc
cdo remapnn,$path4/grid_05degrees.txt -selname,mask $path1/BedMachineAntarctica-v3.nc $path3/BedMachine3_mask_05degrees.nc

# remap IMBIE basins from Justine file to 0.5 grid
cdo remapnn,$path4/grid_05degrees.txt -selname,Iceshelf_extrap $path1/Mask_Iceshelf_IMBIE2_v2.nc $path3/Iceshelf_extrap_05degrees.nc