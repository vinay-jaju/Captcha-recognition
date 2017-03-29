function n1 = bounding(I)
%I = imread('img062-025.png');
%close all;
BW = im2bw(I);

BW = ~BW;
imagen=BW;
[L Ne]=bwlabel(imagen);
%% Objects extraction
%%figure
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
%      w=ones(5);
%      n1=imerode(n1,w);
    %figure
    %imshow(n1);
 %   pause(0.5)
end
n1 = imcomplement(n1);
n1  = imresize(n1, [20 20]);
n1 = double(n1);
n1 = 255*n1;

n1=(n1-127.5)/127.5;
figure
imshow(n1);
n1=n1(:);

end