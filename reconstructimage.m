function rim = reconstructimage( gIm,mfp, nmfp, globalmatrix,mindex)


%maxnmfp = nmfp{mindex};
maxnmfp = nmfp{mindex};

%rim = gIm(:,:,mindex);
rim = gIm(:,:,mindex);

% imshow(rim);
% hold on;
% scatter(maxnmfp(:,1),maxnmfp(:,2),'g+');
% pause;


window =19;
windowsize = floor(window/2);

for i=1:size(maxnmfp,1)
    for j=1:size(nmfp,1)
        if (j~=mindex &&...
                nearFeaturePoints(maxnmfp(i,2),maxnmfp(i,1),nmfp{1,j},window) == 0)
            r = round(maxnmfp(i,2));
            c = round(maxnmfp(i,1));
            lr = max(r-windowsize,1);
            rr = min(r+windowsize,size(rim,1));
            lc = max(c-windowsize,1);
            rc = min(c+windowsize,size(rim,2));
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
                if (j~=mindex &&...
                        nearFeaturePoints(maxnmfp(i,2),maxnmfp(i,1),nmfp{1,j},window) == 0)
                    r = round(maxnmfp(i,2));
                    c = round(maxnmfp(i,1));
                    lr = max(r-windowsize,1);
                    rr = min(r+windowsize,size(rim,1));
                    lc = max(c-windowsize,1);
                    rc = min(c+windowsize,size(rim,2));
                    rim(lr:rr,lc:rc) = gIm(lr:rr,lc:rc,j);
                    break
                end
            end
        end
    end
end

end

