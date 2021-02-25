%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        Initialization        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial data
dd
%
% bus admittance matrix
ym
%
% parameters
pa
%
%      The initial solution is composed of:
%
%         primal variables
%            voltage angles equal zero
%            voltage magnitudes in the middle of their range of variation
%            shunt compensation in the middle of their range of variation
%            active power injection in the middle of their range of variation
%            reactive power injection in the middle of their range of variation
%
%         lagrange multipliers wrt the power balance equations
%            active   = minus the system marginal cost
%            reactive = one (?)
%
%%%%%%%%%%%%%%%%%%%%%%
%  Primal variables  %
%%%%%%%%%%%%%%%%%%%%%%
%
% voltage magnitudes
%
ivnf=find(vmax-vmin);
iv=biv;
iv(ivnf)=0*ivnf;
ivfixed=find(iv);
iv=biv;
iv(ivfixed)=0*ivfixed;
if isempty(ivnf)
   imin=[];
   imax=[];
else 
   imin=find(v(ivnf)==vmin(ivnf));
   imax=find(v(ivnf)==vmax(ivnf));
end
ivmin= ivnf(imin);
ivmax= ivnf(imax);
iv(ivmin)=0*ivmin;
iv(ivmax)=0*ivmax;
ivfree=find(iv); 
%
% shunt compensation
%
ibnf=find(bmax-bmin);
ib=biv;
ib(ibnf)=0*ibnf;
ibfixed=find(ib);
ib=biv;
ib(ibfixed)=0*ibfixed;
if isempty(ibnf)
   imin=[];
   imax=[];
else
   imin=find(b(ibnf)==bmin(ibnf));
   imax=find(b(ibnf)==bmax(ibnf));
end
ibmin=ibnf(imin);
ibmax=ibnf(imax);
ib(ibmin)=0*ibmin;
ib(ibmax)=0*ibmax;
ibfree=find(ib);
%
% active power injection
%
ipgnf=find(pgmax-pgmin);  
ipg=miv;                   %%% biv --> miv
ipg(ipgnf)=0*ipgnf;
ipgfixed=find(ipg);
ipg=miv;                   %%% biv --> miv
ipg(ipgfixed)=0*ipgfixed;
if isempty(ipgnf)
   imin=[];
   imax=[];
else
   imin=find(pg(ipgnf)==pgmin(ipgnf));
   imax=find(pg(ipgnf)==pgmax(ipgnf));
end
ipgmin= ipgnf(imin);
ipgmax= ipgnf(imax);
ipg(ipgmin)=0*ipgmin;
ipg(ipgmax)=0*ipgmax;
ipgfree=find(ipg);
%
% reactive power injection
%
iqgnf=find(qgmax-qgmin);
iqg=miv;                 %%% biv --> miv
iqg(iqgnf)=0*iqgnf;
iqgfixed=find(iqg);
iqg=miv;                 %%% biv --> miv
iqg(iqgfixed)=0*iqgfixed;
if isempty(iqgnf)
   imin=[];
   imax=[];
else
   imin=find(qg(iqgnf)==qgmin(iqgnf));
   imax=find(qg(iqgnf)==qgmax(iqgnf));
end
iqgmin= iqgnf(imin);
iqgmax= iqgnf(imax);
iqg(iqgmin)=0*iqgmin;
iqg(iqgmax)=0*iqgmax;
iqgfree=find(iqg);
iqgfreeo=iqgfree;
%
% total reactive power injection
%
iqgnft=find(qgmaxt-qgmint);
iqgt=biv;   
iqgt(iqgnft)=0*iqgnft;
iqgfixedt=find(iqgt);
iqgt=biv;   
iqgt(iqgfixedt)=0*iqgfixedt;
if isempty(iqgnft)
   imin=[];
   imax=[];
else
   imint=find(qgt(iqgnft)==qgmint(iqgnft));
   imaxt=find(qgt(iqgnft)==qgmaxt(iqgnft));
end
iqgmint= iqgnft(imint);
iqgmaxt= iqgnft(imaxt);
iqgt(iqgmint)=0*iqgmint;
iqgt(iqgmaxt)=0*iqgmaxt;
iqgfreet=find(iqgt);
iqgfreeot=iqgfreet;

