clear all;
close all;

I = imread('tu.png');
I_2 = imread('tub-1.png');
I_3 = imread('tub-2.png');

% pixel transformed to: (upper-left,lower-left,lower-right,upper-right)
% tub-1: (421,1);(1,1048);(929,2608);(1346,565)
% tub-2: (123,24);(1,929);(1280,951);(1240,1)

phi = (pi/180) * 68.11 + pi;
T = [cos(phi) sin(phi) 0; -sin(phi) cos(phi) 0; 0 0 1];
tform = maketform('affine',T);
trans_1 = imtransform(I_2,tform,'bilinear');

% tran_1: (521,385);(347,1459);(1471,1459);(1645,385)
T_2 = [1 0 0; 0.162 1 0; 0 0 1];
tform = maketform('affine',T_2);
trans_2 = imtransform(trans_1,tform,'bilinear');
cropped_image_1 = imcrop(trans_2, [587,388,1708-587,1456-388]); % crop image

reconstucted_1 = uint8(abs(double(255 - cropped_image_1))); % reverse grey value

figure(1)
imshow(I,[])
impixelinfo

figure(2)
imshow(I_2,[])
impixelinfo

figure(3)
imshow(trans_1,[])
impixelinfo

figure(4)
imshow(trans_2,[])
impixelinfo

figure(5)
imshow(reconstucted_1,[])
impixelinfo