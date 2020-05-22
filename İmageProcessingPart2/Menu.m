Filter = 0; %0:Lowpass 1:HighPass
Type = 0;   %0:?deal 1:Butterworth 2:Gauss
Radius = 0; %for slider

image = imread("lena.png");
[m,n,d] = size(image);
if(d>1)
    %To turn image the gray scale form
    image = rgb2gray(image);
end
image = im2double(image);
figure(1)
imshow(image)

[filteredG,filterGa] = filterG(image,20,0);
%figure(2)
%imshow(filterGa)
%figure(3)
%imshow(filteredG)


[filteredB,filterBu] = filterB(image,30,1.5,1);
%figure(4)
%imshow(filterBu)
%figure(5)
%imshow(filteredB)


[filteredI,filterId] = filterI(image,30,0);
figure(6)
imshow(filterId)
figure(7)
imshow(filteredI)

%figure(8)
%plo = reshape(filterBu,m*m,1);
%plot(plo)


