%
%       active constraint set change
%
% free variables inside their limits
%

im=find(pg(ipgfree) - pgmax(ipgfree) > 0);
if length(im) ~= 0 & length(ipgfree) ~= 0
    iif=ipgfree(im);
    pg(iif)=pgmax(iif);
    ipgmax=[ipgmax;iif];
    ss=zeros(length(ipgfree),1);
    ss(im)=iif;
    ifree=find(ipgfree-ss);
    if length(ifree)~=0
        ipgfree=ipgfree(ifree);
    else
        ipgfree=[];
    end
    npgfree=length(ipgfree);
    return
end

im=find(pg(ipgfree) < pgmin(ipgfree));
if length(im) ~= 0 & length(ipgfree) ~= 0,
    iif=ipgfree(im);
    pg(iif)=pgmin(iif);
    ipgmin=[ipgmin;iif];
    ss=zeros(length(ipgfree),1);
    ss(im)=iif;
    ifree=find(ipgfree-ss);
    if length(ifree)~=0
        ipgfree=ipgfree(ifree);
    else
        ipgfree=[];
    end
    npgfree=length(ipgfree);
    return
end

im=find(qg(iqgfree) > qgmax(iqgfree));
if length(im) ~= 0 & length(iqgfree) ~= 0,
    iif=iqgfree(im);
    qg(iif)=qgmax(iif);
    iqgmax=[iqgmax;iif];
    ss=zeros(length(iqgfree),1);
    ss(im)=iif;
    ifree=find(iqgfree-ss);
    if length(ifree)~=0
        iqgfree=iqgfree(ifree);
    else
        iqgfree=[];
    end
    nqgfree=length(iqgfree);
    return
end

im=find(qg(iqgfree) < qgmin(iqgfree));
if length(im) ~= 0 & length(iqgfree) ~= 0,
    iif=iqgfree(im);
    qg(iif)=qgmin(iif);
    iqgmin=[iqgmin;iif];
    ss=zeros(length(iqgfree),1);
    ss(im)=iif;
    ifree=find(iqgfree-ss);
    if length(ifree)~=0
        iqgfree=iqgfree(ifree);
    else
        iqgfree=[];
    end
    nqgfree=length(iqgfree);
    return
end

