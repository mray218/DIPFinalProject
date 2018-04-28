

name= 'blue.jpg';
image1 = imread(name);
figure(),imshow(image1), title('Original Image');

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

Hlimits = stretchlim(H,.01);
Slimits = stretchlim(S,.01);
Vlimits = stretchlim(V,.01);

H_Corrected = imadjust(H, Hlimits, []);
S_Corrected = imadjust(S, Slimits, []);
V_Corrected = imadjust(V, Vlimits, []);

HSV1 = cat(3, H, S, V_Corrected);
VChannel = hsv2rgb(HSV1);

HSV2 = cat(3, H, S_Corrected, V_Corrected);
SVChannel = hsv2rgb(HSV2);

HSV3 = cat(3, H_Corrected, S_Corrected, V_Corrected);
HSVChannel = hsv2rgb(HSV3);

%V Channel Extraction
Red2 = VChannel(:,:,1);
Green2 = VChannel(:,:,2);
Blue2 = VChannel(:,:,3);
%Get histValues for each channel
[yRed2, x] = imhist(Red2);
[yGreen2, x] = imhist(Green2);
[yBlue2, x] = imhist(Blue2);
figure(), plot(x, yRed2, 'Red', x, yGreen2, 'Green', x, yBlue2, 'Blue'), title('Histogram of Corrected Image, Equalization Applied to V Channel');
figure(), imshow(VChannel), title('Corrected Image, Equalization Applied to V-Channel');

%SV Channel Extraction
Red3 = SVChannel(:,:,1);
Green3 = SVChannel(:,:,2);
Blue3 = SVChannel(:,:,3);
%Get histValues for each channel
[yRed3, x] = imhist(Red3);
[yGreen3, x] = imhist(Green3);
[yBlue3, x] = imhist(Blue3);
figure(), plot(x, yRed3, 'Red', x, yGreen3, 'Green', x, yBlue3, 'Blue'), title('Histogram of Corrected Image, Equalization Applied to S and V Channels');
figure(), imshow(SVChannel), title('Corrected Image, Equalization Applied to S and V Channels');

%HSV Channel Extracttion
Red4 = HSVChannel(:,:,1);
Green4 = HSVChannel(:,:,2);
Blue4 = HSVChannel(:,:,3);
%Get histValues for each channel
[yRed4, x] = imhist(Red4);
[yGreen4, x] = imhist(Green4);
[yBlue4, x] = imhist(Blue4);
figure(), plot(x, yRed4, 'Red', x, yGreen4, 'Green', x, yBlue4, 'Blue'), title('Histogram of Corrected Image, Equalization Applied to H, S and V Channels');
figure(), imshow(HSVChannel), title('Corrected Image, Equalization Applied to H,S,and V Channels');


