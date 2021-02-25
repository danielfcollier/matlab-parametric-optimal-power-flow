%
%  Errors in the Lagrangean stationarity
%
%
iest   % variáveis estendidas
%
if klt==0
%
%    wrt the primal variables (optimality)
%    
   dld=-dpd'*alpha-dqd'*beta-(1-epsilon)*edld;
   dlv=2*w3*(v-v./v)-dpv'*alpha-dqv'*beta+2*beta.*b.*v...
       -(1-epsilon)*(edlv-w4*(v-vinit));
   dlb=beta.*(v.^2)-(1-epsilon)*(edlb-w4*(b-binit));
   dlp=w2*sparse(ones(nt,1)) + w1*(2*bbE.*pg+aaE)+alphaE -...
       (1-epsilon)*(edlp-w4*(pg-pginit))+gamamax;

   if w5~=0
       dlq=thetaE+betaE-(1-epsilon)*(edlq-w4*(qg-qginit))+gamamax.*-d1pgmax;
   else
       dlq=betaE-(1-epsilon)*(edlq-w4*(qg-qginit))+gamamax.*-d1pgmax;
   end

   if epsilon < 1 && w5~=0
       dlq1=-(1-epsilon)*edlq1+(1-epsilon)*w4*(qg1-qg1init)+w5*xx-theta;
       dlq2=-(1-epsilon)*edlq2+(1-epsilon)*w4*(qg2-qg2init)+w5*yy-theta;
       dlq3=-(1-epsilon)*edlq3+(1-epsilon)*w4*(qg3-qg3init)+w5*zz-theta;
       dlq4=-(1-epsilon)*edlq4+(1-epsilon)*w4*(qg4-qg4init)-w5*xx-theta;
       dlq5=-(1-epsilon)*edlq5+(1-epsilon)*w4*(qg5-qg5init)-w5*yy-theta;
       dlq6=-(1-epsilon)*edlq6+(1-epsilon)*w4*(qg6-qg6init)-w5*zz-theta;
   elseif w5~=0
       dlq1=-(1-epsilon)*edlq1+toler*w4*(qg1-qg1init)+w5*xx-theta;
       dlq2=-(1-epsilon)*edlq2+toler*w4*(qg2-qg2init)+w5*yy-theta;
       dlq3=-(1-epsilon)*edlq3+toler*w4*(qg3-qg3init)+w5*zz-theta;
       dlq4=-(1-epsilon)*edlq4+toler*w4*(qg4-qg4init)-w5*xx-theta;
       dlq5=-(1-epsilon)*edlq5+toler*w4*(qg5-qg5init)-w5*yy-theta;
       dlq6=-(1-epsilon)*edlq6+toler*w4*(qg6-qg6init)-w5*zz-theta;
   end
%
%    wrt the Lagrange multipliers (feasibility)
%
   s=diag(vc)*conj(y)*conj(vc)-j*b.*(v.^2)+(1-epsilon)*epb;
   perr=pgt-pd-real(s);
   qerr=qgt-qd-imag(s);

   if w5~=0
       dldt=qgt(iqgfreeot)-qg1(iqgfreeot)-(qg2(iqgfreeot)-qg01(iqgfreeot))-...
           (qg3(iqgfreeot)-qg12(iqgfreeot))-qg4(iqgfreeot)-(qg5(iqgfreeot)-...
           qg03(iqgfreeot))-(qg6(iqgfreeot)-qg34(iqgfreeot))-(1-epsilon)*edldt;
   end

   sl= diag(Af'*vc)*auxlin*conj(vc);
   fler=sparse(length(ifllim),1);
   fler(1:nflmin)=real(sl(iflmin))-flmin(iflmin)-(1-epsilon)*efl(iflmin);
   fler(nflmin+1:nflmin+nflmax)=real(sl(iflmax))-flmax(iflmax)- ...
       (1-epsilon)*efl(iflmax);

   dldgm=pg(ipgmax)-pgmax(ipgmax);
else
    %
    %    wrt primal variables (optimality)
    %
    dld=-dpd'*alpha-dqd'*beta;
    dlv=2*w3*(v-v./v)-dpv'*alpha-dqv'*beta+2*beta.*b.*v...
        +(1-epsilon)*w4*(v-vinit);
    dlb=beta.*(v.^2)+(1-epsilon)*w4*(b-binit);
    dlp=w2+w1*(2*bbE.*pgE+aaE)+alphaE+(1-epsilon)*w4*(pg-pginit);
    dlq=betaE+(1-epsilon)*w4*(qg-qginit);
    %
    %    wrt the Lagrange multipliers (feasibility)
    %
    s=diag(vc)*conj(y)*conj(vc)-j*b.*(v.^2);
    perr=pgt-pd-real(s);
    qerr=qgt-qd-imag(s);
    sl= diag(Af'*vc)*auxlin*conj(vc);
    fler=sparse(length(ifllim),1);
    fler(1:nflmin)=real(sl(iflmin))-flmin(iflmin);
    fler(nflmin+1:nflmin+nflmax)=real(sl(iflmax))-flmax(iflmax);
end
if nfllim ~= 0
    dld=dld+dfld'*sigma;
    dlv=dlv+dflv'*sigma;
end
%
% total error (right hand side of the Newton Raphson equation)
%
dlvs=full(dlv);
dlbs=full(dlb);
dlps=full(dlp);
dlqs=full(dlq);
if w5~=0
    dlq1s=full(dlq1);
    dlq2s=full(dlq2);
    dlq3s=full(dlq3);
    dlq4s=full(dlq4);
    dlq5s=full(dlq5);
    dlq6s=full(dlq6);
end
dlvs=sparse(dlvs(ivfree));
dlbs=sparse(dlbs(ibfree));
dlps=sparse(dlps(ipgfree));
dlqs=sparse(dlqs(iqgfree));
if w5~=0
    dlq1s=sparse(dlq1s(iqg1free));
    dlq2s=sparse(dlq2s(iqg2free));
    dlq3s=sparse(dlq3s(iqg3free));
    dlq4s=sparse(dlq4s(iqg4free));
    dlq5s=sparse(dlq5s(iqg5free));
    dlq6s=sparse(dlq6s(iqg6free));
    g=[dld;dlvs;dlbs;dlps;dlqs;dlq1s;dlq2s;dlq3s;dlq4s;dlq5s;dlq6s;perr;qerr;dldt;dldgm;fler];
else
    g=[dld;dlvs;dlbs;dlps;dlqs;perr;qerr;dldgm;fler];

end

g=sparse(g);
ge=max(abs(g));

clear dlvs dlbs dlps dlqs fler
