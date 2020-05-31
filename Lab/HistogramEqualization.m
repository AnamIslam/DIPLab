clc;
clear all;
close all;

x = imread('Blast.jpg');

r = size(x,1);
c = size(x,2);

xh = uint8(zeros(r,c));

hist = zeros(256,1);
hist2 = zeros(256,1);

for i=1:r
    for j=1:c
        tmp = x(i,j)+1;
        hist(tmp)=hist(tmp)+1;
    end
end

n = r*c;

f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
out = zeros(256,1);

for i=1:r
    for j=1:c
        value = x(i,j);
        f(value+1) = f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end
sum = 0;
L = 255;
for i=1: size(pdf)
    sum = sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*L);
end

for i=1:r
    for j=1:c
        xh(i,j)=out(x(i,j)+1);
    end
end

for i=1:r
    for j=1:c
        tmp2 = xh(i,j)+1;
        hist2(tmp2)=hist2(tmp2)+1;
    end
end


subplot(221);imshow(x);title('Input');
subplot(222);bar(hist);title('Input');
subplot(223);imshow(xh);title('Output');
subplot(224);bar(hist2);title('Output');
%he = histeq(x);
%figure, imshow(he);