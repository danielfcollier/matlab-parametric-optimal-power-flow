% Cria as derivadas dldpalpha, dldqbeta, dldqtheta
nt = nb+sum(nm)-sum(nm>0);
ieyem = nm+(nm==0);
md = sparse(nt,nb);
 
for i=1:nt
    md(i,est(i)) = 1;
end
