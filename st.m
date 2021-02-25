%
%  Statistics
%
%%%%%%%%%%%%%%%%%%%%%%%%%
%  recording procedure  %
%%%%%%%%%%%%%%%%%%%%%%%%%
%
ite=ite+1;                     % counter increment

rlambda(:,ite)=lambda;         % lambda multiplier
if ibnf ~isempty
    rmi(:,ite)=mi(ibnf);           % mi multiplier
end

rgama(:,ite)=gama(ipgnf);      % gama multiplier
rgamamax(:,ite)=gamamax(iqgnf);

rro(:,ite)=ro(iqgnf);          % ro multiplier

rfl(:,ite)=fl;
rsigma(:,ite)=sigma;		% sigma multiplier

if w5~=0
    rro1(:,ite)=ro1(iqg1nf);
    rro2(:,ite)=ro2(iqg2nf);
    rro3(:,ite)=ro3(iqg3nf);
    rro4(:,ite)=ro4(iqg4nf);
    rro5(:,ite)=ro5(iqg5nf);
    rro6(:,ite)=ro6(iqg6nf);
    rqg1(:,ite)=qg1;
    rqg2(:,ite)=qg2;
    rqg3(:,ite)=qg3;
    rqg4(:,ite)=qg4;
    rqg5(:,ite)=qg5;
    rqg6(:,ite)=qg6;
    rtheta(:,ite)=theta;
end

rd(:,ite)=d;                   % voltage angles
rv(:,ite)=v;                   % voltage magnitudes
rb(:,ite)=b;                   % shunt compensation
rpg(:,ite)=pg;                 % active power injection
rpgmax(:,ite)=pgmax;           % maximum active power injection
rqg(:,ite)=qg;                 % reactive power injection

ralpha(:,ite)=alpha;           % active power balance multiplier
rbeta(:,ite)=beta;             % reactive power balance multiplier

rgc(ite)=gc;                   % generation cost
rlo(ite)=lo;                   % losses cost
rvp(ite)=vp;                   % voltage profile cost
rqgc(ite)=qgc;

rof(ite)=of;                   % total objective function
eval(ite)=eigmin;              % minimum eigenvalue
iter(ite)=nit;                 % NR number of iterations
epsalon(ite)=epsilon;          % continuation parameter

if w5~=0
    degree(ite)=nb+nvfree+nbfree+npgfree+nqgfree+...
        +nqg1free+nqg2free+nqg3free+nqg4free+...
        +nqg5free+nqg6free-2*nb-nqgfreeo-1-nfllim;
else
    degree(ite)=nb+nvfree+nbfree+npgfree+nqgfree-2*nb-1-nfllim;
