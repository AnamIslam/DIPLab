clc;
clear all;
close all;

x = imread('test2.jpg');
ref = imread('image2.jpg');
r = size(x,1);
c = size(x,2);

xh = uint8(zeros(r,c));

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
    end;
end;
sum = 0;
L = 255;
for i=1: size(pdf)
    sum = sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*L);
end;

for i=1:r
    for j=1:c
        xh(i,j)=out(x(i,j)+1);
    end;
end;

%-------------------------------------------------
rr = size(ref,1);
rc = size(ref,2);

rh = uint8(zeros(rr,rc));

rn = r*c;

rf = zeros(256,1);
rpdf = zeros(256,1);
rcdf = zeros(256,1);
rcum = zeros(256,1);
rout = zeros(256,1);

for i=1:r
    for j=1:c
        rvalue = ref(i,j);
        rf(rvalue+1) = rf(rvalue+1)+1;
        rpdf(rvalue+1)=rf(rvalue+1)/n;
    end
end
rsum = 0;
rL = 255;
for i=1: size(rpdf)
    rsum = rsum+rf(i);
    rcum(i)=rsum;
    rcdf(i)=rcum(i)/rn;
    rout(i)=round(rcdf(i)*rL);
end

for i=1:r
    for j=1:c
        rh(i,j)=rout(ref(i,j)+1);
    end
end

for i=1:r
    for j=1:c
       for k=1:256
           if rout(k)>= xh(i,j)
               break;
           end
       end
       output(i,j) = k-1;
    end
end

output = uint8(output);
%------------------------------------------------
subplot(221);imshow(x);title('Input');
subplot(222);imshow(ref);title('Reference');
subplot(224);imshow(output);title('Output');