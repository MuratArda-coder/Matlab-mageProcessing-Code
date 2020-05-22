function [outputArg1,outputArg2] = filterB(image,r,n,low)

A = fft2(image);% compute FFT of the grey image
A1=fftshift(A); % frequency scaling
[M N]=size(A); % image size
R=r; % filter size parameter 
X=0:N-1;
Y=0:M-1;
[X Y]=meshgrid(X,Y);
Cx=0.5*N;
Cy=0.5*M;

Lo=1./(1+(sqrt((X-Cx).^2+(Y-Cy).^2)./R).^(2.*n));%lowpass Butterworth filter
Hi=1-Lo;%highpass Butterworth filter

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

