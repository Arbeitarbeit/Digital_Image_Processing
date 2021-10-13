clear all;
close all;

I = imread('tu.png');
I_2 = imread('tub-1.png');
I_3 = imread('tub-2.png');

% pixel transformed to: (upper-left,lower-left,lower-right,upper-right)
% tub-1: (421,1);(1,1048);(929,2608);(1346,565)
% tub-2: (123,24);(1,929);(1280,951);(1240,1)

