
%
%       Update of the free variables
%
% primal variables
%
d=d+step*dx(1:nb);                                     % voltage angles
n1=nb;

if length(ivfree) ~= 0
   v(ivfree)=v(ivfree)+step*dx(n1+1:n1+nvfree);        % voltage magnitudes
   n1=n1+nvfree;
end

if length(ibfree) ~= 0
   b(ibfree)=b(ibfree)+step*dx(n1+1:n1+nbfree);        % shunt compensations
   n1=n1+nbfree;
end

if length(ipgfree) ~= 0
   pg(ipgfree)=pg(ipgfree)+step*dx(n1+1:n1+npgfree);   % active power injections
   n1=n1+npgfree;
end

if length(iqgfree) ~= 0
   qg(iqgfree)=qg(iqgfree)+step*dx(n1+1:n1+nqgfree);   % react. power injections
   n1=n1+nqgfree;
end

if w5~=0
    if length(iqg1free) ~= 0
        qg1(iqg1free)=qg1(iqg1free)+step*dx(n1+1:n1+nqg1free);   % react. power injections (1)
        n1=n1+nqg1free;
    end
    if length(iqg2free) ~= 0
        qg2(iqg2free)=qg2(iqg2free)+step*dx(n1+1:n1+nqg2free);   % react. power injections (2)
        n1=n1+nqg2free;
    end
    if length(iqg3free) ~= 0
        qg3(iqg3free)=qg3(iqg3free)+step*dx(n1+1:n1+nqg3free);   % react. power injections (3)
        n1=n1+nqg3free;
    end
    if length(iqg4free) ~= 0
        qg4(iqg4free)=qg4(iqg4free)+step*dx(n1+1:n1+nqg4free);   % react. power injections (4)
        n1=n1+nqg4free;
    end
    if length(iqg5free) ~= 0
        qg5(iqg5free)=qg5(iqg5free)+step*dx(n1+1:n1+nqg5free);   % react. power injections (5)
        n1=n1+nqg5free;
    end
    if length(iqg6free) ~= 0
        qg6(iqg6free)=qg6(iqg6free)+step*dx(n1+1:n1+nqg6free);   % react. power injections (6)
        n1=n1+nqg6free;
    end
end
%
% Lagrange multipliers wrt the power balance equations
%
alpha=alpha+step*dx(n1+1:n1+nb);                     % active power balance
n1=n1+nb;

beta=beta+step*dx(n1+1:n1+nb);                       % reactive power balance
n1=n1+nb;

if w5~=0
    theta(iqgfreeot)=theta(iqgfreeot)+step*dx(n1+1:n1+nqgfreeot);
    n1=n1+nqgfreeot;
end

gamamax(ipgmax,:)=gamamax(ipgmax,:)+step*dx(n1+1:n1+length(ipgmax),:);
n1=n1+length(ipgmax);

sigma(iflmin,:)=sigma(iflmin,:)+step*dx(n1+1:n1+nflmin,:);
n1=n1+nflmin;

sigma(iflmax,:)=sigma(iflmax,:)+step*dx(n1+1:n1+nflmax,:);

stotal
%
% update of the objective function
%
gc=sum(bbE.*(pg.^2)+aaE.*pg);
if w5~=0
    qgc=sum(xx.*qg1+yy.*(qg2-qg01)+zz.*(qg3-qg12)-xx.*qg4-yy.*(qg5-qg03)-zz.*(qg6-qg34)); % reactive gen cost
else
    qgc=0;
end
lo=(sum(pgt)-sum(pd));
vp=sum((v-v./v).^2); 
%dv=0.5*w4*sum((v-vinit).^2+ sum((pg-pginit).^2+(qg-qginit).^2) +(b-binit).^2+(qg1-qg1init).^2+(qg2-qg2init).^2+(qg3-qg3init).^2+(qg4-qg4init).^2+(qg5-qg5init).^2+(qg6-qg6init).^2);
of=w1*gc+w2*lo+w3*vp+w5*qgc;
