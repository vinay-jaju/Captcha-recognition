srcFiles = dir('E:\BE Project\captcha_final\gui\lol\*.png');
valueSet =   {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
keySet = {1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62};
mapObj = containers.Map(keySet,valueSet)
mapObj.Count
ans = '';
for i = 1 : length(srcFiles)
    filename = strcat('E:\BE Project\captcha_final\gui\lol\',srcFiles(i).name);
    I = imread(filename);
    figure, imshow(I);
    a = I;
    a = double(a);
    a = (a-127.5)/127.5;
    a = a(:);
    a = a';
    x = predict(Theta1,Theta2,a)
    rain = mapObj(x)
    ans = strcat(ans,rain)
end
