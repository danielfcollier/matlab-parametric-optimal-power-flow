%
%      augmented matrix
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Free variable control  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
nvfree=length(ivfree);
nbfree=length(ibfree);
npgfree=length(ipgfree);
nqgfree=length(iqgfree);

nfllim=length(ifllim);
nflfree=length(iflfree);

if w5~=0
    nqg1free=length(iqg1free);
    nqg2free=length(iqg2free);
    nqg3free=length(iqg3free);
    nqg4free=length(iqg4free);
    nqg5free=length(iqg5free);
    nqg6free=length(iqg6free);
    nqgfreeo=length(iqgfreeo);
    nqgfreeot=length(iqgfreeot);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Lagrangean 2nd order derivates  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ztv=sparse(nb,nvfree);
%ztb=sparse(nb,nbfree);
%ztp=sparse(nb,npgfree);
ieyem2
inn=md;
dqww=dqv-diag(2*b.*v);
dqbb=diag(v.^2);

if length(ivfree)~=0
   dqw=dqww(:,ivfree);
   dpw=dpv(:,ivfree);
   dlvfd=dlvd(ivfree,:);
   if epsilon < 1
      dlvfvf=dlvv(ivfree,ivfree)+(1-epsilon)*w4*speye(nvfree);
   else
      dlvfvf=dlvv(ivfree,ivfree)+toler*w4*speye(nvfree);
   end
   if length(ibfree)~=0   
      dqb=dqbb(:,ibfree);
      dlvfbf=dlvb(ivfree,ibfree);
   else
      dqb=sparse(nb,nbfree);
      dlvfbf=sparse(nvfree,nbfree);
   end
else
   dqw=sparse(nb,nvfree);
   dpw=sparse(nb,nvfree);
   dlvfd=sparse(nvfree,nb);
   dlvfvf=sparse(nvfree,nvfree);
   dlvfbf=sparse(nvfree,nbfree);
end

if length(ipgfree)~=0
   ipn=inn(ipgfree,:);
   if epsilon < 1
      dlpp=diag(2*w1*bbE(ipgfree))+(1-epsilon)*w4*speye(npgfree);
   else
      dlpp=diag(2*w1*bbE(ipgfree))+toler*w4*speye(npgfree);
   end
else
   ipn=sparse(npgfree,nb);
   dlpp=sparse(npgfree,npgfree);
end

if length(iqgfree)~=0
   iqn=inn(iqgfree,:);
else
   iqn=sparse(nqgfree,nb);
end
%
% wrt the voltage angles
%
znb=sparse(nb,nbfree);
znp=sparse(nb,npgfree);
znq=sparse(nb,nqgfree);
if w5~=0
    znq1=sparse(nb,nqg1free);
    znq2=sparse(nb,nqg2free);
    znq3=sparse(nb,nqg3free);
    znq4=sparse(nb,nqg4free);
    znq5=sparse(nb,nqg5free);
    znq6=sparse(nb,nqg6free);
end
%
% wrt the voltage magnitudes
%
zvp=sparse(nvfree,npgfree);
zvq=sparse(nvfree,nqgfree);
if w5~=0
    zvq1=sparse(nvfree,nqg1free);
    zvq2=sparse(nvfree,nqg2free);
    zvq3=sparse(nvfree,nqg3free);
    zvq4=sparse(nvfree,nqg4free);
    zvq5=sparse(nvfree,nqg5free);
    zvq6=sparse(nvfree,nqg6free);
    zvt=sparse(nvfree,nqgfreeot);
end
%
% wrt the shunts
%
if epsilon < 1
    zbb=(1-epsilon)*w4*speye(nbfree);
else
    zbb=toler*w4*speye(nbfree);
end    
zbp=sparse(nbfree,npgfree);
zbq=sparse(nbfree,nqgfree);
if w5~=0
    zbq1=sparse(nbfree,nqg1free);
    zbq2=sparse(nbfree,nqg2free);
    zbq3=sparse(nbfree,nqg3free);
    zbq4=sparse(nbfree,nqg4free);
    zbq5=sparse(nbfree,nqg5free);
    zbq6=sparse(nbfree,nqg6free);
    zbt=sparse(nbfree,nqgfreeot);