if w5~=0
    im=find(qg1(iqg1free) > qg01(iqg1free));
    if length(im) ~= 0 & length(iqg1free) ~= 0,
        iif=iqg1free(im);
        qg1(iif)=qg01(iif);
        iqg1max=[iqg1max;iif];
        ss=zeros(length(iqg1free),1);
        ss(im)=iif;
        ifree=find(iqg1free-ss);
        if length(ifree)~=0
            iqg1free=iqg1free(ifree);
        else
            iqg1free=[];
        end
        nqg1free=length(iqg1free);
        return
    end

    im=find(qg1(iqg1free) < 0);
    if length(im) ~= 0 & length(iqg1free) ~= 0,
        iif=iqg1free(im);
        qg1(iif)=0;
        iqg1min=[iqg1min;iif];
        ss=zeros(length(iqg1free),1);
        ss(im)=iif;
        ifree=find(iqg1free-ss);
        if length(ifree)~=0
            iqg1free=iqg1free(ifree);
        else
            iqg1free=[];
        end
        nqg1free=length(iqg1free);
        return
    end

    im=find(qg2(iqg2free) > qg12(iqg2free));
    if length(im) ~= 0 & length(iqg2free) ~= 0,
        iif=iqg2free(im);
        qg2(iif)=qg12(iif);
        iqg2max=[iqg2max;iif];
        ss=zeros(length(iqg2free),1);
        ss(im)=iif;
        ifree=find(iqg2free-ss);
        if length(ifree)~=0
            iqg2free=iqg2free(ifree);
        else
            iqg2free=[];
        end
        nqg2free=length(iqg2free);
        return
    end

    im=find(qg2(iqg2free) < qg01(iqg2free));
    if length(im) ~= 0 & length(iqg2free) ~= 0,
        iif=iqg2free(im);
        qg2(iif)=qg01(iif);
        iqg2min=[iqg2min;iif];
        ss=zeros(length(iqg2free),1);
        ss(im)=iif;
        ifree=find(iqg2free-ss);
        if length(ifree)~=0
            iqg2free=iqg2free(ifree);
        else
            iqg2free=[];
        end
        nqg2free=length(iqg2free);
        return
    end

    im=find(qg3(iqg3free) > qgmaxt(iqg3free));
    if length(im) ~= 0 & length(iqg3free) ~= 0,
        iif=iqg3free(im);
        qg3(iif)=qgmaxt(iif);
        iqg3max=[iqg3max;iif];
        ss=zeros(length(iqg3free),1);
        ss(im)=iif;
        ifree=find(iqg3free-ss);
        if length(ifree)~=0
            iqg3free=iqg3free(ifree);
        else
            iqg3free=[];
        end
        nqg3free=length(iqg3free);
        return
    end

    im=find(qg3(iqg3free) < qg12(iqg3free));
    if length(im) ~= 0 & length(iqg3free) ~= 0,
        iif=iqg3free(im);
        qg3(iif)=qg12(iif);
        iqg3min=[iqg3min;iif];
        ss=zeros(length(iqg3free),1);
        ss(im)=iif;
        ifree=find(iqg3free-ss);
        if length(ifree)~=0
            iqg3free=iqg3free(ifree);
        else
            iqg3free=[];
        end
        nqg3free=length(iqg3free);
        return
    end

    im=find(qg4(iqg4free) > 0);
    if length(im) ~= 0 & length(iqg4free) ~= 0,
        iif=iqg4free(im);
        qg4(iif)=0;
        iqg4max=[iqg4max;iif];
        ss=zeros(length(iqg4free),1);
        ss(im)=iif;
        ifree=find(iqg4free-ss);
        if length(ifree)~=0
            iqg4free=iqg4free(ifree);
        else
            iqg4free=[];
        end
        nqg4free=length(iqg4free);
        return
    end

    im=find(qg4(iqg4free) < qg03(iqg4free));
    if length(im) ~= 0 & length(iqg4free) ~= 0,
        iif=iqg4free(im);
        qg4(iif)=qg03(iif);
        iqg4min=[iqg4min;iif];
        ss=zeros(length(iqg4free),1);
        ss(im)=iif;
        ifree=find(iqg4free-ss);
        if length(ifree)~=0
            iqg4free=iqg4free(ifree);
        else
            iqg4free=[];
        end
        nqg4free=length(iqg4free);
        return
    end

    im=find(qg5(iqg5free) > qg03(iqg5free));
    if length(im) ~= 0 & length(iqg5free) ~= 0,
        iif=iqg5free(im);
        qg5(iif)=qg03(iif);
        iqg5max=[iqg5max;iif];
        ss=zeros(length(iqg5free),1);
        ss(im)=iif;
        ifree=find(iqg5free-ss);
        if length(ifree)~=0
            iqg5free=iqg5free(ifree);
        else
            iqg5free=[];
        end
        nqg5free=length(iqg5free);
        return
    end

    im=find(qg5(iqg5free) < qg34(iqg5free));
    if length(im) ~= 0 & length(iqg5free) ~= 0,
        iif=iqg5free(im);
        qg5(iif)=qg34(iif);
        iqg5min=[iqg5min;iif];
        ss=zeros(length(iqg5free),1);
        ss(im)=iif;
        ifree=find(iqg5free-ss);
        if length(ifree)~=0
            iqg5free=iqg5free(ifree);
        else
            iqg5free=[];
        end
        nqg5free=length(iqg5free);
        return
    end

    im=find(qg6(iqg6free) > qg34(iqg6free));
    if length(im) ~= 0 & length(iqg6free) ~= 0,
        iif=iqg6free(im);
        qg6(iif)=qg34(iif);
        iqg6max=[iqg6max;iif];
        ss=zeros(length(iqg6free),1);
        ss(im)=iif;
        ifree=find(iqg6free-ss);
        if length(ifree)~=0
            iqg6free=iqg6free(ifree);
        else
            iqg6free=[];
        end
        nqg6free=length(iqg6free);
        return
    end

    im=find(qg6(iqg6free) < qgmint(iqg6free));
    if length(im) ~= 0 & length(iqg6free) ~= 0,
        iif=iqg6free(im);
        qg6(iif)=qgmint(iif);
        iqg6min=[iqg6min;iif];
        ss=zeros(length(iqg6free),1);
        ss(im)=iif;
        ifree=find(iqg6free-ss);
        if length(ifree)~=0
            iqg6free=iqg6free(ifree);
        else
            iqg6free=[];
        end
        nqg6free=length(iqg6free);
        return
    end
