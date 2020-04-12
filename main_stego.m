 clc
clear
im=imread('Cover_image.bmp'); %512*512 image
im=imresize(im,[512 512]);
im=double(im);
 d1=imread('Secret_image.bmp');
 
  height1=size(d1, 1); 
width1=size(d1,2);
height=size(im, 1); 
width=size(im,2);


d=reshape(d1,1,[]);
len=height1*width1*8;
asc=uint8(d); 
m=transpose(dec2bin(asc, 8)); 
m=m(:); 
ll= length(m); 

message=str2num(m); 



 for i=1:height
for j=1:4:width
  
     tr(i,j)=im(i,j);
     tr(i,j+1)=im(i,j+1);
     tr(i,j+2)=im(i,j+1)+im(i,j+2);
     tr(i,j+3)=2*(im(i,j+1)+im(i,j+2))+im(i,j+3);
  end
end
z=1;
for i=1:height
 for j=1:4:width

  for k=1:4
   m1(k)=message(z);
  z=z+1;
end
m1=num2str(m1);
a=transpose(bin2dec(m1));
m1=str2num(m1);



 [Em(i,j),Em(i,j+1),Em(i,j+2),Em(i,j+3)]= Embed_image(tr(i,j),tr(i,j+1),tr(i,j+2),tr(i,j+3),double(a));

end
end
 for i=1:height
   for j=1:4:width
     stego(i,j)=Em(i,j);
     stego(i,j+1)=Em(i,j+1);
     stego(i,j+2)=-Em(i,j+1)+Em(i,j+2);
     stego(i,j+3)=-2*Em(i,j+2)+Em(i,j+3);
  end
end
stego=uint8(stego);
imshow(stego)
psnr(uint8(stego),uint8(im))
 
clear
end