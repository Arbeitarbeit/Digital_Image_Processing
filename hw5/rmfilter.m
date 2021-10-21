I = imread('resource/lizard_s.png');
figure(1); imshow(I, [])


m = zeros(size(I, 1), size(I, 2), 8);
v = zeros(size(I, 1), size(I, 2), 8);

fun = @fm;
fun2 = @fv;

m(:,:,1) = nlfilter(I, [5 5], fun, 1);
v(:,:,1) = nlfilter(I, [5 5], fun2, 1);

m(:,:,2) = nlfilter(I, [5 5], fun, 2);
v(:,:,2) = nlfilter(I, [5 5], fun2, 2);

m(:,:,3) = nlfilter(I, [5 5], fun, 3);
v(:,:,3) = nlfilter(I, [5 5], fun2, 3);

m(:,:,4) = nlfilter(I, [5 5], fun, 4);
v(:,:,4) = nlfilter(I, [5 5], fun2, 4);

m(:,:,5) = nlfilter(I, [5 5], fun, 5);
v(:,:,5) = nlfilter(I, [5 5], fun2, 5);

m(:,:,6) = nlfilter(I, [5 5], fun, 6);
v(:,:,6) = nlfilter(I, [5 5], fun2, 6);

m(:,:,7) = nlfilter(I, [5 5], fun, 7);
v(:,:,7) = nlfilter(I, [5 5], fun2, 7);

m(:,:,8) = nlfilter(I, [5 5], fun, 8);
v(:,:,8) = nlfilter(I, [5 5], fun2, 8);

[C, In] = min(v, [], 3);

[x, y] = ind2sub(size(I), (1:size(I, 1)*size(I, 2))');
z = In(:);
idx = sub2ind(size(v), uint32(x), uint32(y), uint32(z));

S = m(idx);
F = reshape(S, size(I));

figure(2); imshow(F, [])



