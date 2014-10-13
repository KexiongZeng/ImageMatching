close all;clear;clc;
%----------parameter settings
% pa=parameter;
% Testimdir =pa.Testimdir;
% Refimdir=pa.Refimdir;
% NumofRefIm=pa.NumofRefIm;
% NumofTestIm=pa.NumofTestIm;
% StartofRefIm=pa.StartofRefIm;
% EndofRefIm=pa.EndofRefIm;
% %----------Initilization
% NumofMatchPts=zeros(1,NumofRefIm);
% load('RefCoordinate.mat');
% %TestCoordinate=load('TestImageCoordinates.txt');
% load('TestImageCoordinates.mat');
% load('SURF_Feature.mat');
% ReturnCoordinate=zeros(NumofTestIm,2);
% ReturnImInd=zeros(1,NumofTestIm);
% ErrDis=zeros(1,NumofTestIm);
% ReturnImFilename=cell(1,NumofTestIm);
% 
% for j=4:4 %Define Filename
%     tic
%     %----------Extract SURF features
%    % Filename=['testimage',num2str(j),'.jpg'];
%     Filename=['IMG_',num2str(j+1438),'.jpg'];
%     I_Test = imread([Testimdir,Filename]);
%     %----------Find the SURF features.
%        points_Test = detectSURFFeatures(I_Test);
%           %-------Extract the features
%           [f_Test, vpts_Test] = extractFeatures(I_Test, points_Test);
%     for i=99:99
%     %for i=77:77
%         I_Ref=imread([Refimdir,'streetview99.jpg']);
%         points_Ref=detectSURFFeatures(I_Ref);
%          [f_Ref, vpts_Ref] = extractFeatures(I_Ref, points_Ref);
%            %Retrieve the locations of matched points.
%            indexPairs = matchFeatures(f_Test, f_Ref,'Method','NearestNeighborRatio','MaxRatio',0.7) ;
%            [m,n]=size(indexPairs);
%            NumofMatchPts(i)=m;
%            %toc
%     end
%     [B,IX] = sort(NumofMatchPts,'descend');
%     ReturnImInd(j)=IX(1);
%     ReturnImFilename{j}=['streetview',num2str(ReturnImInd(j)),'.jpg'];
%     ReturnCoordinate(j,:)=RefCoordinate(IX(1),1:2);%Localization Result
% %-------------Using Coordinates to Calculate Error Distance
%       er=6371000;% earth radius
%       arclen=distance('gc',[ReturnCoordinate(j,1),ReturnCoordinate(j,2)],[TestImageCoordinates(j,1),TestImageCoordinates(j,2)]);
%       len=2*pi*er*arclen/360;%the sphere length between two points
%       ErrDis(j)=len;%Error
     % toc
     
     %Display the matching points
%      I_Ref = imread([Refimdir,'streetview77.jpg']);
%    matched_pts1 = vpts_Test(indexPairs(:, 1));
%    matched_pts2 = vpts_Ref{i}(indexPairs(:, 2));
%     figure; showMatchedFeatures(I_Test,I_Ref,matched_pts1,matched_pts2);
%    legend('matched points 1','matched points 2');
% end

% original  = imread('cameraman.tif'); imshow(original); title('Base image');
% distorted = imresize(original, 0.7); distorted = imrotate(distorted, 31);
% figure; imshow(distorted); title('Transformed image');
% 
% %Detect and extract features from both images.
% 
% ptsOriginal  = detectSURFFeatures(original);
% ptsDistorted = detectSURFFeatures(distorted);
% [featuresOriginal,   validPtsOriginal] = extractFeatures(original,  ptsOriginal);
% [featuresDistorted, validPtsDistorted] = extractFeatures(distorted, ptsDistorted);
% 
% %Match features.
% 
% index_pairs = matchFeatures(featuresOriginal, featuresDistorted);
% matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1));
% matchedPtsDistorted = validPtsDistorted(index_pairs(:,2));
% figure; showMatchedFeatures(original,distorted,matchedPtsOriginal,matchedPtsDistorted);
% title('Matched SURF points, including outliers');
% 
% %Exclude the outliers, and compute the transformation matrix.
% 
% [tform,inlierPtsDistorted,inlierPtsOriginal] = estimateGeometricTransform(matchedPtsDistorted,matchedPtsOriginal,'similarity');
% figure; showMatchedFeatures(original,distorted,inlierPtsOriginal,inlierPtsDistorted);
% title('Matched inlier points');
% 
% %Recover the original image from the distorted image.
% 
% outputView = imref2d(size(original));
% Ir = imwarp(distorted, tform, 'OutputView', outputView);
% figure; imshow(Ir); title('Recovered image');
ReferenceImageCoordinates=TestImageCoordinates;
save('WarDrivingReferenceImageCoordinates','ReferenceImageCoordinates');
