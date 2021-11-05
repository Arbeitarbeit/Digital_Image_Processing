i = imread('resources/A.png');

subplot(2,2,1); imshow(i,[])

I = rgb2gray(i);
I = double(I);    

I_ft = fft2(I);
I_ft2 = fftshift(I_ft);

a = real(ifft2(ifftshift(I_ft2)));
%     Result = zeros(size(a));
%     Result(a > 120) = 255;
%     Result(a <= 120) = 0;


hx = [1 2 1;0 0 0;-1 -2 -1];
Sx = imfilter(a,hx,'replicate');

hy = flipdim(hx',2);
Sy = imfilter(a,hy,'replicate');

Emag = sqrt(Sx.^2 + Sy.^2);
Result = zeros(size(Emag));

threshold = 50;
Result(Emag > threshold) = 255;
Result(Emag <= threshold) = 0;

subplot(2,2,2); imshow(a,[])
subplot(2,2,3); imshow(Emag,[])
subplot(2,2,4); imshow(Result,[])

