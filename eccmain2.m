clc;
clear all;
close all;
p=257;
F=0:1:255;
a=-1;
b=2;
EC=[];
map=[];
final_result=[];
message=zeros(8,2);
%integer=[237,254,236,255,247,121,194,211]';
img = imread('smile1.jpg');
im_size=size(img);
img=reshape(img,[],1);

total_pixels=numel(img);

res=zeros(8,2);
c1=zeros(8,2);
%size(integer);

for id=0:1:256
   x=id-1;
   y_sq=mod(x^3+a*x+b,p);
   for id1=0:1:p-1
        if mod(id1^2,p)==y_sq;
            y=id1;
            EC=[EC;[x,y]];
          
        end
   end
end
size(EC);

EC_X=EC(:,1);
EC_Y=EC(:,2);
plot(EC_X,EC_Y,"*");
hold on;
for i=1:total_pixels
    map(i,:)=EC(img(i),:);
    
    
end
map=[map];
size(map);
 G=EC(143,:);%generator
 Pu=publickey(G);
 G=generator(G);
 Pu_1=public_key(Pu);
for i=1:total_pixels
   map(i,:);
   size(map(i,:));
   
%ENCRYPTION
    

    x1=map(i,1);
    y1=map(i,2);
    x2=Pu_1(1);
    y2=Pu_1(2);
    num=rem(y2-y1,p);
    den=rem(x2-x1,p);
    for id2=1:1:p-1
        if mod(id2*den,p)==1
            inv_den=id2;
        end
    end
     ratio_num_den=mod(num*inv_den,p);
     lambda=ratio_num_den;
     xR=mod(lambda^2-x1-x2,p);
     yR=mod((lambda*(x1-xR)-y1),p);
     res(i,:)=[xR,yR];
     res=[res];
     size(res);


%  %decryption
    c1=decry(G);
    c1(2)=-c1(2);
    x1=res(i,1);
    y1=res(i,2);
    x2=c1(1);
    y2=c1(2);
    num=rem(y2-y1,p);
    den=rem(x2-x1,p);
    for id2=1:1:p-1
        if mod(id2*den,p)==1
           inv_den=id2;
        end
    end
    ratio_num_den=mod(num*inv_den,p);
    lambda=ratio_num_den;
    xR=mod(lambda^2-x1-x2,p);
    yR=mod((lambda*(x1-xR)-y1),p);
    message(i,:)=[xR,yR];
    message=[message];
end
res;
message;
for i=1:total_pixels
    enc(i)=res(i,1);
    enc=[enc];
end
for i=1:total_pixels
    if message(i,:)==map(i,:)
        final_result(i)=img(i);
        final_result=[final_result];
    end
end
img=reshape(img,1,[]);
enc=reshape(enc,1,[]);
enc(1:30)
img(1:30)
final_result(1:30)
img=uint8(reshape(img,im_size));


enc=reshape(enc,im_size);


result=uint8(reshape(final_result,im_size));
figure,
subplot(3,1,1);
imshow(img);
title('Original Image');
subplot(3,1,2);
imshow(enc);
title('ECC Encrypted Image');
subplot(3,1,3);
imshow(result);
title('ECC Decrypted Image');

