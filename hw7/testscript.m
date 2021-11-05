image = imread('resources/A.png');
i = rgb2gray(image);
i = double(i);

I = fft2(i);
I2 = fftshift(I);
G = fspecial('gaussian',size(i),10);
G = 1-G./max(G(:));

subplot(2,3,1); imshow(i,[])
subplot(2,3,2); imshow(log(abs(I2)+1),[])
subplot(2,3,3); imshow(G,[])
subplot(2,3,4); mesh(G)

I2 = I2.*G;
subplot(2,3,5); imshow(log(abs(I2) + 1),[])

a = real(ifft2(ifftshift(I2)));
subplot(2,3,6); imshow(a,[])