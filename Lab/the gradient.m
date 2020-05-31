clc;
clear all;
close all;

x = imread('test.jpg');
xg = rgb2gray(x);

[r, c] = size(xg);

w = [-1,0;0,1];

for i = 1 : r
    for j = 1 : c
        tempx = xg(i:i+1,j:j+1);
        tempx=double(tempx);
        tempx = tempx.*w;
        s = sum(tempx);
        s = sum(s);
        if(s>255)
            s = 255;
        elseif(s<0)
            s=0;
        end
        new(i-1,j-1)= s;
        
    end
end

new = uint8(new);

subplot(1,2,1),imshow(xg);title('Original image');
subplot(1,2,2),imshow(new);title('Output');