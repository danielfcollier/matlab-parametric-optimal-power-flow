perg = input('Do you want to load the capability curves from the file? (Yes = 1/No = 0)?');
if perg == 0
pn=sn.*fp;
qn=sqrt(sn.^2-pn.^2);
emax=sqrt((xs.*pn).^2 + (xs.*qn + 1).^2);
qol=-1./xs;
pe=pn;
qe=-qn;
ger=find(sn);
funcao=[];
limites=[];
for i = 1:length(ger)
    x1=(-1./xs(ger(i))):0.001:(-sqrt(sn(ger(i)).^2-pn(ger(i)).^2));
    y1=(pe(ger(i))./(qe(ger(i))-qol(ger(i)))).*(x1-qol(ger(i)));
    x2=(-sqrt(sn(ger(i)).^2-pn(ger(i)).^2)):0.001:(sqrt(sn(ger(i)).^2-pn(ger(i)).^2));
    y2=sqrt(sn(ger(i)).^2-x2.^2);
    x3=(sqrt(sn(ger(i)).^2-pn(ger(i)).^2)):0.001:(emax(ger(i))./xs(ger(i))-1./xs(ger(i)));
    y3=(1./xs(ger(i))).*sqrt(emax(ger(i)).^2-(x3.*xs(ger(i))+1).^2);
    x4=[x1 x2 x3];
    y4=[y1 y2 y3];
    q = polyfit(x4,y4,41);
    q1 = polyder(q);
    q2 = polyder(q1);
    p = [min(x4) max(x4)];
    if length(funcao) == 0
        funcao = q';
        der1 = q1';
        der2 = q2';
        limites = p';
    else
        funcao = [funcao q'];
        limites = [limites p'];
        der1 = [der1 q1'];
        der2 = [der2 q2'];
    end
end
perg2 = input('Do you want to save the capability curves in a file? (Yes = 1/ No = 0)');
if perg2 == 1
    clock;
    Sistema = [num2str(nb) '-bar system - ' date ' - ' num2str(ans(4)) ':' num2str(ans(5)) ':' num2str(ans(6))]
    save capab.mat funcao limites der1 der2 ger Sistema
    clear Sistema
end
elseif perg == 1
    load capab.mat funcao limites der1 der2 ger Sistema
    Sistema
    pause
    clear Sistema
end