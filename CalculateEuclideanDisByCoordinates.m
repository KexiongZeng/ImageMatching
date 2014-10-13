function len=CalculateEuclideanDisByCoordinates(latitude1,longitude1,latitude2,longitude2)    
er=6371000;% earth radius
      arclen=distance('gc',[latitude1,longitude1],[latitude2,longitude2]);
      len=2*pi*er*arclen/360;%the sphere length between two points