if w5~=0
    %
    % qg1
    %
    iqg1nf=find(qg01-0);
    iqg1=biv;
    iqg1(iqg1nf)=0*iqg1nf;
    iqg1fixed=find(iqg1);
    iqg1=biv;
    iqg1(iqg1fixed)=0*iqg1fixed;
    if isempty(iqg1nf)
        imin=[];
        imax=[];
    else
        imin=find(qg1(iqg1nf)==0);
        imax=find(qg1(iqg1nf)==qg01(iqg1nf));
    end
    iqg1min= iqg1nf(imin);
    iqg1max= iqg1nf(imax);
    iqg1(iqg1min)=0*iqg1min;
    iqg1(iqg1max)=0*iqg1max;
    iqg1free=find(iqg1);
    %
    % qg2
    %
    iqg2nf=find(qg12-qg01);
    iqg2=biv;
    iqg2(iqg2nf)=0*iqg2nf;
    iqg2fixed=find(iqg2);
    iqg2=biv;
    iqg2(iqg2fixed)=0*iqg2fixed;
    if isempty(iqg2nf)
        imin=[];
        imax=[];
    else
        imin=find(qg2(iqg2nf)==qg01(iqg2nf));
        imax=find(qg2(iqg2nf)==qg12(iqg2nf));
    end
    iqg2min= iqg2nf(imin);
    iqg2max= iqg2nf(imax);
    iqg2(iqg2min)=0*iqg2min;
    iqg2(iqg2max)=0*iqg2max;
    iqg2free=find(iqg2);
    %
    % qg3
    %
    iqg3nf=find(qgmaxt-qg12);
    iqg3=biv;
    iqg3(iqg3nf)=0*iqg3nf;
    iqg3fixed=find(iqg3);
    iqg3=biv;
    iqg3(iqg3fixed)=0*iqg3fixed;
    if isempty(iqg3nf)
        imin=[];
        imax=[];
    else
        imin=find(qg3(iqg3nf)==qg12(iqg3nf));
        imax=find(qg3(iqg3nf)==qgmaxt(iqg3nf));
    end
    iqg3min= iqg3nf(imin);
    iqg3max= iqg3nf(imax);
    iqg3(iqg3min)=0*iqg3min;
    iqg3(iqg3max)=0*iqg3max;
    iqg3free=find(iqg3);
    %
    % qg4
    %
    iqg4nf=find(0-qg03);
    iqg4=biv;
    iqg4(iqg4nf)=0*iqg4nf;
    iqg4fixed=find(iqg4);
    iqg4=biv;
    iqg4(iqg4fixed)=0*iqg4fixed;
    if isempty(iqg4nf)
        imin=[];
        imax=[];
    else
        imin=find(qg4(iqg4nf)==qg03(iqg4nf));
        imax=find(qg4(iqg4nf)==0);
    end
    iqg4min= iqg4nf(imin);
    iqg4max= iqg4nf(imax);
    iqg4(iqg4min)=0*iqg4min;
    iqg4(iqg4max)=0*iqg4max;
    iqg4free=find(iqg4);
    %
    % qg5
    %
    iqg5nf=find(qg03-qg34);
    iqg5=biv;
    iqg5(iqg5nf)=0*iqg5nf;
    iqg5fixed=find(iqg5);
    iqg5=biv;
    iqg5(iqg5fixed)=0*iqg5fixed;
    if isempty(iqg5nf)
        imin=[];
        imax=[];
    else
        imin=find(qg5(iqg5nf)==qg34(iqg5nf));
        imax=find(qg5(iqg5nf)==qg03(iqg5nf));
    end
    iqg5min= iqg5nf(imin);
    iqg5max= iqg5nf(imax);
    iqg5(iqg5min)=0*iqg5min;
    iqg5(iqg5max)=0*iqg5max;
    iqg5free=find(iqg5);
    %
    % qg6
    %
    iqg6nf=find(qg34-qgmint);
    iqg6=biv;
    iqg6(iqg6nf)=0*iqg6nf;
    iqg6fixed=find(iqg6);
    iqg6=biv;
    iqg6(iqg6fixed)=0*iqg6fixed;
    if isempty(iqg6nf)
        imin=[];
        imax=[];
    else
        imin=find(qg6(iqg6nf)==qgmint(iqg6nf));
        imax=find(qg6(iqg6nf)==qg34(iqg6nf));
    end
    iqg6min= iqg6nf(imin);
    iqg6max= iqg6nf(imax);
    iqg6(iqg6min)=0*iqg6min;
    iqg6(iqg6max)=0*iqg6max;
    iqg6free=find(iqg6);
