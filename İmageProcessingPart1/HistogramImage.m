function [outputArg1,outputArg2,outputArg3] = HistogramImage(image)
[m,n,d] = size(image);
scales = zeros(257,1);
if(d>1)
    %To turn image the gray scale form
    histImage = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.114*image(:,:,3);
else
    histImage = image;
end
for i = 1:m
    for j = 1:n
        scale = histImage(i,j);
        scales(scale+1) = scales(scale+1)+1;
    end
end
Bar = bar(scales,0.5,'k');
c = colorbar();
c.Location = 'southoutside';
caxis([0, 256]);
cmap = colormap(bone);
c.Ticks = [0 100 200 256];
waitforbuttonpress

outputArg1 = Bar;
outputArg2 = c;
outputArg3 = cmap;
end

