function [outputArg1] = EdgeDetection(image)
[m,n,d] = size(image);
if(d>1)
    %To turn image the gray scale form
    edgeImage = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.114*image(:,:,3);
else
    edgeImage = image;
end
filterV = [[1, 0, -1],[1, 0, -1],[1, 0, -1]];
filterH = [[1, 1, 1],[0, 0, 0],[-1, -1, -1]];
VerticalEdge = conv2(edgeImage,filterV,"same");
HorizontalEdge = conv2(edgeImage,filterH,"same");
edgeImage = VerticalEdge+HorizontalEdge;

edgeImage = uint8(edgeImage);

outputArg1 = edgeImage;
end

