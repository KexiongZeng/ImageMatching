source_dir = 'C:\Users\Kexiong Zeng\Documents\GitHub\ImageMatching\Reference Images 90 Camera\';
source_files = dir(fullfile(source_dir, '*.png'));
FileNum=length(source_files);
cd(source_dir);
for c=1:FileNum
         oldname=source_files(c).name;
         A = imread(oldname);
          newname=[num2str(c+24),'.jpg'];
       imwrite(A,newname,'jpg');
end