end
%
%
if epsilon==1
  avertim=sum(sttim)/(length(sttim));
  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  %  displaying statistics  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
  diary opf_res.m
  disp('system   w1   w2   w3   w4   setsol')
  disp( [kmenu w1 w2 w3 w4 setsol])
  disp('                                                         ')
  disp('                     Statistics                          ')
  nn=[1:ite]';
  disp('  Number  of  Continuation Newton   Minimun    Degrees of')
  disp('  Iterations   Parameter   Raphson Eigenvalue   Freedom  ')
  disp([nn  epsalon(nn)' iter(nn)' eval(nn)' degree'])
  disp('press ENTER to continue                                  ')
  disp('Sum. NR iter. for "good" epsilons')
  sum(iter)
  disp('Num. trial iter. and total associated NR iter.')
  [trial,sum(nrtrial)]
  disp('total time  and  average time of 1 epsilon iteration')
  disp([sum(sttim),avertim])
  disp(' ')
  diary off
  pause
  clc
  %
  %%%%%%%%%%%%%%%%%%%%%%%%%
  %  displaying graphics  %
  %%%%%%%%%%%%%%%%%%%%%%%%%
  %
  subplot(221),plot(epsalon,eval)
  title('minimum eigenvalue')
  grid
  subplot(222),plot(epsalon,[full(rgc);full(rlo);full(rvp);full(rof)]')
  title('cost functions')
  grid
  subplot(223),plot(epsalon,degree)
  title('degrees of freedom')
  grid
  subplot(224),plot(epsalon,full(rb)')
  title('shunt compensation')
  grid
  pause
  clg
  subplot(221),plot(epsalon,full(rd)')
  title('phase angle')
  grid
  subplot(222),plot(epsalon,full(rv)')
  title('voltage magnitude')
  grid
  subplot(223),plot(epsalon,full(rpg)')
  title('active power injection')
  grid
  subplot(224),plot(epsalon,full(rqg)')
  title('reactive power injection')
  grid
  pause
  clf
  
  if w5~=0
      subplot(231),plot(epsalon,full(rqg1)')
      title('First Region - Reactive Power')
      grid
      subplot(232),plot(epsalon,full(rqg2)')
      title('Second Region - Reactive Power')
      grid
      subplot(233),plot(epsalon,full(rqg3)')
      title('Third Region - Reactive Power')
      grid
      subplot(234),plot(epsalon,full(rqg4)')
      title('Fourth Region - Reactive Power')
      grid
      subplot(235),plot(epsalon,full(rqg5)')
      title('Fifth Region - Reactive Power')
      grid
      subplot(236),plot(epsalon,full(rqg6)')
      title('Sixth Region - Reactive Power')
      grid
      pause
      clf
  end
  
  subplot(221),plot(epsalon,full(rlambda)')
  title('Lagrange Multiplier - voltage magnitude')
  grid
if length(rmi)~0
  subplot(222),plot(epsalon,full(rmi)')
  title('Lagrange Multiplier - shunt compensation')
  grid
end
  subplot(223),plot(epsalon,full(rgama)')
  title('Lagrange Multiplier - active  injection')
  grid
  subplot(224),plot(epsalon,full(rro)')
  title('Lagrange Multiplier - reactive injection')
  grid
  pause
  clf
  
  if w5~=0
      subplot(231),plot(epsalon,full(rro1)')
      title('Lag. Multiplier - 1st Region - Reactive Power')
      grid
      subplot(232),plot(epsalon,full(rro2)')
      title('Lag. Multiplier - 2nd Region - Reactive Power')
      grid
      subplot(233),plot(epsalon,full(rro3)')
      title('Lag. Multiplier - 3rd Region - Reactive Power')
      grid
      subplot(234),plot(epsalon,full(rro4)')
      title('Lag. Multiplier - 4th Region - Reactive Power')
      grid
      subplot(235),plot(epsalon,full(rro5)')
      title('Lag. Multiplier - 5th Region - Reactive Power')
      grid
      subplot(236),plot(epsalon,full(rro6)')
      title('Lag. Multiplier - 6th Region - Reactive Power')
      grid
      pause
      clf
  end
  if w1 ~= 0
      %%% arrumar isso aqui depois
      Ci=bbE(ipgnf).*(pg(ipgnf).^2)+aaE(ipgnf).*pg(ipgnf);
      Ms=100*Ci/sum(Ci);
      bar(Ms);
      title('Active Generators Market Share')
      grid
      pause
      clf
  end
  if w5 ~= 0
      Ci=xx(iqgnft).*qg1(iqgnft)+yy(iqgnft).*(qg2(iqgnft)-qg01(iqgnft))+zz(iqgnft).*(qg3(iqgnft)-qg12(iqgnft))-xx(iqgnft).*qg4(iqgnft)-yy(iqgnft).*(qg5(iqgnft)-qg03(iqgnft))-zz(iqgnft).*(qg6(iqgnft)-qg34(iqgnft));
      Ms=100*Ci/sum(Ci);
      bar(Ms);
      title('Reactive Generators Market Share')
      grid
      pause
      clf
  end
  nrtrial=[];
  trial=0;
end
%
% end control of the continuation process
%
if epsilon == 1
   diary opf_res.m
   su                           % summary of the final solution
   diary off
   close
   epsilon=2;
end
