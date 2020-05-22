image = imread("flower.jpg");
[m,n,d] = size(image);

rightImage = image;
leftImage = image;
%imshow([rightImage,leftImage])
%waitforbuttonpress

leftImage = EdgeDetection(image);
%imshow(leftImage)
%waitforbuttonpress

leftImage = SharpenedImage(image);
%imshow(leftImage)
%waitforbuttonpress

%[leftImage,c,cmap] = HistogramImage(image);
%leftImage;
%c;
%cmap;

sigma = 5;          %random for now
filterSize = 10;	%random for now
%leftImage = GaussianImageDo(image,sigma,filterSize);
%imshow(leftImage)
%waitforbuttonpress

alfa = 150;%MIN:-256 Max:256 Default:0
leftImage = BrightAnImage(image,alfa);
%imshow(leftImage)
%waitforbuttonpress

level = -150;%lower level decrease the contrast MAX:300 MIN:-300 Default:0
leftImage = ContrastAnImage(image,level);
imshow([im2double(image),leftImage])
waitforbuttonpress













