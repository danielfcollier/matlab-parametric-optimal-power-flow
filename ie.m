%
%       Initial errors in the Lagrangean stationarity
%
%  wrt the primal variables (optimality)
%
iest

edld=-dpd'*alpha-dqd'*beta;                             
edlv=2*w3*(v-v./v)-dpv'*alpha-dqv'*beta+2.*beta.*b.*v+ lambda; 
edlb=beta.*(v.^2)+mi;                                      
edlp=w2*sparse(ones(nt,1))+w1*(2*bbE.*pg+aaE)+alphaE+ gama+gamamax;
if w5~=0
    edlq=betaE+thetaE+ro+gamamax.*-d1pgmax;
    edlq1=w5*xx-theta+ro1;
    edlq2=w5*yy-theta+ro2;
    edlq3=w5*zz-theta+ro3;
    edlq4=-w5*xx-theta+ro4;
    edlq5=-w5*yy-theta+ro5;
    edlq6=-w5*zz-theta+ro6;
else
    edlq=betaE+ro+gamamax.*-d1pgmax;
end

if length(ivfixed)~=0 
   edlv(ivfixed)=0;
end
if length(ibfixed)~=0
   edlb(ibfixed)=0;
end
if length(ipgfixed)~=0
   edlp(ipgfixed)=0;
end
if length(iqgfixed)~=0
   edlq(iqgfixed)=0;
end
if w5~=0
    if length(iqg1fixed)~=0
        edlq1(iqg1fixed)=0;
    end
    if length(iqg2fixed)~=0
        edlq2(iqg2fixed)=0;
    end
    if length(iqg3fixed)~=0
        edlq3(iqg3fixed)=0;
    end
    if length(iqg4fixed)~=0
        edlq4(iqg4fixed)=0;
    end
    if length(iqg5fixed)~=0
        edlq5(iqg5fixed)=0;
    end
    if length(iqg6fixed)~=0
        edlq6(iqg6fixed)=0;
    end
end
%
%  wrt the Lagrange multipliers of the power balance equations (feasibility)
%
s=diag(vc)*conj(y)*conj(vc);              % complex power
pcalc=real(s);                            % active power
qcalc=imag(s)-b.*(v.^2);                  % reactive power
epb=(pgt-pd-pcalc)+j*(qgt-qd-qcalc);        % initial error in the power balance
if w5~=0
    edldt=qgt(iqgfreeot)-qg1(iqgfreeot)-(qg2(iqgfreeot)-qg01(iqgfreeot))-...
        (qg3(iqgfreeot)-qg12(iqgfreeot))-qg4(iqgfreeot)-(qg5(iqgfreeot)-...
        qg03(iqgfreeot))-(qg6(iqgfreeot)-qg34(iqgfreeot));
end
edldgm=pg-pgmax;
efl=sparse(nl,1);
efl(kflv)=violf;