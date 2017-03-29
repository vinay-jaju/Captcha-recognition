j=1;
k=0;
for i=1:1240
    if k==20
        j=j+1;
        k=0;
    end
    y(i)=j;
    k=k+1;
end
y = y';
save 'y.mat' y;