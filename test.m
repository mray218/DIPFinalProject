

name= 'blue.jpg';
image1 = imread(name);
figure(),imshow(image1);

maxI=255;

Red = image1(:,:,1);
    Green = image1(:,:,2);
    Blue = image1(:,:,3);
    %Get histValues for each channel
    [yRed, x] = imhist(Red);
    [yGreen, x] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    %Plot them together in one plot
   figure(), plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue'), title('Original Image Histogram');
    
image=rgb2hsv(image1);
H = image(:,:,1);
S = image(:,:,2);
V = image(:,:,3);

%Hlimits = stretchlim(H,.01);
%Slimits = stretchlim(S,.01);
Vlimits = stretchlim(V,.01);

%H = imadjust(H, Hlimits, []);
%S = imadjust(S, Slimits, []);
V = imadjust(V, Vlimits, []);

HSV = cat(3, H, S, V);
   img2 = hsv2rgb(HSV);
   
   Red2 = img2(:,:,1);
    Green2 = img2(:,:,2);
    Blue2 = img2(:,:,3);
    %Get histValues for each channel
    [yRed2, x] = imhist(Red2);
    [yGreen2, x] = imhist(Green2);
    [yBlue2, x] = imhist(Blue2);
    %Plot them together in one plot
   figure(), plot(x, yRed2, 'Red', x, yGreen2, 'Green', x, yBlue2, 'Blue'), title('Histogram of Corrected Image, Equalization Applied to V Channel');
    
   figure(), imshow(img2), title('Corrected Image, Equalization Applied to V-Channel');
