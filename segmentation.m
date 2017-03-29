%% Read Image
imagen=imread('C:\Users\UddhavBhosle\Desktop\CAPTCHA\cap3.png');
%%space
sp=10;
%% Show image
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%imagen = imclose(imagen, strel('rectangle',[3 ceil(Sp/2)]));
w=ones(3);
imagen=imdilate(imagen,w);
imagen=imerode(imagen,w);
%% Remove all object containing fewer than 100 pixels
imagen = bwareaopen(imagen,1200);
pause(1)
%% Show image binary image
figure(2)
imshow(~imagen);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction
%%figure
 pathname = 'C:\Users\UddhavBhosle\Desktop\CAPTCHA\lol';
 mkdir(pathname);
%imwrite(data,[pathname, 'data',num2str(j),'.png']);

for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    w=ones(3);
    n1=imerode(n1,w);
    n1=imcomplement(n1);
    figure
    imshow(n1);
    baseFileName = sprintf('%d.png', n); % e.g. "1.png"
    fullFileName = fullfile(pathname, baseFileName); 
    imwrite(n1, fullFileName);    pause(0.5)
end