end
%
% wrt the power generation
%
zpq=sparse(npgfree,nqgfree);
if w5~=0
    zpq1=sparse(npgfree,nqg1free);
    zpq2=sparse(npgfree,nqg2free);
    zpq3=sparse(npgfree,nqg3free);
    zpq4=sparse(npgfree,nqg4free);
    zpq5=sparse(npgfree,nqg5free);
    zpq6=sparse(npgfree,nqg6free);
    zpt=sparse(npgfree,nqgfreeot);
end
%
% wrt the reactive generation
%
if epsilon < 1
    zqq=(1-epsilon)*w4*speye(nqgfree)+diag(gamamax(iqgfree).*-d2pgmax(iqgfree));
else
    zqq=toler*w4*speye(nqgfree)+diag(gamamax(iqgfree).*-d2pgmax(iqgfree));
end
if w5~=0
    zqq1=sparse(nqgfree,nqg1free);
    zqq2=sparse(nqgfree,nqg2free);
    zqq3=sparse(nqgfree,nqg3free);
    zqq4=sparse(nqgfree,nqg4free);
    zqq5=sparse(nqgfree,nqg5free);
    zqq6=sparse(nqgfree,nqg6free);
end
if w5~=0
    %
    % wrt the region 1 reactive generation
    %
    if epsilon < 1
        dq1q1=(1-epsilon)*w4*diag(ones(1,nqg1free));
    else
        dq1q1=toler*w4*diag(ones(1,nqg1free));
    end
    zq1q2=sparse(nqg1free,nqg2free);
    zq1q3=sparse(nqg1free,nqg3free);
    zq1q4=sparse(nqg1free,nqg4free);
    zq1q5=sparse(nqg1free,nqg5free);
    zq1q6=sparse(nqg1free,nqg6free);
    zq1n=sparse(nqg1free,nb);
    iq1t=-speye(nb);
    iq1t=iq1t(iqg1free,iqgfreeot);
    iqt=md;
    iqt=iqt(iqgfree,iqgfreeot);
    %
    % wrt the region 2 reactive generation
    %
    if epsilon < 1
        dq2q2=(1-epsilon)*w4*diag(ones(1,nqg2free));
    else
        dq2q2=toler*w4*diag(ones(1,nqg2free));
    end
    zq2q3=sparse(nqg2free,nqg3free);
    zq2q4=sparse(nqg2free,nqg4free);
    zq2q5=sparse(nqg2free,nqg5free);
    zq2q6=sparse(nqg2free,nqg6free);
    zq2n=sparse(nqg2free,nb);
    iq2t=-speye(nb);
    iq2t=iq2t(iqg2free,iqgfreeot);
    %
    % wrt the region 3 reactive generation
    %
    if epsilon < 1
        dq3q3=(1-epsilon)*w4*diag(ones(1,nqg3free));
    else
        dq3q3=toler*w4*diag(ones(1,nqg3free));
    end
    zq3q4=sparse(nqg3free,nqg4free);
    zq3q5=sparse(nqg3free,nqg5free);
    zq3q6=sparse(nqg3free,nqg6free);
    zq3n=sparse(nqg3free,nb);
    iq3t=-speye(nb);
    iq3t=iq3t(iqg3free,iqgfreeot);
    %
    % wrt the region 4 reactive generation
    %
    if epsilon < 1
        dq4q4=(1-epsilon)*w4*diag(ones(1,nqg4free));
    else
        dq4q4=toler*w4*diag(ones(1,nqg4free));
    end
    zq4q5=sparse(nqg4free,nqg5free);
    zq4q6=sparse(nqg4free,nqg6free);
    zq4n=sparse(nqg4free,nb);
    iq4t=-speye(nb);
    iq4t=iq4t(iqg4free,iqgfreeot);
    %
    % wrt the region 5 reactive generation
    %
    if epsilon < 1
        dq5q5=(1-epsilon)*w4*diag(ones(1,nqg5free));
    else
        dq5q5=toler*w4*diag(ones(1,nqg5free));
    end
    zq5q6=sparse(nqg5free,nqg6free);
    zq5n=sparse(nqg5free,nb);
    iq5t=-speye(nb);
    iq5t=iq5t(iqg5free,iqgfreeot);
    %
    % wrt the region 6 reactive generation
    %
    if epsilon < 1
        dq6q6=(1-epsilon)*w4*diag(ones(1,nqg6free));
    else
        dq6q6=toler*w4*diag(ones(1,nqg6free));
    end
    zq6n=sparse(nqg6free,nb);
    iq6t=-speye(nb);
    iq6t=iq6t(iqg6free,iqgfreeot);
