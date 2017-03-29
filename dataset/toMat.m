%% hola mundo
%% Archivo para convertir imágenes a matriz
files = dir('*.png');
 num = length(files);
%%
for i=1:num
   filename = files(i).name;
   img = imread(filename);
   img = bounding(img);
   %img = rgb2gray(img);
   %temp = 255 * ones(150,1200);
   %img = [temp ; img; temp];
   %img = imresize(img, [20 20]);
 %  figure; imshow(img);
   img = img(:);
   x(i,:) = img;
end
%%
x = double(x);
x = (x -127.5)/127.5;
save 'x.mat' x;