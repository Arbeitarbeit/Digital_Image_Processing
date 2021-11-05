function Result = edge_detect_algorithm(i)
    I = rgb2gray(i);
    I = double(I);    

    hx = [1 2 1;0 0 0;-1 -2 -1];
    Sx = imfilter(I,hx,'replicate');
    
    hy = flipdim(hx',2);
    Sy = imfilter(I,hy,'replicate');

    Emag = sqrt(Sx.^2 + Sy.^2);
    Result = zeros(size(Emag));
    
    threshold = 40;
    Result(Emag > threshold) = 255;
    Result(Emag <= threshold) = 0;
end