% %% generating the region of interest

% T = imread('template.JPG');
% 
% 
% for i = 1:10
%     name = strcat('set1_',int2str(i+1),'.JPG');
%     S = imread(name);
%     S = imrotate(imresize(S,0.25),-90); 
%     [corrScore, boundingBox] = corrMatching(S,T,0);
% %     imagesc(S);
% %     hold on;
% %     rectangle('Position',[boundingBox(1,2),boundingBox(1,1),boundingBox(1,4),boundingBox(1,3)]);
% %     hold off;
%       cropped_image = imcrop(S,[boundingBox(1,2),boundingBox(1,1),boundingBox(1,4)+10,boundingBox(1,3)]);
%       %imagesc(cropped_image);
%       imwrite(cropped_image,strcat('set1_',int2str(i+1),'_roi.JPG'));
% end
% 


%% Experiment with feature point selection

clear all;
Imcount = 10;
pl{Imcount,1} = [];
for i=1:Imcount
    filename = ['/Users/venkatamandadapu/CVProj/code/images/set1_',int2str(i+1),'_roi.jpg'];
    Img(:,:,:,i) = imread(filename);
    gIm(:,:,i) = rgb2gray(Img(:,:,:,i));
    fp = detectHarrisFeatures(gIm(:,:,i));
    [features,points] = extractFeatures(gIm(:,:,i),fp);
    pl{i} = points.Location;
end

for i=1:Imcount
    [mfp{i},nmfp{i}] = computeMajorFeaturePoints(pl,i);
end

% for i=1:Imcount
%     MFP = mfp{i};
%     I = imshow(Img(:,:,:,i));
%     hold on;
%     scatter(MFP(:,1),MFP(:,2),'g+');
%     saveas(gcf,['set1_',int2str(i+1),'_mfp.jpg']);
% end

[mfpmaxsize,mfpmaxindex] = max(cellfun('size', mfp, 1));
