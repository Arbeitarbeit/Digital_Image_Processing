function Result = edge_detect_algorithm(i)
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
    
    threshold = 40;
    Result(Emag > threshold) = 255;
    Result(Emag <= threshold) = 0;
end