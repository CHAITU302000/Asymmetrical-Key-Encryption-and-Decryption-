function Pu_1=public_key(Pu)
         k=5;%private key
         a=-1;
         b=2;
         p=257;
         x1=Pu(1);
         y1=Pu(2);
        % x2=G(1);
        % y2=G(2);
         %this is to be implemented if points are same
         num=mod(3*x1^2+a,p);
         den=mod(2*y1,p);
         for id2=1:1:p-1
             if mod(id2*den,p)==1
                 inv_den=id2;
             end
         end
         ratio_num_den=mod(num*inv_den,p);
         lambda=ratio_num_den;
         xR=mod(lambda^2-(x1)-(x1),p);
         yR=mod(lambda*(x1-xR)-y1,p);
         if k>2
            for n=3:1:k
                num=rem(yR-y1,p);
                den=rem(xR-x1,p);
                for id2=1:1:p-1
                    if mod(id2*den,p)==1
                      inv_den=id2;
                    end
                end
              ratio_num_den=mod(num*inv_den,p);
              lambda=ratio_num_den;
              xR=mod(lambda^2-x1-xR,p);
              yR=mod((lambda*(x1-xR)-y1),p);
             
            end
         end
         Pu_1=[xR,yR];
