%Preprocessing
%Elapsed time is 24.370671 seconds for 138 images.
close all;clear;clc;
 %----------parameter settings
pa=parameter;
Refimdir=pa.Refimdir;
NumofRefIm=pa.NumofRefIm;
TestImgIndx=pa.TestImgIndx;
%---------Initialization
f_Ref=cell(1,NumofRefIm);
vpts_Ref=cell(1,NumofRefIm);
tic
for i=1:NumofRefIm
     %Filename=['IMG_',num2str(TestImgIndx(i)),'.jpg'];
    Filename=[num2str(i),'.jpg'];
    I_Ref=imread([Refimdir,Filename]);
    %I_Ref=rgb2gray(I_Ref);
    %I_Ref = imcrop(I_Ref,[410 0 1265  880]);
    figure; imshow(I_Ref); 
    points_Ref=detectSURFFeatures(I_Ref);
    [f_Ref{i}, vpts_Ref{i}] = extractFeatures(I_Ref, points_Ref);
end
toc
save('SURF_Feature.mat','f_Ref','vpts_Ref');