function res=encry(Pu,map(1,:))
        p=257
        x1=map(1);
        y1=map(2);
        x2=Pu(1);
        y2=Pu(2);
        num=rem(y2-y1,p);
        den=rem(x2-x1,p);
        for id2=1:1:p-1
             if mod(id2*den,p)==1
                 inv_den=id2;
              end
         end
          ratio_num_den=mod(num*inv_den,p);
          lambda=ratio_num_den;
          xR=mod(lambda^2-x1-x2,p)
          yR=mod((lambda*(x1-xR)-y1),p)
          res=[xR,yR];
             

         
end