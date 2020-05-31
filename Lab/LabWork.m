clc;
clear all;
close all;

x = imread('test.jpg');

xg = rgb2gray(x);
[r, c] = size(xg);

w = [1,1,1; 1, 1, 1; 1, 1, 1];

for i = 2 : r-1
    for j = 2 : c-1
        sum = (xg(i-1,j-1)*w(1,1)+xg(i-1,j)*w(1,2)+xg(i-1,j+1)*w(1,3)+xg(i,j-1)*w(2,1)+xg(i,j)*w(2,2)+xg(i,j+1)*w(2,3)+xg(i+1,j-1)*w(3,1)+xg(i+1,j)*w(3,2)+xg(i+1,j+1)*w(3,3))/9;
        if(sum>256)
            sum = 256;
        elseif(sum<0)
            sum=0;
        end
        new(i-1,j-1)= sum;
    end
end
subplot(1,2,1),imshow(xg);title('Original image');
subplot(1,2,2),imshow(new);title('Output');