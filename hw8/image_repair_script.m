close all;

%% initialize image
load('resource/fn.mat');

subplot(2,3,1); imshow(uint8(fn),[]); xlabel('original')

% Iblur1 = imgaussfilt(fn,2);

%% clear out Green salt & pepper noise
n = 3;
s = 0.77;
h = fspecial('gaussian',[n n],s);
A = imfilter(fn,h);

subplot(2,3,2); imshow(uint8(A),[]);  xlabel('noise filtered')

%% clear blue wave
figure(2); subplot(1,3,1); imshow(uint8(A(:,:,3))); xlabel('Blue to grey')

A_Blue_fft = fft2(A(:,:,3));
A_Blue_Shift = fftshift(A_Blue_fft);

subplot(1,3,2); imshow(log(1+A_Blue_Shift),[]); xlabel('Blue fft')

A_Blue_Shift(250:260,190:200) = 0;
A_Blue_Shift(255:265,320:330) = 0;

A(:,:,3) = real(ifft2(ifftshift(A_Blue_Shift)));

subplot(1,3,3); imshow(uint8(A(:,:,3)),[]); xlabel('Blue noise deleted')

%% clear Red noise
figure(3); subplot(1,3,1); imshow(uint8(A(:,:,1))); xlabel('Red noise')

A_Red_fft = fft2(A(:,:,1));
A_Red_Shift = fftshift(A_Red_fft);

subplot(1,3,2); imshow(log(1+A_Red_Shift),[]); xlabel('Red fft')

% A_Red_Shift(255:265,250:260) = 0;
% 
% A(:,:,1) = real(ifft2(ifftshift(A_Red_Shift)));
% 
% subplot(1,3,3); imshow(uint8(A(:,:,1)),[])

I = uint8(A);

figure(4); imshow(I); xlabel('I')