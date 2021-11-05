i = imread('resources/A.png');

subplot(2,2,1); imshow(i,[])

I = rgb2gray(i);
I = double(I);    

n = 5;
s = 0.5; %sigma
h1 = fspecial('gaussian',[n n],s);
A = imfilter(I,h1);

hx = [1 2 1;0 0 0;-1 -2 -1];
Sx = imfilter(A,hx,'replicate');

hy = flipdim(hx',2);
Sy = imfilter(A,hy,'replicate');

Emag = sqrt(Sx.^2 + Sy.^2);
Result = zeros(size(Emag));

threshold = 50;
Result(Emag > threshold) = 255;
Result(Emag <= threshold) = 0;

subplot(2,2,2); imshow(A,[])
subplot(2,2,3); imshow(Emag,[])
subplot(2,2,4); imshow(Result,[])

