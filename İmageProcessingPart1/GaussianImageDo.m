function [outputArg1] = GaussianImageDo(image,sigma,filterSize)
[m,n,d] = size(image);
filterG = fspecial('gaussian',filterSize,sigma);
image = im2double(image);
if (d>1)
    GaussianSmootedImage = convn(image,filterG,"same");
else
    GaussianSmootedImage = conv2(image,filterG,"same");
end

GaussianSmootedImage = im2uint8(GaussianSmootedImage);
outputArg1 = GaussianSmootedImage;
end

