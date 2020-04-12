function [y0,y1,y2,y3] = Embed_image(x0,x1,x2,x3,s)

F=(mod((x0+4*x1+16*x2+64*x3),256));
flag=(0);
D=int32((s-F));

if(D<-128) 

  D=D+256;
end
if(D>128)

 D=D-256;
end

if(D<0)
  flag=1;
end
 
 A=(abs(D));
 D3=(power(-1,flag)*floor(A/64));
A=mod(A,64);

D2=(power(-1,flag)*floor(A/16));
A=mod(A,16);

D1=(power(-1,flag)*floor(A/4));

 D0=(power(-1,flag)*mod(A,4));

 y0=(x0+D0);
 y1=(x1+D1);
 y2=(x2+D2);
 y3=(x3+D3);

end
