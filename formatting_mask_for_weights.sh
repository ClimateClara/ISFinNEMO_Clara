file1=/ccc/work/cont003/gen7451/burgardc/ISF_FORCING/eORCA1.4.3_OpenSeas_Open6largestISF_ModStraights_domain_cfg.nc #=> mask_opensea (1 ocean 0 land)
file2=/ccc/work/cont003/gen7451/burgardc/TMP/MOSAIX/eORCA1.4.2xICO40/masks_eORCA1.4.2xICO40_v3.nc #=> torc.mask (1 land, 0 ocean)

cdo eqc,0 -selvar,mask_opensea $file1 /ccc/work/cont003/gen7451/burgardc/ISF_FORCING/inverted_mask_opensea.nc

cdo setname,torc.mask /ccc/work/cont003/gen7451/burgardc/ISF_FORCING/inverted_mask_opensea.nc /ccc/work/cont003/gen7451/burgardc/ISF_FORCING/masks_eORCA1.4.2xICO40_v3_with6isfcav.nc

cdo merge -setname,torc.mask -chname,y,y_grid_T -chname,x,x_grid_T /ccc/work/cont003/gen7451/burgardc/ISF_FORCING/inverted_mask_opensea.nc -selvar,oico.msk,tico.msk,OceMask,OceFrac /ccc/work/cont003/gen7451/burgardc/masks_eORCA1.4.2xICO40.nc /ccc/work/cont003/gen7451/burgardc/ISF_FORCING/masks_eORCA1.4.2xICO40_with6isfcav.nc