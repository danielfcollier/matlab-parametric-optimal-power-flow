% rotina para visualizar todas as cartas de capabilidade
sttim=[];
klt=0;                                  % phase 1: initial optimal sol.
in  
for i=1:length(ipgnf)
    est(ipgnf(i))
    find(est==est(ipgnf(i)))
    plot(qgmin(ipgnf(i)):0.01:qgmax(ipgnf(i)),polyval(funcao(:,i),qgmin(ipgnf(i)):0.01:qgmax(ipgnf(i))))
    hold on
    plot(rqg(ipgnf(i),:),rpg(ipgnf(i),:))
    plot(qg(ipgnf(i)),pg(ipgnf(i)),'*')
    plot(qgrmin(ipgnf(i)):0.01:qgrmax(ipgnf(i)),pgrmax(ipgnf(i))*ones(length(qgrmin(ipgnf(i)):0.01:qgrmax(ipgnf(i)))),'r--')
    plot(qgrmin(ipgnf(i)):0.01:qgrmax(ipgnf(i)),pgrmin(ipgnf(i))*ones(length(qgrmin(ipgnf(i)):0.01:qgrmax(ipgnf(i)))),'r--')
    plot(qgrmin(ipgnf(i))*ones(length(pgrmin(ipgnf(i)):0.01:pgrmax(ipgnf(i))),1),pgrmin(ipgnf(i)):0.01:pgrmax(ipgnf(i)),'r--')
    plot(qgrmax(ipgnf(i))*ones(length(pgrmin(ipgnf(i)):0.01:pgrmax(ipgnf(i))),1),pgrmin(ipgnf(i)):0.01:pgrmax(ipgnf(i)),'r--')

    keyboard
    close
end
