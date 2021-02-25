% criar versões de alpha, beta, theta, aa e bb estendidas
est = [];
aux = nm>1;
aux = aux.*(nm-1);

% a partir do vetor 'est' é possível saber a que barra a máquina
%   discriminada pertence
for i=1:nb
    est = [est i*ones(1,length(is(i):is(i)+aux(i)))];
end
    
for i=1:nt
    aaE(i) = aa(est(i));
    bbE(i) = bb(est(i));
    alphaE(i) = alpha(est(i));
    betaE(i) = beta(est(i));
    thetaE(i) = theta(est(i));
end