end
%
% power flows
%
iflnf=find(flmax-flmin);
ifl=liv;
ifl(iflnf)=0*iflnf;
iflfixed=find(ifl);
ifl=liv;
ifl(iflfixed)=0*iflfixed;
iflfree=find(ifl);
vc=v.*exp(j*d);                     % complex voltages
sl= diag(Af'*vc)*auxlin*conj(vc);
fl=full(real(sl));
iflmin=[];
iflmax=[];
ifllim=[];
nfllim=0;
nflmin=0;
nflmax=0;
kflv=find(fl > flmax | fl < flmin);
violf=[];
for i=1:length(kflv)
	ii=kflv(i);
	if(fl(ii) > flmax(ii))
		violf(i)=fl(ii)-flmax(ii)+flmax(ii)/2;
	elseif fl(ii) < flmin(ii)
		violf(i)=fl(ii)-flmin(ii)+flmin(ii)/2;
    end
end
%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  lagrange multipliers wrt the power balance equations  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
if setsol==0
   alpha=sparse(ones(size(biv))*(-sum(2.*bb.*pgt+aa)./nb));
   beta=sparse(ones(size(biv)));
   gamamax=sparse(zeros(size(miv)));                       %%% biv --> miv
   theta=sparse(zeros(size(biv)));
   theta(iqgfreeot)=1;
   %%%%---------------
   aaE = sparse(zeros(nt,1));
   bbE = sparse(zeros(nt,1));
   alphaE = sparse(zeros(nt,1));
   betaE = sparse(zeros(nt,1));
   thetaE = sparse(zeros(nt,1));
   est = [];
   aux = nm>1;
   aux = aux.*(nm-1);
   for i=1:nb
      est = [est i*ones(1,length(is(i):is(i)+aux(i)))];
   end
   for i=1:nt
       aaE(i) = aa(est(i));
       bbE(i) = bb(est(i));
   end
   iest
   %%%%---------------
else
   alpha=alinit;
   beta=beinit;
end
%
%%%%%%%%%%%%%%%%%%%%%%%%
%  objective function  %
%%%%%%%%%%%%%%%%%%%%%%%%
%
gc=sum(bb.*(pgt.^2)+aa.*pgt);  % generation cost
qgc=sum(xx.*qg1+yy.*(qg2-qg01)+zz.*(qg3-qg12)-xx.*qg4-yy.*(qg5-qg03)-zz.*(qg6-qg34)); % reactive gen cost
lo=sum(pgt);                   % losses cost
vp=sum((v-v./v).^2);           % voltage profile cost
of=w1*gc+w2*lo+w3*vp+w5*qgc;   % total cost
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying initial solution  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('                    Initial Solution                        ')
disp('      bus         ds      vs          bs      pg        qg  ')
disp([biv full(d) full(v) full(b) full(pgt) full(qgt) ])
disp('press ENTER to continue                                     ')
pause
disp('line     flow')
disp([liv full(fl)])
disp('press ENTER to continue                            ')
pause
clc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying the index set of free variables  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('Initial free variables index set')
disp('                                ')
disp('     v     b')
disp('                        ')
disp([iv ib])
disp('     pg    qg')
disp('                        ')
disp([ipg iqg])
disp('press ENTER to continue ')
pause
clc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying the initial multipliers wrt the power balance equations  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('Initial lagrange multipliers wrt the power balance equations')
disp('                                                            ')
disp('        alpha  ')
disp('                    ')
disp([full(alpha)])
disp(' ')
disp('beta')
disp([full(beta)])
disp(' ')
disp('theta')
disp([full(theta)])
disp('press ENTER to continue')
pause
clc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying the initial objective function   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('Initial objective function              ')
disp('                                        ')
disp('  Generation       Reactive      Losses    Voltage  Total')
disp('     Cost            Cost        Profile            Cost ')
disp('                                        ')
disp([full(gc) full(qgc) full(lo) full(vp) full(of)])
disp('press ENTER to continue                 ')
pause
clc
%
%%%%%%%%%%%%%%%%%%%%%%%%%
%  initial derivatives  %
%%%%%%%%%%%%%%%%%%%%%%%%%
%
de                              % Lagrangean derivatives
dfld=sparse(nl,nb);		        % initial derivatives of power flows
dflv=sparse(nl,nb);
zflb=sparse(nl,nb);
zflp=sparse(nl,nb);
zflq=sparse(nl,nb);
if w5~=0
    zflq1=sparse(nl,nb);
    zflq2=sparse(nl,nb);
    zflq3=sparse(nl,nb);
    zflq4=sparse(nl,nb);
    zflq5=sparse(nl,nb);
    zflq6=sparse(nl,nb);
    zflth=sparse(nl,nb);
end
zflal=sparse(nl,nb);
zflbe=sparse(nl,nb);
zflgm=sparse(nl,nt);
zflsig=sparse(nl,nl);
ie                              % initial error in the Lagrangean stationarity
er                              % error in the Lagrangean stationarity
%
%%%%%%%%%%%%%%%%%%%%
%  1st order test  %
%%%%%%%%%%%%%%%%%%%%
%
clc
disp('Test for the 1st order KT conditions                      ')
if ge > toler
   error('Warning: initial solution does not satisfy 1st order KT conditions')
else
   disp('The initial solution satisfies the 1st order KT conditions')
   disp('press ENTER to continue                                   ')
   pause
   clc
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  lagrange multipliers wrt bounds on the variables  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
la                              % initial Lagrange multipliers
%
%%%%%%%%%%%%%%%%%%%%%%%
%  second order test  %
%%%%%%%%%%%%%%%%%%%%%%%
%
am                              % augmented matrix (system's Jacobian)
ev                              % restricted hessian eigenvalues
disp('Test for the 2nd order optimality conditions ')
disp('                                             ')
disp('Initial eigenvalues of the restricted hessian')
disp(evalue)
if eigmin < 0
  disp('Warning: the initial solution is a saddle point ')
else
  disp('The initial solution is at least a local minimum')
end
disp('press ENTER to continue                         ')
pause
clc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying initial multipliers wrt the bounds on variables  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('Initial multipliers wrt the bounds on variables   ')
disp('    lamda  =  voltage magnitudes                  ')
disp('    mi     =  shunt compensation                  ')
disp('    gama   =  active power generation             ')
disp('    ro     =  reactive power generation           ')
disp('                                                  ')
disp('   bus  lambda  mi')
disp('                                                  ')
disp([biv         -full(dlv) -full(dlb)])
disp('    machine     gama      ro  ')
disp('                                                  ')
disp([miv -full(dlp) -full(dlq)])
disp('press ENTER to continue                           ')
pause
clc
disp('Initial lagrange multipliers wrt line flows')
disp(full(sigma)')
disp('press ENTER to continue                           ')
pause
clc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  recording initial solution  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
rd=d;                           % voltage angles
rv=v;                           % voltage magnitudes
rb=b;                           % shunt compensation
rpg=pg;                         % active power injection
rqg=qg;                         % reactive power injection
if w5~=0
    rqg1=qg1;
    rqg2=qg2;
    rqg3=qg3;
    rqg4=qg4;
    rqg5=qg5;
    rqg6=qg6;
end
rqgc=qgc;
rgc=gc;                         % generation cost
rlo=lo;                         % losses cost
rvp=vp;                         % voltage profile
rof=of;                         % total cost
rpgt=pgt;
rqgt=qgt;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  recording inital lagrange multipliers wrt the power balance equations   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
ralpha=alpha;                   % recording initial alpha multipliers
rbeta=beta;                     % recording initial beta multipliers
if w5~=0
    rtheta=theta;
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  recording initial lagrange multipliers wrt the bounds on the variables  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
rlambda=lambda;                      % recording initial lambda multiplier
rmi=mi(ibnf);                           % recording initial mi multiplier
rgama=gama(ipgnf);                      % recording initial gama multiplier
rgamamax=gamamax(iqgnf);       % ipgnf ---> iqgnf         
rro=ro(iqgnf);                          % recording initial ro multiplier
if w5~=0
    rro1=ro1(iqg1nf);
    rro2=ro2(iqg2nf);
    rro3=ro3(iqg3nf);
    rro4=ro4(iqg4nf);
    rro5=ro5(iqg5nf);
    rro6=ro6(iqg6nf);
end
rsigma=sigma;
nit=0;                                  % Newton Raphson counter

