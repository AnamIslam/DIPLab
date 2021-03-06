clc;
clear all;
close all;

a=imread('test2.jpg');
[m,n,d]=size(a);


%x1 = 50;
%x2 = 100;
%y1 = 100;
%y2 = 150;

x1 = input('Enter x1 ');
x2 = input('Enter x2 ');
y1 = input('Enter y1 ');
y2 = input('Enter y2 ');

slope = y1/x1;
slope2 = (y2-y1)/(x2-x1);
slope3 = (255-y2)/(255-x2);

in1 = y1-slope2*x1;
in2 = y2-slope3*x2;

b = zeros(m,n);
for i=1:m
    for j=1:n
        if(a(i,j)>0 && a(i,j)<=x1)
            b(i,j)=slope*a(i,j);
        else if(a(i,j)>x1 && a(i,j)<=x2)
            b(i,j)=slope2*a(i,j)+in1;
        else if(a(i,j)>x2 && a(i,j)<=255)
            b(i,j)=slope3*a(i,j)+in2;
            
            end
            end
        end
    end
end
            
subplot(1,2,1),imshow(a);title('Original Image');
subplot(1,2,2),imshow(uint8(b));title('Contrast Stretching Image');