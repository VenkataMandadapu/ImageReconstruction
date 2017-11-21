function [binary_count] = nearFeaturePoints(refx,refy,block,windowsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

binary_count = 0;
count = 0;
halfWindowSize = floor(windowsize/2);

for i = 1:size(block,1)
    
    r = block(i,2);
    c = block(i,1);
    
    if((r>=refx-halfWindowSize && r<=refx+halfWindowSize)&&...
            (c>=refy-halfWindowSize && c<=refy+halfWindowSize))
        count  = count + 1;
    end
    
end

if(count>=1)
    binary_count = 1;
end

end

