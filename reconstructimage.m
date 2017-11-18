function rim = reconstructimage( gIm,mfp, nmfp, globalmatrix,mindex )

maxnmfp = nmfp{1,mindex};
rim = gIm(:,:,mindex);
windowsize = 5;
window = 11;
for i=1:size(maxnmfp,1)
    for j=1:size(nmfp,1)
        if j~= mindex && nearFeaturePoints(maxnmfp(i,2),maxnmfp(i,1),nmfp{1,j},window) == 0 && nearFeaturePoints(maxnmfp(i,2),maxnmfp(i,1),mfp{1,j},window) == 1
            c = round(maxnmfp(i,2));
            r = round(maxnmfp(i,1));
            lr = max(r-windowsize,0);
            rr = min(r+windowsize,size(gIm,1));
            lc = max(c-windowsize,0);
            rc = min(c+windowsize,size(gIm,2));
            rim(lr:rr,lc:rc) = gIm(lr:rr,lc:rc,j);
            break
        end
    end
end

gmr = size(globalmatrix,1);
gmc = size(globalmatrix,2);

for y=1:gmr
    for x=1:gmc
        if globalmatrix(y,x) == 1
            for j=1:size(nmfp,1)
                if j~= mindex && nearFeaturePoints(maxnmfp(i,2),maxnmfp(i,1),nmfp{1,j},window) == 0 && nearFeaturePoints(maxnmfp(i,2),maxnmfp(i,1),mfp{1,j},window) == 1
                    c = round(maxnmfp(i,2));
                    r = round(maxnmfp(i,1));
                    lr = max(r-windowsize,0);
                    rr = min(r+windowsize,size(gIm,1));
                    lc = max(c-windowsize,0);
                    rc = min(c+windowsize,size(gIm,2));
                    rim(lr:rr,lc:rc) = gIm(lr:rr,lc:rc,j);
                    break
                end
            end
        end
    end
end

end

