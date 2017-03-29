function [se] = segmentlol (a)
myFolder = 'C:\Users\UddhavBhosle\Desktop\CAPTCHA\lol';
%% Binarization %%
level = graythresh (a);
b = im2bw (a, level);
%% Complement %
c = imcomplement (b);
%w=ones(6);
%c=imdilate(c,w);
%c=imerode(c,w);

i=padarray(c,[0 10]);
% Vertical Projection for Character Segmentation
verticalProjection = sum(i, 1);
set(gcf, 'Name', 'Segmentation Trial', 'NumberTitle', 'Off') 
subplot(2, 2, 1);imshow(i); 
subplot(2,2,3);
plot(verticalProjection, 'b-');
grid on;
t = verticalProjection;
t(t==0) = inf;
mayukh = 3 %min(t); % return smallest element of t
% 0 where there is background, 1 where there are letters
letterLocations = verticalProjection > mayukh;
% Find Rising and falling edges
d = diff(letterLocations);
startingColumns = find (d>0);
endingColumns = find(d<0);
% Extract each region
y=1;
for k = 1 : length(startingColumns)
  % Get sub image of just one character...
  if endingColumns(k)-startingColumns(k)>5
  subImage = i(:, startingColumns(k):endingColumns(k)); 
   % im = subImage;
   s = subImage;
   figure, imshow (s);
   imwrite( s, fullfile( myFolder, sprintf('data.%d.png', k ) ) );
  end
end;
se = (s);