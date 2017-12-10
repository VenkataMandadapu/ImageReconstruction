# ImageReconstruction

Problem Statement:
Generate and un obstructed view of an object of interest (like a statue or building) from a set of partially obstructed views.

Methodology:
1. Get template of the region in which the object is present – region of interest.
2. Extract the region of interest from all the partially obstructed images – Using Template Matching with NCC measure. 
3. Get interest points for all the partially obstructed regions of interest.
4. Label the interest points as ‘Major’ and ‘Non-Major’ in all the regions of interest.
5. Select the image with maximum number of Major Interest Points as the reference image and perform reconstruction on this image.  