end

im=find(v(ivfree) > vmax(ivfree));
if length(im) ~= 0 & length(ivfree) ~= 0,
    iif=ivfree(im);
    v(iif)=vmax(iif);
    ivmax=[ivmax;iif];
    ss=zeros(length(ivfree),1);
    ss(im)=iif;
    ifree=find(ivfree-ss);
    if length(ifree)~=0
        ivfree=ivfree(ifree);
    else
        ivfree=[];
    end
    nvfree=length(ivfree);
    return
end

im=find(v(ivfree) < vmin(ivfree));
if length(im) ~= 0 & length(ivfree),
    iif=ivfree(im);
    v(iif)=vmin(iif);
    ivmin=[ivmin;iif];
    ss=zeros(length(ivfree),1);
    ss(im)=iif;
    ifree=find(ivfree-ss);
    if length(ifree)~=0
        ivfree=ivfree(ifree);
    else
        ivfree=[];
    end
    nvfree=length(ivfree);
    return
end

im=find(b(ibfree) > bmax(ibfree));
if length(im) ~= 0 & length(ibfree),
    iif=ibfree(im);
    b(iif)=bmax(iif);
    ibmax=[ibmax;iif];
    ss=zeros(length(ibfree),1);
    ss(im)=iif;
    ifree=find(ibfree-ss);
    if length(ifree)~=0
        ibfree=ibfree(ifree);
    else
        ibfree=[];
    end
    nbfree=length(ibfree);
    return
end

im=find(b(ibfree) < bmin(ibfree));
if length(im) ~= 0 & length(ibfree),
    iif=ibfree(im);
    b(iif)=bmin(iif);
    ibmin=[ibmin;iif];
    ss=zeros(length(ibfree),1);
    ss(im)=iif;
    ifree=find(ibfree-ss);
    if length(ifree)~=0
        ibfree=ibfree(ifree);
    else
        ibfree=[];
    end
    nbfree=length(ibfree);
    return
end
%
% line flows outside limits
%
im= find(fl(iflfree) < flmin(iflfree));
if length(im) ~= 0 & length(iflfree) ~= 0
    iif=iflfree(im);
    fl(iif)=flmin(iif);
    isma= find(iflmin < iif);
    ibig= find(iflmin > iif);
    iis=iflmin(isma);
    iib=iflmin(ibig);
    iflmin=[iis;iif;iib];
    ss= zeros(length(iflfree),1);
    ss(im)=iif;
    ifree=find(iflfree-ss);
    if length(ifree) ~=0
        iflfree=iflfree(ifree);
    else
        iflfree=[];
    end
    ifllim=[iflmin;iflmax];
    nflmin=length(iflmin);
    nflfree=length(iflfree);
    nfllim=length(ifllim);
    return
end

