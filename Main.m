close all;clear;clc;
%----------parameter settings
pa=parameter;
Testimdir =pa.Testimdir;
Refimdir=pa.Refimdir;
NumofRefIm=pa.NumofRefIm;
NumofTestIm=pa.NumofTestIm;
StartofRefIm=pa.StartofRefIm;
EndofRefIm=pa.EndofRefIm;
TestImgIndx=pa.TestImgIndx;
K=pa.K;
%----------Initilization
NumofMatchPts=zeros(1,NumofRefIm);
%load('WarDrivingReferenceImageCoordinates');
ReferenceImageCoordinates=load('ReferenceImageCoordinates Front camera.txt');
TestImageCoordinates=zeros(NumofTestIm,2);
%load('TestImageCoordinates.mat');
load('SURF_Feature.mat');
ReturnCoordinates=zeros(NumofTestIm,K,2);
ReturnImInd=zeros(NumofTestIm,K);
ErrDis=zeros(NumofTestIm,K);
ReturnMatchedPts=zeros(NumofTestIm,K);
%ReturnImFilename=cell(1,NumofTestIm);

for j=1:NumofTestIm 
    tic
    %----------Extract SURF features
   % Filename=['testimage',num2str(j),'.jpg'];
    Filename=['IMG_',num2str(TestImgIndx(j)),'.jpg'];%Define Filename
    I_Test = imread([Testimdir,Filename]);


    TestImageCoordinates(j,:)=GetCoordinatesFromImg(Filename);
    %----------Find the SURF features.
    points_Test = detectSURFFeatures(I_Test);
          %-------Extract the features
    [f_Test, vpts_Test] = extractFeatures(I_Test, points_Test);
    for i=StartofRefIm:EndofRefIm
    %for i=77:77
   
    % Extract Ref Image feature
    %     points_Ref=detectSURFFeatures(I_Ref);
    %      [f_Ref, vpts_Ref] = extractFeatures(I_Ref, points_Ref);
           %Retrieve the locations of matched points.
           indexPairs = matchFeatures(f_Test, f_Ref{i},'Method','NearestNeighborRatio','MaxRatio',0.7) ;
           matchedPtsTest = vpts_Test(indexPairs(:, 1));
           matchedPtsRef = vpts_Ref{i}(indexPairs(:, 2));
           [tform,inlierPtsTest,inlierPtsRef,status] = estimateGeometricTransform(matchedPtsTest,matchedPtsRef,'similarity');
           NumofMatchPts(i)=length(inlierPtsTest);
           %toc
           %Display matching pts
%             Filename=[num2str(i),'.jpg'];
%                    I_Ref=imread([Refimdir,Filename]);
%                    figure; showMatchedFeatures(I_Test,I_Ref,matchedPtsTest,matchedPtsRef);
%                     %legend('matched points 1','matched points 2');
%                    title('Matched SURF points, including outliers');
%                    figure; showMatchedFeatures(I_Test,I_Ref,inlierPtsTest,inlierPtsRef);
%                     %legend('matched points 1','matched points 2');
%                    title('Matched inlier points');                   
    end
    [B,IX] = sort(NumofMatchPts,'descend');
    ReturnMatchedPts(j,:)=B(1:K);
    ReturnImInd(j,:)=IX(1:K);
    %ReturnImFilename{j}=['streetview',num2str(ReturnImInd(j)),'.jpg'];
    ReturnCoordinates(j,1:K,:)=ReferenceImageCoordinates(ReturnImInd(j,:),1:2);%Localization Result
%-------------Using Coordinates to Calculate Error Distance
      for k=1:K
      ErrDis(j,k)=CalculateEuclideanDisByCoordinates(ReturnCoordinates(j,k,1),ReturnCoordinates(j,k,2),TestImageCoordinates(j,1),TestImageCoordinates(j,2));%Error
      end
     % toc
     
end

save('Results.mat','ReturnCoordinates','TestImageCoordinates','ErrDis','ReturnImInd','TestImgIndx','ReturnMatchedPts');
%save('Results_Crop.mat','ReturnCoordinates','TestImageCoordinates','ErrDis','ReturnImInd','TestImgIndx');
%save('WarDrivingResults.mat','ReturnCoordinates','TestImageCoordinates','ErrDis','ReturnImInd','TestImgIndx');



