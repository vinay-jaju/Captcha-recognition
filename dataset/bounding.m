function n1 = bounding(n1)
%I = imread('img062-025.png');
close all;
BW = im2bw(n1);
BW = ~BW;
imagen=BW;
[L Ne]=bwlabel(imagen);
%% Objects extraction
% propied=regionprops(L,'BoundingBox');
% hold on
%% Plot Bounding Box
% for n=1:size(propied,1)
%     rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2);
% end
% hold off
% pause (1)

%  pathname = 'C:\Users\UddhavBhosle\Desktop\CAPTCHA\lol';
%  mkdir(pathname);
 
 
%%figure
t=3;
for n=1:Ne
    [r,c] = find(L==n);
    if max(r)-min(r)>t && max(c)-min(c)>t
    n1=imagen(min(r):max(r),min(c):max(c));
%     w=ones(3);
%     n1=imdilate(n1,w);
%     n1=imerode(n1,w);
%     n1=imdilate(n1,w);
    n1=imcomplement(n1);
    n1=double(n1);
    n1=n1*255;
    n1=(n1-127.5)/127.5;
    n1=imresize(n1,[20 20]);
    %%figure
    %%imshow(n1);
%     baseFileName = sprintf('%d.png', n); % e.g. "1.png"
%     fullFileName = fullfile(pathname, baseFileName); 
%     figure, imshow(n1);
%     imwrite(n1, fullFileName);    
    end;
n1  = imresize(n1, [20 20]);
n1 = 255*n1;
n1 = double(n1);
%  figure
%   imshow(n1);
end