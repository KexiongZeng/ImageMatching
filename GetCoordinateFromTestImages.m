%GetCoordinateFromTestImages
pa=parameter;
Testimdir =pa.Testimdir;
NumofTestIm=pa.NumofTestIm;

TestImageCoordinates=zeros(NumofTestIm,2);
TestImageFilename=cell(1,NumofTestIm);
indx=1;
for i=1439:1500
    %Filename=['testimage',num2str(i),'.jpg'];
    Filename=['IMG_',num2str(i),'.jpg'];
    TestImageFilename{indx}=Filename;
    info = imfinfo([Testimdir,Filename]);
    if( info.GPSInfo.GPSLatitudeRef=='N')
        TestImageCoordinates(indx,1)=info.GPSInfo.GPSLatitude(1)+info.GPSInfo.GPSLatitude(2)/60+info.GPSInfo.GPSLatitude(3)/3600;%Convert to decimal
    else
         TestImageCoordinates(indx,1)=-(info.GPSInfo.GPSLatitude(1)+info.GPSInfo.GPSLatitude(2)/60+info.GPSInfo.GPSLatitude(3)/3600);
    end
    
    if( info.GPSInfo.GPSLongitudeRef=='E')
        TestImageCoordinates(indx,2)=info.GPSInfo.GPSLongitude(1)+info.GPSInfo.GPSLongitude(2)/60+info.GPSInfo.GPSLongitude(3)/3600;%Convert to decimal
    else
         TestImageCoordinates(indx,2)=-(info.GPSInfo.GPSLongitude(1)+info.GPSInfo.GPSLongitude(2)/60+info.GPSInfo.GPSLongitude(3)/3600);
    end
    indx=indx+1;
end

save('TestImageCoordinates.mat','TestImageCoordinates','TestImageFilename');