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

w = [1,1,1;1,1,1;1,1,1];

for i = 2 : r-1
    for j = 2 : c-1
        tempx = xg(i-1:i+1,j-1:j+1);
        tempx=double(tempx);
        tempx = tempx.*w;
        s = sum(tempx);
        s = sum(s)/9;
        if(s>255)
            s = 255;
        elseif(s<0)
            s=0;
        end
        new(i-1,j-1)= s;
        
    end
end

for i = 1 : r
    for j = 1 : c
        new2(i,j)=2*xg(i,j)-new(i,j);
    end
end

extendx = uint8(extendx);
new = uint8(new);
new2 = uint8(new2);

subplot(2,2,1),imshow(xg);title('Original image');
subplot(2,2,2),imshow(new);title('Output');
subplot(2,2,3),imshow(new2);title('Output');