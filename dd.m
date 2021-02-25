%
% display initial data - set initial solution
%
%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying bus data  %
%%%%%%%%%%%%%%%%%%%%%%%%%
%
clc;
disp('                  EXAMPLE: hq -system                              ')
disp('                                                                      ')
disp('                        Bus data                                      ')
disp('                                                                      ')
disp('     bus      pgmax      pgmin      pd       qgmax      qgmin     qd  ')
disp('                                                                      ')
disp([biv pgmaxt pgmint pd qgmaxt qgmint qd])
disp('press ENTER to continue                                               ')
pause;
clc;
disp('     bus      vmax       vmin      bmax      bmin        bb       aa  ')
disp('                                                                      ')
disp([biv vmax vmin bmax bmin bb aa])
disp('press ENTER to continue                                               ')
pause;
clc;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  displaying line data   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
disp('                      Line Data                                       ')
disp('                                                                      ')
disp('     line      from       to         r         x        bli      |flmax|')
disp('                                                                      ')
disp([liv ifrom ito r x bli flmax])
disp('press ENTER to continue')
pause;
clc;
%
% sparce mode for initial variables and parameters
r=sparse(r);
x=sparse(x);
bli=sparse(bli);
pd=sparse(pd);
qd=sparse(qd);
pgmax=sparse(pgmax);
pgmin=sparse(pgmin);
qgmax=sparse(qgmax);
qgmin=sparse(qgmin);
pgmaxt=sparse(pgmaxt);
pgmint=sparse(pgmint);
qgmaxt=sparse(qgmaxt);
qgmint=sparse(qgmint);
qg01=sparse(qg01);
qg12=sparse(qg12);
qg03=sparse(qg03);
qg34=sparse(qg34);
bb=sparse(bb);
aa=sparse(aa);
xx=sparse(xx);
yy=sparse(yy);
zz=sparse(zz);
bmin=sparse(bmin);
bmax=sparse(bmax);
%
% set initial solution
setsol= input('If you want to specify a initial sol. press "1"')
if setsol==1
   d= sparse(dinit);
   v= sparse(vinit);
   pg= sparse(pginit);
   qg= sparse(qginit);
   b= sparse(binit);
   lambda= sparse(lainit);
   gama= sparse(gainit);
   ro= sparse(roinit);
   mi= sparse(miinit);
   stotal
else 
   setsol=0;
   d= sparse(nb,1);
   v= sparse((vmax+vmin)/2);
   b= (bmax+bmin)/2;
   qg=(qgmax+qgmin)/2;
   pgmax = zeros(1,nt)';
for i = 1:length(ger)
    pgmax(ger(i)) = polyval(funcao(:,i),qg(ger(i)));
end
d1pgmax = zeros(1,nt)';
for i = 1:length(ger)
    d1pgmax(ger(i)) = polyval(der1(:,i),qg(ger(i)));
end
d2pgmax = zeros(1,nt)';
for i = 1:length(ger)
    d2pgmax(ger(i)) = polyval(der2(:,i),qg(ger(i)));
end
   pg=(pgmax+pgmin)/2;
   qg1=(qg01)/2;
   qg2=(qg12+qg01)/2;
   qg3=(qgmaxt+qg12)/2;
   qg4=(qg03)/2;
   qg5=(qg03+qg34)/2;
   qg6=(qg34+qgmint)/2;
   a=(amax+amin)/2;
   dinit=d;
   vinit=v;
   binit=b;
   pginit=pg;
   qginit=qg;
   qg1init=qg1;
   qg2init=qg2;
   qg3init=qg3;
   qg4init=qg4;
   qg5init=qg5;
   qg6init=qg6;
   lambda= sparse(nb,1);
   gama= sparse(nt,1);
   ro= sparse(nt,1);
   mi= sparse(nb,1);
   ro1= sparse(nb,1);
   ro2= sparse(nb,1);
   ro3= sparse(nb,1);
   ro4= sparse(nb,1);
   ro5= sparse(nb,1);
   ro6= sparse(nb,1);
   sigma= sparse(nl,1);
   
   pgt = sparse(zeros(1,nb)');
   qgt = sparse(zeros(1,nb)');
   aux = nm>1;
   aux = aux.*(nm-1);
   is = 1:nb;
   for i=2:nb
      is(i:nb) = is(i:nb) + aux(i-1);
   end
   stotal
   
end
%
% sparce mode for initial variables and parameters
r=sparse(r);
x=sparse(x);
bli=sparse(bli);
pd=sparse(pd);
qd=sparse(qd);
pgmax=sparse(pgmax);
pgmin=sparse(pgmin);
qgmax=sparse(qgmax);
qgmin=sparse(qgmin);
bb=sparse(bb);
aa=sparse(aa);
bmin=sparse(bmin);
bmax=sparse(bmax);
flmax=sparse(flmax);
flmin=sparse(flmin);