im= find(fl(iflfree) > flmax(iflfree));
if length(im) ~= 0 & length(iflfree) ~= 0
    iif=iflfree(im);
    fl(iif)=flmax(iif);
    isma= find(iflmax < iif);
    ibig= find(iflmax > iif);
    iis=iflmax(isma);
    iib=iflmax(ibig);
    iflmax=[iis;iif;iib];
    ss= zeros(length(iflfree),1);
    ss(im)=iif;
    ifree=find(iflfree-ss);
    if length(ifree) ~=0
        iflfree=iflfree(ifree);
    else
        iflfree=[];
    end
    ifllim=[iflmin;iflmax];
    nflmax=length(iflmax);
    nflfree=length(iflfree);
    nfllim=length(ifllim);
    return
end
%
% The sign of the Lagrange multipliers with respect to active bounds
%
im=find(lambda(ivmax) < 0);
if length(im) ~= 0 & length(ivmax) ~= 0,
    iif=ivmax(im);
    ivfree=[ivfree;iif];
    ss=zeros(length(ivmax),1);
    ss(im)=iif;
    iimax=find(ivmax-ss);
    if length(iimax)~=0
        ivmax=ivmax(iimax);
    else
        ivmax=[];
    end
    nvfree=length(ivfree);
    return
end

im=find(lambda(ivmin) > 0);
if length(im) ~= 0 & length(ivmin) ~= 0,
    iif=ivmin(im);
    ivfree=[ivfree;iif];
    ss=zeros(length(ivmin),1);
    ss(im)=iif;
    iimin=find(ivmin-ss);
    if length(iimin)~=0
        ivmin=ivmin(iimin);
    else
        ivmin=[];
    end
    nvfree=length(ivfree);
    return
end

im=find(mi(ibmax) < 0);
if length(im) ~= 0 & length(ibmax) ~= 0,
    iif=ibmax(im);
    ibfree=[ibfree;iif];
    ss=zeros(length(ibmax),1);
    ss(im)=iif;
    iimax=find(ibmax-ss);
    if length(iimax)~=0
        ibmax=ibmax(iimax);
    else
        ibmax=[];
    end
    nbfree=length(ibfree);
    return
end

im=find(mi(ibmin) > 0);
if length(im) ~= 0 & length(ibmin) ~= 0,
    iif=ibmin(im);
    ibfree=[ibfree;iif];
    ss=zeros(length(ibmin),1);
    ss(im)=iif;
    iimin=find(ibmin-ss);
    if length(iimin)~=0
        ibmin=ibmin(iimin);
    else
        ibmin=[];
    end
    nbfree=length(ibfree);
    return
end

im=find(gamamax(ipgmax) < 0);
if length(im) ~= 0 & length(ipgmax) ~= 0,
    iif=ipgmax(im);
    ipgfree=[ipgfree;iif];
    gamamax(iif)=0;
    ss=zeros(length(ipgmax),1);
    ss(im)=iif;
    iimax=find(ipgmax-ss);
    if length(iimax)~=0
        ipgmax=ipgmax(iimax);
    else
        ipgmax=[];
    end
    npgfree=length(ipgfree);

end

im=find(gama(ipgmin) > 0);
if length(im) ~= 0 & length(ipgmin) ~= 0,
    iif=ipgmin(im);
    ipgfree=[ipgfree;iif];
    ss=zeros(length(ipgmin),1);
    ss(im)=iif;
    iimin=find(ipgmin-ss);
    if length(iimin)~=0
        ipgmin=ipgmin(iimin);
    else
        ipgmin=[];
    end
    npgfree=length(ipgfree);
    return
end

im=find(ro(iqgmax) < 0);
if length(im) ~= 0 & length(iqgmax) ~= 0,
    iif=iqgmax(im);
    iqgfree=[iqgfree;iif];
    ss=zeros(length(iqgmax),1);
    ss(im)=iif;
    iimax=find(iqgmax-ss);
    if length(iimax)~=0
        iqgmax=iqgmax(iimax);
    else
        iqgmax=[];
    end
    nqgfree=length(iqgfree);
    return
end

