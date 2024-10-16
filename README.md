# build_NEMO_mask.ipynb

*inputs*: 
- Justine magic file
- NEMO mesh mask

*output*:
- NEMO magic file with ice shelf and front id on the NEMO grid
   - extrapolated
   - masked (compatible with the NEMO mesh mask)
   - front id (compatible with the NEMO mesh mask)
   - Array independant of the NEMO grid present in the Justine's magic file

*method*
- nearest interpolation

*TODO*
- add bedmachine floating fraction in Justine magic file
- add the conservatively interpolated floating fraction in the NEMO magic file
- add zmin / zmax array for each ice shelves
