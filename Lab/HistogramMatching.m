clc;
clear all;
close all;

x = imread('test.jpg');
ref = imread('image.jpg');

xr = x(:,:,1);
xg = x(:,:,2);
xb = x(:,:,3);

refr = ref(:,:,1);
refg = ref(:,:,2);
refb = ref(:,:,3);

hr = imhist(xr);
hg = imhist(xg);
hb = imhist(xb);

hrefr = imhist(refr);
hrefg = imhist(refg);
hrefb = imhist(refb);

outr = histeq(xr,hrefr);
outg = histeq(xg,hrefg);
outb = histeq(xb,hrefb);

outim(:,:,1) = outr;
outim(:,:,2) = outg;
outim(:,:,3) = outb;

houtr = imhist(outr);
houtg = imhist(outg);
houtb = imhist(outb);
figure;
subplot(221);imshow(ref);title('Reference');
subplot(222);imshow(x);title('Input');
subplot(224);imshow(outim);title('Output');

figure;
subplot(331);plot(hr);title('Red input');
subplot(334);plot(hg);title('Green input');
subplot(337);plot(hb);title('Blue input');
subplot(332);plot(hrefr);title('Red reference');
subplot(335);plot(hrefg);title('Green reference');
subplot(338);plot(hrefb);title('Blue reference');
subplot(333);plot(houtr);title('Red output');
subplot(336);plot(houtg);title('Green output');
subplot(339);plot(houtb);title('Blue output');
