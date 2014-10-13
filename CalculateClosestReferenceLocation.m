clear all;
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
load('RefCoordinate.mat');
OptimalCoordinate=zeros(NumofTestIm,K,2);
OptimalImInd=zeros(NumofTestIm,K);
OptimalErrDis=zeros(NumofTestIm,K);
%OptimalImFilename=cell(NumofTestIm,K);
TestImageCoordinates=zeros(NumofTestIm,2);

for j=1:NumofTestIm 
    Filename=['IMG_',num2str(TestImgIndx(j)),'.jpg'];%Define Filename
    TestImageCoordinates(j,:)=GetCoordinatesFromImg(Filename);
    ErrDis=zeros(1,(EndofRefIm-StartofRefIm+1));
   for i=StartofRefIm:EndofRefIm
    %-------------Using Coordinates to Calculate Error Distance
      er=6371000;% earth radius
      arclen=distance('gc',[RefCoordinate(i,1),RefCoordinate(i,2)],[TestImageCoordinates(j,1),TestImageCoordinates(j,2)]);
      len=2*pi*er*arclen/360;%the sphere length between two points
      ErrDis(i-StartofRefIm+1)=len;%Error        
   end
    [B,IX] = sort(ErrDis,'ascend');
    OptimalErrDis(j,:)=B(1:K);
    OptimalImInd(j,:)=IX(1:K)+StartofRefIm-1;
    %OptimalImFilename{j,:}=['streetview',num2str(OptimalImInd(j)),'.jpg'];
    OptimalCoordinate(j,1:K,:)=RefCoordinate(OptimalImInd(j,:),1:2);%Localization Result
end

save('OptimalResults.mat','OptimalCoordinate','TestImageCoordinates','OptimalErrDis','OptimalImInd');


