function [outputArg1] = ContrastAnImage(image,Level)
[m,n,d] = size(image);
factor = (259*(Level+255))/(255*(259-Level));
if(d>1)
    ContrastImage = zeros(m,n,d);
    for i = 1:m
        for j = 1:n
            for k = 1:d
                ContrastImage(i,j,k) = 15+factor*(image(i,j,k) - 64);
            end
        end
    end
else
    ContrastImage = zeros(m,n);
    for i = 1:m
       for j = 1:n
           ContrastImage(i,j) = 15+factor*(image(i,j) - 64);
       end       
    end
    
end
ContrastImage = ContrastImage/255;
ContrastImage = im2uint8(ContrastImage);

outputArg1 = ContrastImage;
end

