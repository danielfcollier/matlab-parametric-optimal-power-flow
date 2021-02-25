% Cálculo da potência total gerada nas barras
aux = nm>1;
aux = aux.*(nm-1);
for i=1:nb
    pgt(i) = sum(pg(is(i):is(i)+aux(i)));
    qgt(i) = sum(qg(is(i):is(i)+aux(i)));
end