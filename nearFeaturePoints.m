function [binary_count] = nearFeaturePoints(refx,refy,pl,windowsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

binary_count = 0;
count = 0;
halfWindowSize = floor(windowsize/2);
for i = 1:size(pl,1)
    
    r = pl(i,1);
    c = pl(i,2);
    
    if((r>=refx-halfWindowSize && r<=refx+halfWindowSize)&&(c>=refy-halfWindowSize && c<=refy+halfWindowSize))
        count  = count + 1;
    end
    
end

if(count>=1)
    binary_count = 1;
end

end