im=find(ro(iqgmin) > 0);
if length(im) ~= 0 & length(iqgmin) ~= 0,
    iif=iqgmin(im);
    iqgfree=[iqgfree;iif];
    ss=zeros(length(iqgmin),1);
    ss(im)=iif;
    iimin=find(iqgmin-ss);
    if length(iimin)~=0
        iqgmin=iqgmin(iimin);
    else
        iqgmin=[];
    end
    nqgfree=length(iqgfree);
    return
end

if w5~=0
    im=find(ro1(iqg1max) < 0);
    if length(im) ~= 0 & length(iqg1max) ~= 0,
        iif=iqg1max(im);
        iqg1free=[iqg1free;iif];
        ss=zeros(length(iqg1max),1);
        ss(im)=iif;
        iimax=find(iqg1max-ss);
        if length(iimax)~=0
            iqg1max=iqg1max(iimax);
        else
            iqg1max=[];
        end
        nqg1free=length(iqg1free);
        return
    end

    im=find(ro1(iqg1min) > 0);
    if length(im) ~= 0 & length(iqg1min) ~= 0,
        iif=iqg1min(im);
        iqg1free=[iqg1free;iif];
        ss=zeros(length(iqg1min),1);
        ss(im)=iif;
        iimin=find(iqg1min-ss);
        if length(iimin)~=0
            iqg1min=iqg1min(iimin);
        else
            iqg1min=[];
        end
        nqg1free=length(iqg1free);
        return
    end

    im=find(ro2(iqg2max) < 0);
    if length(im) ~= 0 & length(iqg2max) ~= 0,
        iif=iqg2max(im);
        iqg2free=[iqg2free;iif];
        ss=zeros(length(iqg2max),1);
        ss(im)=iif;
        iimax=find(iqg2max-ss);
        if length(iimax)~=0
            iqg2max=iqg2max(iimax);
        else
            iqg2max=[];
        end
        nqg2free=length(iqg2free);
        return
    end

    im=find(ro2(iqg2min) > 0);
    if length(im) ~= 0 & length(iqg2min) ~= 0,
        iif=iqg2min(im);
        iqg2free=[iqg2free;iif];
        ss=zeros(length(iqg2min),1);
        ss(im)=iif;
        iimin=find(iqg2min-ss);
        if length(iimin)~=0
            iqg2min=iqg2min(iimin);
        else
            iqg2min=[];
        end
        nqg2free=length(iqg2free);
        return
    end

    im=find(ro3(iqg3max) < 0);
    if length(im) ~= 0 & length(iqg3max) ~= 0,
        iif=iqg3max(im);
        iqg3free=[iqg3free;iif];
        ss=zeros(length(iqg3max),1);
        ss(im)=iif;
        iimax=find(iqg3max-ss);
        if length(iimax)~=0
            iqg3max=iqg3max(iimax);
        else
            iqg3max=[];
        end
        nqg3free=length(iqg3free);
        return
    end

    im=find(ro3(iqg3min) > 0);
    if length(im) ~= 0 & length(iqg3min) ~= 0,
        iif=iqg3min(im);
        iqg3free=[iqg3free;iif];
        ss=zeros(length(iqg3min),1);
        ss(im)=iif;
        iimin=find(iqg3min-ss);
        if length(iimin)~=0
            iqg3min=iqg3min(iimin);
        else
            iqg3min=[];
        end
        nqg3free=length(iqg3free);
        return
    end

    im=find(ro4(iqg4max) < 0);
    if length(im) ~= 0 & length(iqg4max) ~= 0,
        iif=iqg4max(im);
        iqg4free=[iqg4free;iif];
        ss=zeros(length(iqg4max),1);
        ss(im)=iif;
        iimax=find(iqg4max-ss);
        if length(iimax)~=0
            iqg4max=iqg4max(iimax);
        else
            iqg4max=[];
        end
        nqg4free=length(iqg4free);
        return
    end

    im=find(ro4(iqg4min) > 0);
    if length(im) ~= 0 & length(iqg4min) ~= 0,
        iif=iqg4min(im);
        iqg4free=[iqg4free;iif];
        ss=zeros(length(iqg4min),1);
        ss(im)=iif;
        iimin=find(iqg4min-ss);
        if length(iimin)~=0
            iqg4min=iqg4min(iimin);
        else
            iqg4min=[];
        end
        nqg4free=length(iqg4free);
        return
    end

    im=find(ro5(iqg5max) < 0);
    if length(im) ~= 0 & length(iqg5max) ~= 0,
        iif=iqg5max(im);
        iqg5free=[iqg5free;iif];
        ss=zeros(length(iqg5max),1);
        ss(im)=iif;
        iimax=find(iqg5max-ss);
        if length(iimax)~=0
            iqg5max=iqg5max(iimax);
        else
            iqg5max=[];
        end
        nqg5free=length(iqg5free);
        return
    end

    im=find(ro5(iqg5min) > 0);
    if length(im) ~= 0 & length(iqg5min) ~= 0,
        iif=iqg5min(im);
        iqg5free=[iqg5free;iif];
        ss=zeros(length(iqg5min),1);
        ss(im)=iif;
        iimin=find(iqg5min-ss);
        if length(iimin)~=0
            iqg5min=iqg5min(iimin);
        else
            iqg5min=[];
        end
        nqg5free=length(iqg5free);
        return
    end

    im=find(ro6(iqg6max) < 0);
    if length(im) ~= 0 & length(iqg6max) ~= 0,
        iif=iqg6max(im);
        iqg6free=[iqg6free;iif];
        ss=zeros(length(iqg6max),1);
        ss(im)=iif;
        iimax=find(iqg6max-ss);
        if length(iimax)~=0
            iqg6max=iqg6max(iimax);
        else
            iqg6max=[];
        end
        nqg6free=length(iqg6free);
        return
    end

    im=find(ro6(iqg6min) > 0);
    if length(im) ~= 0 & length(iqg6min) ~= 0,
        iif=iqg6min(im);
        iqg6free=[iqg6free;iif];
        ss=zeros(length(iqg6min),1);
        ss(im)=iif;
        iimin=find(iqg6min-ss);
        if length(iimin)~=0
            iqg6min=iqg6min(iimin);
        else
            iqg6min=[];
        end
        nqg6free=length(iqg6free);
        return
    end
