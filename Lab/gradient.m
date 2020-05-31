clc;
clear all;
close all;

x = imread('image.jpg');
xg = rgb2gray(x);

[r, c] = size(xg);

w1 = [-1,0;0,1];
w2 = [0,-1;1,0];

for i = 1 : r-1
    for j = 1 : c-1
        temp = xg(i:i+1,j:j+1);
        tempx=double(temp);
        tempy=double(temp);
        tempx = tempx.*w1;
        tempy = tempy.*w2;
        sx = sum(tempx);
        sy = sum(tempy);
        sx = sum(sx);
        sy = sum(sy);
        s = sx*sx+sy*sy;
        s = sqrt(s);
        if(s>255)
            s = 255;
        elseif(s<0)
            s=0;
        end
        new(i,j)= s;
        
    end
end

new = uint8(new);

subplot(1,2,1),imshow(xg);title('Original image');
subplot(1,2,2),imshow(new);title('Output');