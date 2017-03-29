a = imread('tr5.png');
a = double(a);
a = (a-127.5)/127.5;
a = a(:);
a = a';
predict(Theta1,Theta2,a)