end
%
% violated signs of lagrange multipliers wrt line flows
%
im= find(sigma(iflmin) > 0);
if length(im) ~= 0 & length(iflmin) ~= 0
    iif=iflmin(im);
    sigma(iif)=0;
    isma= find(iflfree < iif);
    ibig= find(iflfree > iif);
    iis=iflfree(isma);
    iib=iflfree(ibig);
    iflfree=[iis;iif;iib];
    ss=zeros(length(iflmin),1);
    ss(im)=iif;
    iimin=find(iflmin-ss);
    if length(iimin)~=0
        iflmin=iflmin(iimin);
    else
        iflmin=[];
    end
    ifllim=[iflmin;iflmax];
    nflmin=length(iflmin);
    nflfree=length(iflfree);
    nfllim=length(ifllim);
    return
end

im= find(sigma(iflmax) < 0);
if length(im) ~= 0 & length(iflmax) ~= 0
    iif=iflmax(im);
    sigma(iif)=0;
    isma= find(iflfree < iif);
    ibig= find(iflfree > iif);
    iis=iflfree(isma);
    iib=iflfree(ibig);
    iflfree=[iis;iif;iib];
    ss=zeros(length(iflmax),1);
    ss(im)=iif;
    iimin=find(iflmax-ss);
    if length(iimin)~=0
        iflmax=iflmax(iimin);
    else
        iflmax=[];
    end
    ifllim=[iflmin;iflmax];
    nflmax=length(iflmax);
    nflfree=length(iflfree);
    nfllim=length(ifllim);
    return
end
