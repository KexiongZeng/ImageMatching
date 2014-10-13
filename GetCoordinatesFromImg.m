function Coordinates=GetCoordinatesFromImg(Filename)
Coordinates=zeros(1,2);
pa=parameter;
Testimdir =pa.Testimdir;
info = imfinfo([Testimdir,Filename]);
    if( info.GPSInfo.GPSLatitudeRef=='N')
        Coordinates(1)=info.GPSInfo.GPSLatitude(1)+info.GPSInfo.GPSLatitude(2)/60+info.GPSInfo.GPSLatitude(3)/3600;%Convert to decimal
    else
         Coordinates(1)=-(info.GPSInfo.GPSLatitude(1)+info.GPSInfo.GPSLatitude(2)/60+info.GPSInfo.GPSLatitude(3)/3600);
    end
    
    if( info.GPSInfo.GPSLongitudeRef=='E')
        Coordinates(2)=info.GPSInfo.GPSLongitude(1)+info.GPSInfo.GPSLongitude(2)/60+info.GPSInfo.GPSLongitude(3)/3600;%Convert to decimal
    else
         Coordinates(2)=-(info.GPSInfo.GPSLongitude(1)+info.GPSInfo.GPSLongitude(2)/60+info.GPSInfo.GPSLongitude(3)/3600);
    end
