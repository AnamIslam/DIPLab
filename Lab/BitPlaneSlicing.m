clc;
clear all;
close all;

x=imread('test2.jpg');
%x=imget();
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];
y7=[];
y8=[];

for i=1:256
    for j=1:256
        t=de2bi(x(i,j),8,'left-msb');
        y1(i,j)=t(1,1);
        y2(i,j)=t(1,2);
        y3(i,j)=t(1,3);
        y4(i,j)=t(1,4);
        y5(i,j)=t(1,5);
        y6(i,j)=t(1,6);
        y7(i,j)=t(1,7);
        y8(i,j)=t(1,8);
    end
end
subplot(3,3,1);
imshow(x);
title('Original image'); 

subplot(3,3,2);
imshow(y8);
title('Image of bit-1');

subplot(3,3,3);
imshow(y7);
title('Image of bit-2');

subplot(3,3,4);
imshow(y6);
title('Image of bit-3');

subplot(3,3,5);
imshow(y5);
title('Image of bit-4');

subplot(3,3,6);
imshow(y4);
title('Image of bit-5');

subplot(3,3,7);
imshow(y3);
title('Image of bit-6');

subplot(3,3,8);
imshow(y2);
title('Image of bit-7');

subplot(3,3,9);
imshow(y1);
title('Image of bit-8');