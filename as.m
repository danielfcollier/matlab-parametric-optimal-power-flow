% as.m  -  store the feasible set
%
if change==0
     ripgfree=ipgfree;
     ripgmin= ipgmin;
     ripgmax= ipgmax;
     riqgfree=iqgfree;
     riqgmin= iqgmin;
     riqgmax= iqgmax;
     
     if w5~=0
         riqg1max=iqg1max;
         riqg1min=iqg1min;
         riqg1free=iqg1free;
         riqg2max=iqg2max;
         riqg2min=iqg2min;
         riqg2free=iqg2free;
         riqg3max=iqg3max;
         riqg3min=iqg3min;
         riqg3free=iqg3free;
         riqg4max=iqg4max;
         riqg4min=iqg4min;
         riqg4free=iqg4free;
         riqg5max=iqg5max;
         riqg5min=iqg5min;
         riqg5free=iqg5free;
         riqg6max=iqg6max;
         riqg6min=iqg6min;
         riqg6free=iqg6free;
     end
     
     rivfree= ivfree;
     rivmin=  ivmin;
     rivmax=  ivmax;
     ribfree= ibfree;
     ribmin=  ibmin;
     ribmax=  ibmax;
     riflmin= iflmin;
     riflmax= iflmax;
     rifllim= ifllim;
     riflfree=iflfree;    
else
     ipgfree= ripgfree;
     ipgmin = ripgmin;
     ipgmax = ripgmax;
     iqgfree= riqgfree;
     iqgmin = riqgmin;
     iqgmax = riqgmax;
     
     if w5~=0
         iqg1max=riqg1max;
         iqg1min=riqg1min;
         iqg1free=riqg1free;
         iqg2max=riqg2max;
         iqg2min=riqg2min;
         iqg2free=riqg2free;
         iqg3max=riqg3max;
         iqg3min=riqg3min;
         iqg3free=riqg3free;
         iqg4max=riqg4max;
         iqg4min=riqg4min;
         iqg4free=riqg4free;
         iqg5max=riqg5max;
         iqg5min=riqg5min;
         iqg5free=riqg5free;
         iqg6max=riqg6max;
         iqg6min=riqg6min;
         iqg6free=riqg6free;
     end
     
     ivfree = rivfree;
     ivmin  = rivmin;
     ivmax  = rivmax;
     ibfree = ribfree;
     ibmin  = ribmin;
     ibmax  = ribmax;
     iflmin= riflmin;
     iflmax= riflmax;
     ifllim= rifllim;
     iflfree=riflfree;
     nflmin=length(iflmin);
     nflmax=length(iflmax);
     nfllim=length(ifllim);     
end
