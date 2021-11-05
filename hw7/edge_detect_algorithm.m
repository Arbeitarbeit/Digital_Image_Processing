function Result = edge_detect_algorithm(i)
    I = rgb2gray(i);
    I = double(I);    
    
    I_ft = fft2(I);
    I_ft2 = fftshift(I_ft);
    
    result = real(ifft2(ifftshift(I_ft2)));
    
%     hx = [1 2 1;0 0 0;-1 -2 -1];
%     Sx = imfilter(I,hx,'replicate');
%     
%     hy = flipdim(hx',2);
%     Sy = imfilter(I,hy,'replicate');
% 
%     Emag = sqrt(Sx.^2 + Sy.^2);
%     Result = zeros(size(Emag));
%     Result(Emag > 100) = 255;
%     Result(Emag <= 100) = 0;
end