end
%
% wrt the alpha
%
znn=sparse(nb,nb);
if w5~=0
    znt=sparse(nb,nqgfreeot);
end
%
% wrt the theta
%
if w5~=0
    ztt=sparse(nqgfreeot,nqgfreeot);
end
%
% wrt the gama
%
dgmdd=sparse(length(ipgmax),nb);
dgmdv=sparse(length(ipgmax),nvfree);
dgmdb=sparse(length(ipgmax),nbfree);
dgmdp=speye(nt);
dgmdp=dgmdp(ipgmax,ipgfree);
dgmdq=-diag(d1pgmax);
dgmdq=dgmdq(ipgmax,iqgfree);
if w5~=0
    dgmdq1=sparse(length(ipgmax),nqg1free);
    dgmdq2=sparse(length(ipgmax),nqg2free);
    dgmdq3=sparse(length(ipgmax),nqg3free);
    dgmdq4=sparse(length(ipgmax),nqg4free);
    dgmdq5=sparse(length(ipgmax),nqg5free);
    dgmdq6=sparse(length(ipgmax),nqg6free);
    dgmdth=sparse(length(ipgmax),nqgfreeot);
end
dgmdal=sparse(length(ipgmax),nb);
dgmdbe=sparse(length(ipgmax),nb);
dgmdgm=sparse(length(ipgmax),length(ipgmax));
%
% wrt the sigma
%
dflld=dfld(ifllim,:);
dfllv=dflv(ifllim,ivfree);
zflb=sparse(nfllim,nbfree);
zflp=sparse(nfllim,npgfree);
zflq=sparse(nfllim,nqgfree);
if w5~=0
    zflq1=sparse(nfllim,nqg1free);
    zflq2=sparse(nfllim,nqg2free);
    zflq3=sparse(nfllim,nqg3free);
    zflq4=sparse(nfllim,nqg4free);
    zflq5=sparse(nfllim,nqg5free);
    zflq6=sparse(nfllim,nqg6free);
    zflth=sparse(nfllim,nqgfreeot);
