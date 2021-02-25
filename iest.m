% versões estendidas de alpha, beta e theta
for i=1:nt
    alphaE(i) = alpha(est(i));
    betaE(i) = beta(est(i));
    if w5~=0
        thetaE(i) = theta(est(i));
    end
end
