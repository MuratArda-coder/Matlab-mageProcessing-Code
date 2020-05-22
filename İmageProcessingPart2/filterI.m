function [outputArg1,outputArg2] = filterI(image,r,low)

A = fft2(image);% compute FFT of the grey image
A1=fftshift(A); % frequency scaling
[M N]=size(A); % image size
R=r; % filter size parameter 
X=0:N-1;
Y=0:M-1;
[X Y]=meshgrid(X,Y);
Cx=0.5*N;
Cy=0.5*M;

Lo=zeros(M,N);%lowpass Ideal filter

for i=-(M)/2:(M)/2
    for j=-(N)/2:(N)/2
        x=i+Cx; %row
        y=j+Cy; %col
        D=sqrt((x-Cx).^2+(y-Cy).^2);
        if(D<R)
            Lo(y,x)=1;
        end
    end
end
Hi=1-Lo;%highpass Ideal filter

if(low==1)
   filter=Lo; 
else
   filter=Hi;
end

J=A1.*filter;
J1=ifftshift(J);
filtered=ifft2(J1);


outputArg1 = filtered;
outputArg2 = filter;

end

