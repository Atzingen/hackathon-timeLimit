function eventhandlerCreated(source,arg)
global gray Im1 Im2 hist
disp('Arquivo novo')
cd('C:\hackathon\server\upload\')
listDir = dir;
listDir=listDir(~ismember({listDir.name},{'.','..'}));
names = {listDir.name}.';
filename=cell2mat(names(1));
Im1=imread(filename);
movefile(filename,'C:\hackathon');
gray = rgb2gray(Im1);
hist=imhist(gray);
hist_max = 0;
hist_index = 0;
for i=1:256
    if hist(i) > hist_max
        hist_max = hist(i);
        hist_index = i-1;
    end
end
if hist_index > 220
    imwrite(Im1,'C:\hackathon\server\static\img\resultado-0.jpeg');
else 
    h_sobel = fspecial('sobel');
    Im1_sh = imfilter(gray,h_sobel);
    Im1_sv = imfilter(gray,h_sobel'); 
    Im2_ss = abs(Im1_sh) + abs(Im1_sv);
    Im2 = gray-Im2_ss;
    imwrite(Im2,'C:\hackathon\server\static\img\resultado-1.jpeg');
    cd('C:\hackathon');
    AgroVisao
end
clear listDir names filename