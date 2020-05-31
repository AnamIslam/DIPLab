clc;
clear all;
close all;

x = imread('Blast.jpg');
%xg = rgb2gray(x);

%[r, c] = size(xg);
[r, c] = size(x);

for i=1 : r+2
    for j=1 : c+2
        extendx(i,j) = 0;
    end
end

for i=2 : r+1
    for j=2 : c+1
        %extendx(i,j) = xg(i-1,j-1);
        extendx(i,j) = x(i-1,j-1);
        
    end
end

%w = [0,1,0;1,-4,1;0,1,0];

for i = 2 : r+1
    for j = 2 : c+1
        tempx = extendx(i-1:i+1,j-1:j+1);
        tempx=double(tempx);
        B = tempx(:);
        C=sort(B);
        new(i-1,j-1)= C(5);
        
    end
end

extendx = uint8(extendx);
new = uint8(new);

%subplot(1,2,1),imshow(xg);title('Original image');
subplot(1,2,1),imshow(x);title('Original image');
%subplot(1,2,2),imshow(extendx);title('Output');
subplot(1,2,2),imshow(new);title('Output');