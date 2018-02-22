close all

% morphological operation
im_original=im2double(A);
imrgb = rgb2gray(im_original);
imrgb = adapthisteq(imrgb);
im_original=im_original-imrgb;


cel= rgb2xyz(A);                               %coversion to cie 1931 colorspace
im_xlayer=cel(:,:,1);                          %taking x-layer
se = strel('ball',8,8);                        %morphological structural element
im_xclose=imclose(im_xlayer,se);               %closing operation
im_xbinarize=imbinarize(im_xclose,.5);         %binarize operation
im_sub1=im_xlayer-im_xbinarize;
im_recon=imreconstruct(im_sub1,im_xlayer);     %reconstruction operation
im_sub2=im_xlayer-im_recon;

figure,imshow(im_recon);                       %eye image w/o optic disk
figure,imshow(im_sub2);                        % optic disk

%% 
% applying principal component analysis(pca)
processed_im=im_recon;
rows=size(im_recon,1);columns=size(im_recon,2);
X = double(reshape(processed_im, rows * columns, []));  %reshaping image suitable for pca analysis

coeff = pca(X);

im_transformed = X * coeff;

pcaimage = reshape(im_transformed(:,:), rows, columns);

figure,imshow(pcaimage, []);
%%
% detection of features using surf operation
I=pcaimage;
points = detectSURFFeatures(I);

figure,imshow(I,[]);
hold on;
plot(points.selectStrongest(20));

