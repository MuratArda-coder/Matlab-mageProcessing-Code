function [outputArg1] = SharpenedImage(image)
[m,n,d] = size(image);
filterS = [[0 -1 0],[-1, 5, -1],[0, -1, 0]];
%filterS = [[-1 -1 -1],[-1, 9, -1],[-1, -1, -1]];
if (d>1)
    %RedSharp = conv2(image(:,:,1),filterS,"same");
    %GreenSharp = conv2(image(:,:,2),filterS,"same");
    %BlueSharp = conv2(image(:,:,3),filterS,"same");

    %sharpedImage = zeros(m,n,d);
    %sharpedImage(:,:,1) = RedSharp;
    %sharpedImage(:,:,2) = GreenSharp;
    %sharpedImage(:,:,3) = BlueSharp;
    sharpedImage = convn(image,filterS,"same");
    
else
    sharpedImage = conv2(image,filterS,"same");
end

sharpedImage = uint8(sharpedImage);
outputArg1 = sharpedImage;
end

