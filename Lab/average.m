clc;
clear all;
close all;

x = imread('test.jpg');
xg = rgb2gray(x);

[r, c] = size(xg);

for i=1 : r+2
    for j=1 : c+2
        extendx(i,j) = 0;
    end
end

for i=2 : r+1
    for j=2 : c+1
        extendx(i,j) = xg(i-1,j-1);
    end
end

w = [1,2,1;2,4,2;1,2,1];

for i = 2 : r+1
    for j = 2 : c+1
        %sum = (xg(i-1,j-1)*w(1,1)+xg(i-1,j)*w(1,2)+xg(i-1,j+1)*w(1,3)+xg(i,j-1)*w(2,1)+xg(i,j)*w(2,2)+xg(i,j+1)*w(2,3)+xg(i+1,j-1)*w(3,1)+xg(i+1,j)*w(3,2)+xg(i+1,j+1)*w(3,3))/9;
       
        %
        tempx = extendx(i-1:i+1,j-1:j+1);
        tempx=double(tempx);
        tempx = tempx.*w;
        s = sum(tempx);
        s = sum(s)/16;
        if(s>255)
            s = 255;
        elseif(s<0)
            s=0;
        end
        new(i-1,j-1)= s;
        
    end
end

extendx = uint8(extendx);
new = uint8(new);

subplot(1,2,1),imshow(xg);title('Original image');
%subplot(2,2,2),imshow(extendx);title('Output');
subplot(1,2,2),imshow(new);title('Output');