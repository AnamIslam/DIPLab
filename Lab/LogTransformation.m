clc;
clear all;
close all;

x=imread('testLil.jpg');
%x=  [1,10,100; 2, 20, 200; 0, 5, 255];
dx=im2double(x);
z=dx;
[row,col]=size(dx);
%z=x;
%[row,col]=size(x);

c = input('Enter c ');

for i=1 : row
    for j=1 : col
        z(i,j) = c*log(1+dx(i,j))
        %z(i,j) = c*log(1+x(i,j));
    end
end

%subplot(1,2,1),imshow(x);title('Original image')
subplot(1,2,1),imshow(dx);title('Original image');
subplot(1,2,2),imshow(z);title('Output');