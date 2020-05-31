x=imread('test2.jpg');
gray_x=rgb2gray(x);

double_x=im2double(gray_x);

o1 = 2*(log(1+double_x));
o2 = 3*(log(1+double_x));
o3 = 4*(log(1+double_x));

subplot(2,2,1),imshow(gray_x);title('Original grey image');
subplot(2,2,2),imshow(o1);title('Output scaling factor 2');
subplot(2,2,3),imshow(o2);title('Output scaling factor 3');
subplot(2,2,4),imshow(o3);title('Output scaling factor 4');