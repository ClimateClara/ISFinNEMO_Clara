# Create the grid for eORCA1

# from here : https://forge.ipsl.jussieu.fr/nemo/wiki/Users/SetupNewConfiguration/cdo-interpolation#PreparegriddescriptionfilefortheORCAcurvilineargrid

path1=/data/cburgard/PREPARE_FORCING/PREPARE_CAVITY_MASKS/raw/eORCA1.4.3_OpenSeas_OpenAllCav_ModStraights/

#  There is an example of nco commands to create this file from coordinates.nc (input file used by NEMO for its grid description)
# select glamt and gphit variables from the coordinates file
ncks -O -C -a -v glamt,gphit $path1/coordinates.nc grid_eORCA1_T.nc

#make sure that coordinates variables contains only 2 dimension. Use ncwa -a to remove degenerated dimensions (with a size of 1) for example:

# remove degenerated dimension time (if existing)
ncwa -O -a t grid_eORCA1_T.nc  grid_eORCA1_T.nc
# remove degenerated dimention z (if existing)
ncwa -O -a z grid_eORCA1_T.nc  grid_eORCA1_T.nc

# add a dummy variable
ncap2 -O -s 'dummy[y,x]=1b' grid_eORCA1_T.nc grid_eORCA1_T.nc
# add needed attributes
ncatted -a coordinates,dummy,c,c,'glamt gphit' \
        -a units,glamt,c,c,'degrees_east'      \
        -a units,gphit,c,c,'degrees_north'  grid_eORCA1_T.nc


ncks -v nav_lat,nav_lon,bounds_nav_lon,bounds_nav_lat,deptht,deptht_bounds,e3t,time_counter /data/cburgard/CASIMIR_SIMU/raw/n42openc/n42openc_00910101_01001231_1Y_grid_T.nc NEMO_gridT_eORCA1_cdo.nc

ncatted -a _CoordinateAxisType,dummy,d,, IMBIE_2km_stereo_withbnds.nc
ncatted -a coordinates,dummy,c,c,lon lat IMBIE_2km_stereo_withbnds.nc
ncatted -a bounds,dummy,d,, IMBIE_2km_stereo_withbnds.nc
ncks -v dummy toto.nc IMBIE_2km_stereo_withbnds.nc
ncrename -v lon,dummy toto.nc
ncks -v lon IMBIE_2km_stereo_withbnds.nc toto.nc

ncatted -O -a ,global,d,, IMBIE_2km_stereo_withbnds.nc IMBIE_2km_stereo_withbnds.nc
ncap2 -O -s dummy[y,x]=1b IMBIE_2km_stereo_withbnds.nc IMBIE_2km_stereo_withbnds.nc
ncatted -a coordinates,dummy,c,c,"lon lat" -a units,lon,c,c,"degreeE" -a units,lat,c,c,"degreeN" IMBIE_2km_stereo_withbnds.nc


ncatted -O -a ,global,d,, NEMO_grid_withbnds.nc NEMO_grid_withbnds.nc
ncap2 -O -s dummy[y,x]=1b NEMO_grid_withbnds.nc NEMO_grid_withbnds.nc
ncatted -a coordinates,dummy,c,c,"lon lat" -a units,lon,c,c,"degreeE" -a units,lat,c,c,"degreeN" NEMO_grid_withbnds.nc
