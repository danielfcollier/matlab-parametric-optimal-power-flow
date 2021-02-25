%
%  active constraints set check
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  free variables inside their limits  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clc
change=0;                      % counter for the number of violations
qgvio=[];
qglim=[];
qgbar=[];
violv=[];
ivvli=[];
ivvls=[];
ibvli=[];
ibvls=[];
ipgvli=[];
ipgvls=[];
iqgvli=[];
iqgvls=[];
if w5~=0
    iqg1vli=[];
    iqg1vls=[];
    iqg2vli=[];
    iqg2vls=[];
    iqg3vli=[];
    iqg3vls=[];
    iqg4vli=[];
    iqg4vls=[];
    iqg5vli=[];
    iqg5vls=[];
    iqg6vli=[];
    iqg6vls=[];
end
ilvli=[];
ilvls=[];
imvli=[];
imvls=[];
igvli=[];
igvls=[];
irvli=[];
irvls=[];
if w5~=0
    ir1vli=[];
    ir1vls=[];
    ir2vli=[];
    ir2vls=[];
    ir3vli=[];
    ir3vls=[];
    ir4vli=[];
    ir4vls=[];
    ir5vli=[];
    ir5vls=[];
    ir6vli=[];
    ir6vls=[];
end
im=find(v(ivfree) < vmin(ivfree));
if length(im) ~= 0 & length(ivfree) ~= 0,
    iif=ivfree(im);
    ivvli=iif;
    disp('Voltage magnitude below the minimum in bus')
    disp(iif')
    disp(v(iif)')
    change=change+length(iif);
    violv=[violv;vmin(iif)-v(iif)];
end

im=find(v(ivfree) > vmax(ivfree));
if length(im) ~= 0 & length(ivfree) ~= 0,
    iif=ivfree(im);
    ivvls=iif;
    disp('Voltage magnitude above the maximum in bus')
    disp(iif')
    disp(v(iif)')
    change=change+length(iif);
    violv=[violv;v(iif)-vmax(iif)];
end

im=find(b(ibfree) < bmin(ibfree));
if length(im) ~= 0 & length(ibfree) ~= 0,
    iif=ibfree(im);
    ibvli=iif;
    disp('Shunt compensation below the minimum in bus')
    disp(iif')
    disp(b(iif)')
    change=change+length(iif);
    violv=[violv;bmin(iif)-b(iif)];
end

im=find(b(ibfree) > bmax(ibfree));
if length(im) ~= 0 & length(ibfree) ~= 0,
    iif=ibfree(im);
    ibvls=iif;
    disp('Shunt compensation above the maximum in bus')
    disp(iif')
    disp(b(iif)')
    change=change+length(iif);
    violv=[violv;b(iif)-bmax(iif)];
end

im=find(pg(ipgfree) < pgmin(ipgfree));
if length(im) ~= 0 & length(ipgfree) ~= 0,
    iif=ipgfree(im);
    ipgvli=iif;
    disp('Active power generation below the minimum in bus')
    disp(iif')
    disp(pg(iif)')
    change=change+length(iif);
    violv=[violv;pgmin(iif)-pg(iif)];
end

im=find(pg(ipgfree) - pgmax(ipgfree) > 0);
if length(im) ~= 0 & length(ipgfree) ~= 0,
    iif=ipgfree(im);
    ipgvls=iif;
    disp('Active power generation above the maximum in bus')
    disp(iif')
    disp(pg(iif)')
    disp(pgmax(iif)')
    change=change+length(iif);
    violv=[violv;pg(iif)-pgmax(iif)];
end

im=find(qg(iqgfree) < qgmin(iqgfree));
if length(im) ~= 0 & length(iqgfree) ~= 0,
    iif=iqgfree(im);
    iqgvli=iif;
    disp('Reactive power generation below the minimum in bus')
    disp(iif')
    disp(qg(iif)')
    change=change+length(iif);
    violv=[violv;qgmin(iif)-qg(iif)];
end

im=find(qg(iqgfree) > qgmax(iqgfree));
if length(im) ~= 0 & length(iqgfree) ~= 0,
    iif=iqgfree(im);
    iqgvls=iif;
    disp('Reactive power generation above the maximum in bus')
    disp(iif')
    disp(qg(iif)')
    change=change+length(iif);
    violv= [violv;qg(iif)-qgmax(iif)];
end

if w5~=0
    im=find(qg1(iqg1free) < 0);
    if length(im) ~= 0 & length(iqg1free) ~= 0,
        iif=iqg1free(im);
        iqg1vli=iif;
        disp('Reactive power generation (1) below the minimum in bus')
        disp(iif')
        disp(qg1(iif)')
        change=change+length(iif);
        violv=[violv;0-qg1(iif)];
        qgvio=1;
        qglim=0;
        qgbar=min(iif);
    end

    im=find(qg1(iqg1free) > qg01(iqg1free));
    if length(im) ~= 0 & length(iqg1free) ~= 0,
        iif=iqg1free(im);
        iqg1vls=iif;
        disp('Reactive power generation (1) above the maximum in bus')
        disp(iif')
        disp(qg1(iif)')
        change=change+length(iif);
        violv= [violv;qg1(iif)-qg01(iif)];
        qgvio=1;
        qglim=1;
        qgbar=min(iif);
    end

    im=find(qg2(iqg2free) < qg01(iqg2free));
    if length(im) ~= 0 & length(iqg2free) ~= 0,
        iif=iqg2free(im);
        iqg2vli=iif;
        disp('Reactive power generation (2) below the minimum in bus')
        disp(iif')
        disp(qg2(iif)')
        change=change+length(iif);
        violv=[violv;qg01(iif)-qg2(iif)];
        if length(qgvio) == 0
            qgvio=2;
            qglim=0;
            qgbar=min(iif);
        end
    end

    im=find(qg2(iqg2free) > qg12(iqg2free));
    if length(im) ~= 0 & length(iqg2free) ~= 0,
        iif=iqg2free(im);
        iqg2vls=iif;
        disp('Reactive power generation (2) above the maximum in bus')
        disp(iif')
        disp(qg2(iif)')
        change=change+length(iif);
        violv= [violv;qg2(iif)-qg12(iif)];
        if length(qgvio) == 0
            qgvio=2;
            qglim=1;
            qgbar=min(iif);
        end
    end

    im=find(qg3(iqg3free) < qg12(iqg3free));
    if length(im) ~= 0 & length(iqg3free) ~= 0,
        iif=iqg3free(im);
        iqg3vli=iif;
        disp('Reactive power generation (3) below the minimum in bus')
        disp(iif')
        disp(qg3(iif)')
        change=change+length(iif);
        violv=[violv;qg12(iif)-qg3(iif)];
        if length(qgvio) == 0
            qgvio=3;
            qglim=0;
            qgbar=min(iif);
        end
    end

    im=find(qg3(iqg3free) > qgmaxt(iqg3free));
    if length(im) ~= 0 & length(iqg3free) ~= 0,
        iif=iqg3free(im);
        iqg3vls=iif;
        disp('Reactive power generation (3) above the maximum in bus')
        disp(iif')
        disp(qg3(iif)')
        change=change+length(iif);
        violv= [violv;qg3(iif)-qgmaxt(iif)];
        if length(qgvio) == 0
            qgvio=3;
            qglim=1;
            qgbar=min(iif);
        end
    end

    im=find(qg4(iqg4free) < qg03(iqg4free));
    if length(im) ~= 0 & length(iqg4free) ~= 0,
        iif=iqg4free(im);
        iqg4vli=iif;
        disp('Reactive power generation (4) below the minimum in bus')
        disp(iif')
        disp(qg4(iif)')
        change=change+length(iif);
        violv=[violv;qg03(iif)-qg4(iif)];
        if length(qgvio) == 0
            qgvio=4;
            qglim=0;
            qgbar=min(iif);
        end
    end

    im=find(qg4(iqg4free) > 0);
    if length(im) ~= 0 & length(iqg4free) ~= 0,
        iif=iqg4free(im);
        iqg4vls=iif;
        disp('Reactive power generation (4) above the maximum in bus')
        disp(iif')
        disp(qg4(iif)')
        change=change+length(iif);
        violv= [violv;qg4(iif)];
        if length(qgvio) == 0
            qgvio=4;
            qglim=1;
            qgbar=min(iif);
        end
    end

    im=find(qg5(iqg5free) < qg34(iqg5free));
    if length(im) ~= 0 & length(iqg5free) ~= 0,
        iif=iqg5free(im);
        iqg5vli=iif;
        disp('Reactive power generation (5) below the minimum in bus')
        disp(iif')
        disp(qg5(iif)')
        change=change+length(iif);
        violv=[violv;qg34(iif)-qg5(iif)];
        if length(qgvio) == 0
            qgvio=5;
            qglim=0;
            qgbar=min(iif);
        end
    end

    im=find(qg5(iqg5free) > qg03(iqg5free));
    if length(im) ~= 0 & length(iqg5free) ~= 0,
        iif=iqg5free(im);
        iqg5vls=iif;
        disp('Reactive power generation (5) above the maximum in bus')
        disp(iif')
        disp(qg5(iif)')
        change=change+length(iif);
        violv= [violv;qg5(iif)-qg03(iif)];
        if length(qgvio) == 0
            qgvio=5;
            qglim=1;
            qgbar=min(iif);
        end
    end

    im=find(qg6(iqg6free) < qgmint(iqg6free));
    if length(im) ~= 0 & length(iqg6free) ~= 0,
        iif=iqg6free(im);
        iqg6vli=iif;
        disp('Reactive power generation (6) below the minimum in bus')
        disp(iif')
        disp(qg6(iif)')
        change=change+length(iif);
        violv=[violv;qgmint(iif)-qg6(iif)];
        if length(qgvio) == 0
            qgvio=6;
            qglim=0;
            qgbar=min(iif);
        end
    end

    im=find(qg6(iqg6free) > qg34(iqg6free));
    if length(im) ~= 0 & length(iqg6free) ~= 0,
        iif=iqg6free(im);
        iqg6vls=iif;
        disp('Reactive power generation (6) above the maximum in bus')
        disp(iif')
        disp(qg6(iif)')
        change=change+length(iif);
        violv= [violv;qg6(iif)-qg34(iif)];
        if length(qgvio) == 0
            qgvio=6;
            qglim=1;
            qgbar=min(iif);
        end
    end
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  the sign of the Lagrange multipliers wrt active bounds  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

im=find(lambda(ivmin) > 0);
if length(im) ~= 0 & length(ivmin) ~= 0,
    iif=ivmin(im);
    ilvli=iif;
    disp('Lagrange multiplier wrt voltage magnitude at lower limit')
    disp(iif')
    disp(lambda(iif)')
    change=change+length(iif);
    violv=[violv;lambda(iif)];
end

im=find(lambda(ivmax) < 0);
if length(im) ~= 0 & length(ivmax) ~= 0,
    iif=ivmax(im);
    ilvls=iif;
    disp('Lagrange multipliers wrt voltage magnitude at upper limit')
    disp(iif')
    disp(lambda(iif)')
    change=change+length(iif);
    violv=[violv;lambda(iif)];
end

im=find(mi(ibmin) > 0);
if length(im) ~= 0 & length(ibmin) ~= 0,
    iif=ibmin(im);
    imvli=iif;
    disp('Lagrange multiplier wrt shunt compensation at lower limit')
    disp(iif')
    disp(mi(iif)')
    change=change+length(iif);
    violv=[violv;mi(iif)];
end

im=find(mi(ibmax) < 0);
if length(im) ~= 0 & length(ibmax) ~= 0,
    iif=ibmax(im);
    imvls=iif;
    disp('Lagrange multiplier wrt shunt compensation at upper limit')
    disp(iif')
    disp(mi(iif)')
    change=change+length(iif);
    violv=[violv;mi(iif)];
end

im=find(gama(ipgmin) > 0);
if length(im) ~= 0 & length(ipgmin) ~= 0,
    iif=ipgmin(im);
    igvli=iif;
    disp('Lagrange multiplier wrt active generation at lower limit')
    disp(iif')
    disp(gama(iif)')
    change=change+length(iif);
    violv=[violv;gama(iif)];
end

im=find(gamamax(ipgmax) < 0);
if length(im) ~= 0 & length(ipgmax) ~= 0,
    iif=ipgmax(im);
    igvls=iif;
    disp('Lagrange multiplier wrt active generation at upper limit')
    disp(iif')
    disp(gamamax(iif)')

    change=change+length(iif);
    violv=[violv;gama(iif)];
end

im=find(ro(iqgmin) > 0);
if length(im) ~= 0 & length(iqgmin) ~= 0,
    iif=iqgmin(im);
    irvli=iif;
    disp('Lagrange multiplier wrt reactive generation at lower limit')
    disp(iif')
    disp(ro(iif)')
    change=change+length(iif);
    violv=[violv;ro(iif)];
end

im=find(ro(iqgmax) < 0);
if length(im) ~= 0 & length(iqgmax) ~= 0,
    iif=iqgmax(im);
    irvls=iif;
    disp('Lagrange multiplier wrt reactive generation at upper limit')
    disp(iif')
    disp(ro(iif)')
    change=change+length(iif);
    violv=[violv;ro(iif)];
end

if w5~=0
    im=find(ro1(iqg1min) > 0);
    if length(im) ~= 0 & length(iqg1min) ~= 0,
        iif=iqg1min(im);
        ir1vli=iif;
        disp('Lagrange multiplier wrt reactive generation (1) at lower limit')
        disp(iif')
        disp(ro1(iif)')
        change=change+length(iif);
        violv=[violv;ro1(iif)];
    end

    im=find(ro1(iqg1max) < 0);
    if length(im) ~= 0 & length(iqg1max) ~= 0,
        iif=iqg1max(im);
        ir1vls=iif;
        disp('Lagrange multiplier wrt reactive generation (1) at upper limit')
        disp(iif')
        disp(ro1(iif)')
        change=change+length(iif);
        violv=[violv;ro1(iif)];
    end

    im=find(ro2(iqg2min) > 0);
    if length(im) ~= 0 & length(iqg2min) ~= 0,
        iif=iqg2min(im);
        ir2vli=iif;
        disp('Lagrange multiplier wrt reactive generation (2) at lower limit')
        disp(iif')
        disp(ro2(iif)')
        change=change+length(iif);
        violv=[violv;ro2(iif)];
    end

    im=find(ro2(iqg2max) < 0);
    if length(im) ~= 0 & length(iqg2max) ~= 0,
        iif=iqg2max(im);
        ir2vls=iif;
        disp('Lagrange multiplier wrt reactive generation (2) at upper limit')
        disp(iif')
        disp(ro2(iif)')
        change=change+length(iif);
        violv=[violv;ro2(iif)];
    end

    im=find(ro3(iqg3min) > 0);
    if length(im) ~= 0 & length(iqg3min) ~= 0,
        iif=iqg3min(im);
        ir3vli=iif;
        disp('Lagrange multiplier wrt reactive generation (3) at lower limit')
        disp(iif')
        disp(ro3(iif)')
        change=change+length(iif);
        violv=[violv;ro3(iif)];
    end

    im=find(ro3(iqg3max) < 0);
    if length(im) ~= 0 & length(iqg3max) ~= 0,
        iif=iqg3max(im);
        ir3vls=iif;
        disp('Lagrange multiplier wrt reactive generation (3) at upper limit')
        disp(iif')
        disp(ro3(iif)')
        change=change+length(iif);
        violv=[violv;ro3(iif)];
    end

    im=find(ro4(iqg4min) > 0);
    if length(im) ~= 0 & length(iqg4min) ~= 0,
        iif=iqg4min(im);
        ir4vli=iif;
        disp('Lagrange multiplier wrt reactive generation (4) at lower limit')
        disp(iif')
        disp(ro4(iif)')
        change=change+length(iif);
        violv=[violv;ro4(iif)];
    end

    im=find(ro4(iqg4max) < 0);
    if length(im) ~= 0 & length(iqg4max) ~= 0,
        iif=iqg4max(im);
        ir4vls=iif;
        disp('Lagrange multiplier wrt reactive generation (4) at upper limit')
        disp(iif')
        disp(ro4(iif)')
        change=change+length(iif);
        violv=[violv;ro4(iif)];
    end

    im=find(ro5(iqg5min) > 0);
    if length(im) ~= 0 & length(iqg5min) ~= 0,
        iif=iqg5min(im);
        ir5vli=iif;
        disp('Lagrange multiplier wrt reactive generation (5) at lower limit')
        disp(iif')
        disp(ro5(iif)')
        change=change+length(iif);
        violv=[violv;ro5(iif)];
    end

    im=find(ro5(iqg5max) < 0);
    if length(im) ~= 0 & length(iqg5max) ~= 0,
        iif=iqg5max(im);
        ir5vls=iif;
        disp('Lagrange multiplier wrt reactive generation (5) at upper limit')
        disp(iif')
        disp(ro5(iif)')
        change=change+length(iif);
        violv=[violv;ro5(iif)];
    end

    im=find(ro6(iqg6min) > 0);
    if length(im) ~= 0 & length(iqg6min) ~= 0,
        iif=iqg6min(im);
        ir6vli=iif;
        disp('Lagrange multiplier wrt reactive generation (6) at lower limit')
        disp(iif')
        disp(ro6(iif)')
        change=change+length(iif);
        violv=[violv;ro6(iif)];
    end

    im=find(ro6(iqg6max) < 0);
    if length(im) ~= 0 & length(iqg6max) ~= 0,
        iif=iqg6max(im);
        ir6vls=iif;
        disp('Lagrange multiplier wrt reactive generation (6) at upper limit')
        disp(iif')
        disp(ro6(iif)')
        change=change+length(iif);
        violv=[violv;ro6(iif)];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check ineq. lim. for active power flows %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
iflvli=[];
iflvls=[];
isvli=[];
isvls=[];

if klt==0
    fl(iflfree)=full(real(sl(iflfree))-(1-epsilon)*efl(iflfree));
else
    fl(iflfree)=(real(sl(iflfree)));
end

ican= find(abs(fl(iflfree)) > 0.8*flmax(iflfree));
if length(ican)~=0
    iican=iflfree(ican);
end

% checking free limits

im=find(fl(iflfree) < flmin(iflfree));
if length(im) ~= 0 & length(iflfree) ~= 0,
    iif=iflfree(im);
    iflvli=iif;
    disp('Line flow below the minimum on line')
    disp(iif')
    disp(fl(iif)')
    change=change+length(iif);
    violv=[violv;flmin(iif)-fl(iif)];
end

im=find(fl(iflfree) > flmax(iflfree));
if length(im) ~= 0 & length(iflfree) ~= 0,
    iif=iflfree(im);
    iflvls=iif;
    disp('Line flow above the maximum on line')
    disp(iif')
    disp(fl(iif)')
    change=change+length(iif);
    violv= [violv;fl(iif)-flmax(iif)];
end

im=find(sigma(iflmin) > 0);
if length(im) ~= 0 & length(iflmin) ~= 0,
    iif=iflmin(im);
    isvli=iif;
    disp('Lagrange multiplier wrt line flow at lower limit')
    disp(iif')
    disp(sigma(iif)')
    change=change+length(iif);
    violv=[violv;sigma(iif)];
end

im=find(sigma(iflmax) < 0);
if length(im) ~= 0 & length(iflmax) ~= 0,
    iif=iflmax(im);
    isvls=iif;
    disp('Lagrange multiplier wrt line at upper limit')
    disp(iif')
    disp(sigma(iif)')
    change=change+length(iif);
    violv=[violv;sigma(iif)];
end