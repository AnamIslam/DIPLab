clear all;
clc;

im = imread('test.jpg');
im2d = (rgb2gray(im));

im2d = [zeros(size(im2d,1),1) im2d zeros(size(im2d,1),1)];

%im2d = [zeros(size(im2d,2),1); im2d ;zeros(size(im2d,2),1)];
zeroArray = zeros(size(im2d,2),1);

[m,n] = size(im2d);

for i=1: m+2
    x = 1;
    for j=1:n+2
        y=1;
        if(i==1)
            im(i,j) = 0;
        elseif (i==m+2)
            im(i,j) = 0;
        else
            im(i,j) = im2d(x,y);            
            y=y+1;
        end  
    end
    x=x+1;
end






w = [1,1,1;1,1,1;1,1,1];
for i=2:m-1
   for j=2:n-1
       a = im2d(i-1:i+1,j-1:j+1);
       a = double(a);
       a= a.*(w);
      r = sum(a);
       r = sum(r);
       
       if(r<0)
           r =0;
       elseif (r>255)
               r =255;             
       end   
           g(i,j) = r;
   end
   end

g = uint8(g);



figure;
set(gcf,'Position',get(0,'Screensize'));
subplot(1,2,1),imshow(im2d),title('Original Image');
subplot(1,2,2),imshow(g),title('After filering');