end
zflal=sparse(nfllim,nb);
zflbe=sparse(nfllim,nb);
zflgm=sparse(nfllim,length(ipgmax));
zflsig=sparse(nfllim,nfllim);
%%%%%%%%%%%%%%%%%%%%%%
%  augmented matrix  %
%%%%%%%%%%%%%%%%%%%%%%  
if w5~=0
    H=[ dldd    dlvfd'    znb    znp   znq  znq1    znq2   znq3   znq4   znq5   znq6   -dpd'  -dqd'   znt    dgmdd'  dflld'
        dlvfd   dlvfvf   dlvfbf  zvp   zvq  zvq1    zvq2   zvq3   zvq4   zvq5   zvq6   -dpw'  -dqw'   zvt    dgmdv'  dfllv'
        znb'   dlvfbf'   zbb    zbp   zbq  zbq1    zbq2   zbq3   zbq4   zbq5   zbq6    znb'   dqb'   zbt    dgmdb'  zflb'
        znp'    zvp'     zbp'  dlpp   zpq  zpq1    zpq2   zpq3   zpq4   zpq5   zpq6    ipn    znp'   zpt    dgmdp'  zflp'
        znq'    zvq'     zbq'   zpq'  zqq  zqq1    zqq2   zqq3   zqq4   zqq5   zqq6    znq'   iqn    iqt    dgmdq'  zflq'
        znq1'   zvq1'    zbq1'  zpq1' zqq1' dq1q1  zq1q2  zq1q3  zq1q4  zq1q5  zq1q6   zq1n   zq1n   iq1t    dgmdq1' zflq1'
        znq2'   zvq2'    zbq2'  zpq2' zqq2' zq1q2' dq2q2  zq2q3  zq2q4  zq2q5  zq2q6   zq2n   zq2n   iq2t    dgmdq2' zflq2'
        znq3'   zvq3'    zbq3'  zpq3' zqq3' zq1q3' zq2q3' dq3q3  zq3q4  zq3q5  zq3q6   zq3n   zq3n   iq3t    dgmdq3' zflq3'
        znq4'   zvq4'    zbq4'  zpq4' zqq4' zq1q4' zq2q4' zq3q4' dq4q4  zq4q5  zq4q6   zq4n   zq4n   iq4t    dgmdq4' zflq4'
        znq5'   zvq5'    zbq5'  zpq5' zqq5' zq1q5' zq2q5' zq3q5' zq4q5' dq5q5  zq5q6   zq5n   zq5n   iq5t    dgmdq5' zflq5'
        znq6'   zvq6'    zbq6'  zpq6' zqq6' zq1q6' zq2q6' zq3q6' zq4q6' zq5q6' dq6q6   zq6n   zq6n   iq6t    dgmdq6' zflq6'
        -dpd    -dpw      znb    ipn'  znq   zq1n'  zq2n'  zq3n'  zq4n'  zq5n'  zq6n'   znn    znn    znt    dgmdal' zflal'
        -dqd    -dqw      dqb    znp   iqn'  zq1n'  zq2n'  zq3n'  zq4n'  zq5n'  zq6n'   znn    znn    znt    dgmdbe' zflbe'
        znt'    zvt'     zbt'   zpt'  iqt'  iq1t'  iq2t'  iq3t'  iq4t'  iq5t'  iq6t'   znt'   znt'   ztt    dgmdth' zflth'
        dgmdd   dgmdv    dgmdb  dgmdp dgmdq dgmdq1 dgmdq2 dgmdq3 dgmdq4 dgmdq5 dgmdq6  dgmdal dgmdbe dgmdth  dgmdgm  zflgm'
        dflld   dfllv    zflb   zflp  zflq  zflq1   zflq2  zflq3  zflq4  zflq5  zflq6  zflal  zflbe  zflth   zflgm   zflsig
        ];
    clear zflq1   zflq2  zflq3  zflq4 zflq5  zflq6 zflth
else
    H=[ dldd    dlvfd'    znb    znp   znq     -dpd'  -dqd'    dgmdd'  dflld'
        dlvfd   dlvfvf   dlvfbf  zvp   zvq     -dpw'  -dqw'    dgmdv'  dfllv'
        znb'   dlvfbf'   zbb    zbp   zbq      znb'   dqb'     dgmdb'  zflb'
        znp'    zvp'     zbp'  dlpp   zpq      ipn    znp'     dgmdp'  zflp'
        znq'    zvq'     zbq'   zpq'  zqq      znq'   iqn      dgmdq'  zflq'     
        -dpd    -dpw      znb    ipn'  znq      znn    znn     dgmdal' zflal'
        -dqd    -dqw      dqb    znp   iqn'     znn    znn     dgmdbe' zflbe'
        dgmdd   dgmdv    dgmdb  dgmdp dgmdq   dgmdal dgmdbe    dgmdgm  zflgm'
        dflld   dfllv    zflb   zflp  zflq    zflal  zflbe     zflgm   zflsig
        ];
end

clear dflld dfllv zflb  zflp  zflq  
clear zflal zflbe zflgm dflsig
clear znn zbb zvp zvq znb znp znq zbp zbq zpq zqq inn ipn iqn
clear dlvfd dlvfvf dlvfbf dqw dpw dqb dlpp
