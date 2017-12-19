a=imread('3.png');
figure, imshow(a)
a=imresize(a,[20 20]);
a=a*255;
figure, imshow(a);
a=a(:);
predict(Theta1,Theta2,a');

