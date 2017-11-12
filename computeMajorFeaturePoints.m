function [mfp] = computeMajorFeaturePoints(ploc,ex)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

refPoints = ploc{ex};
mi = 1;
mfp = [];
for i=1:size(refPoints,1)
    
    refx = refPoints(i,2);
    refy = refPoints(i,1);
    
    count=0;
    
    for j=1:10
        if(j~=ex)
            count = count + nearFeaturePoints(refx,refy,ploc{j},11);
        end
    end
    
    if(count > 4)
        mfp(mi,:) = refPoints(i,:);
        mi = mi+1;
    end
       
end
end
