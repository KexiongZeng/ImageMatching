clear all;
pa=parameter;
NumofTestIm=pa.NumofTestIm;
load('TestImageCoordinates.mat');
DistanceInterval=zeros(1,NumofTestIm-1);
for i=1:NumofTestIm-1
   Coordinate_A=TestImageCoordinates(i,:);
   Coordinate_B=TestImageCoordinates(i+1,:);
   %-------------Using Coordinates to Calculate Error Distance
      er=6371000;% earth radius
      arclen=distance('gc',[Coordinate_A(1),Coordinate_A(2)],[Coordinate_B(1),Coordinate_B(2)]);
      len=2*pi*er*arclen/360;%the sphere length between two points
      DistanceInterval(i)=len;%Error
end
