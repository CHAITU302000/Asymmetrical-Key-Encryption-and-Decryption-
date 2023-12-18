clc
clear all
close all

img = imread('smile.jpg');
im_size=size(img);
img=reshape(img, 1, []);

total_pixels=numel(img);

cipher=[];
result=[];
hex=[];
%define value of n based up on 2 selected prime numbers 
%value of n should be greater than m
    p=17;
    q=19;
    n=p*q;
    pi=(p-1)*(q-1);
%as the result is not a prime number it is not a field 
% check a number in this ring such that it has inverse
%let the public key e=5
    e=5;
%calculate the multiplicative inverse of this number
   d=(mult_inv(e));
   d;
%cipher generationmod(mod(88^7,n),mod(88^23,n))
for l=1:total_pixels
    hex(1,l)=img(1,l);
    cipher(1,l)=mod(hex(1,l)^2,n);
    for k=3:e
        cipher(1,l)=mod(cipher(1,l)*hex(1,l),n);
    end


    cipher(1,l);
    cipher=([cipher]);

    result(1,l)=mod(cipher(1,l)^2,n);
        for j=3:d
            result(1,l)=mod(result(1,l)*cipher(1,l),n);
        end
  
        result=[result];
end

cipher;

result=uint8(result);
class(cipher);

img=reshape(img,im_size);


cipher=reshape(cipher,im_size);


result=reshape(result,im_size);
figure,
subplot(3,1,1);
imshow(img);
title('Original Image');
subplot(3,1,2);
imshow(cipher);
title('RSA Encrypted Image');
subplot(3,1,3);
imshow(result);
title('RSA Decrypted Image');