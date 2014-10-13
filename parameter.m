%----------parameter settings
function pa=parameter
%pa.Testimdir = 'C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\Test Images\';
%pa.Testimdir ='C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\UMall War Driving 6_12_2014\';
pa.Testimdir ='C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\UMall War Driving 45 Camera 6_16_2014\';
%pa.Refimdir='C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\Reference Images\';
pa.Refimdir='C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\Reference Images 45 Camera\';
%pa.Refimdir='C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\New\';
pa.StartofRefIm=1;
pa.EndofRefIm=24;
pa.NumofRefIm=pa.EndofRefIm-pa.StartofRefIm+1;%Number of reference images in the database
%pa.TestImgIndx=[1440,1444,1448,1451,1454,1458,1461,1464,1467,1470,1474,1478,1482,1486,1491,1494,1497];
pa.TestImgIndx=2976:2993;
pa.NumofTestIm=length(pa.TestImgIndx);
pa.K=3; % K nearest neighbor