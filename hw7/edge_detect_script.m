close all;
clear all;

I1 = imread('resources/A.png');
I2 = imread('resources/B.png');
I3 = imread('resources/C.png');

subplot(2,3,1); imshow(I1,[]); xlabel('A')
subplot(2,3,2); imshow(I2,[]); xlabel('B')
subplot(2,3,3); imshow(I3,[]); xlabel('C')

Result1 = edge_detect_algorithm(I1);
Result2 = edge_detect_algorithm(I2);
Result3 = edge_detect_algorithm(I3);

subplot(2,3,4); imshow(Result1,[]); xlabel('Edge Detect A')
subplot(2,3,5); imshow(Result2,[]); xlabel('Edge Detect B')
subplot(2,3,6); imshow(Result3,[]); xlabel('Edge Detect C')
