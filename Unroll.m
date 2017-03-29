function n1 = Unroll(I)

n1 = double(I);

n1=(n1-127.5)/127.5;
figure
imshow(n1);
n1=n1(:);
end