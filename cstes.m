 %
% control strategy
%
if change == 1 & change1==0
    luepsilon=1;
    change1= change;
    ca1                                       % change active set   
    de                                        % update derivatives
    er                                        % update error
    ge0= ge;                                  % initial error in lagr. 
    keps=0;
elseif change~=0 & change1~= 0
    disp('The current coninuation parameter is          ')
    disp(epsilon)
    luepsilon= epsilon;
    if epsilon==1
        keps=1;
    end 
    if klt==1
        %if luepsilon==1 & laepsilon==0
        %    epsilon= 0.05;
        %    deltaeps= 0.05;
        %else
        epsilon=laepsilon+(epsilon-laepsilon)/2;
        %end
    else
        epsilon=laepsilon+(epsilon-laepsilon)/2;
    end
    disp('New continuation parameter                                 ')
    disp(epsilon)
    if klt==1
        pd= pd0+ epsilon*delpd;
        qd= qd0+ epsilon*delqd;
    end
    %
    %  restarting from the last aceptable solution
    %
    d=rd(:,ite);
    v=rv(:,ite);
    b=rb(:,ite);
    pg=rpg(:,ite);
    qg=rqg(:,ite);
    stotal
    if w5~=0
        qg1=rqg1(:,ite);
        qg2=rqg2(:,ite);
        qg3=rqg3(:,ite);
        qg4=rqg4(:,ite);
        qg5=rqg5(:,ite);
        qg6=rqg6(:,ite);
        theta=rtheta(:,ite);
    end
    alpha=ralpha(:,ite);
    beta=rbeta(:,ite);
    fl=rfl(:,ite);
    sigma=rsigma(:,ite);
    gamamax(iqgnf) = rgamamax(:,ite);
    
    as                                      % reconstruct the active set
    de                                      % update derivatives
    er                                      % update error
    change1= 0;
    trial=trial+1;
    nrtrial(trial)= nit;
    ge0=ge;
elseif change == 0
    disp('No need of change in the active constraint set           ')
    laepsilon=epsilon;                      % last acceptable epsilon
    st                                      % statistics
    as                                      % last acceptable feasible set
    
    if epsilon < 1
        if luepsilon==1
            if (epsilon+deltaeps) > 1 & change1==0 & keps==1
                delta= (luepsilon-epsilon)/2;
            else
			%am
			%lipr 
                delta= deltaeps;
            end
        else
            delta=(luepsilon-epsilon)/2;
        end
        epsilon=epsilon+delta;
        if epsilon > 1
            epsilon = 1;
        end
        disp('New continuation parameter')
        disp(epsilon)
        if klt==1
            pd= pd0+ epsilon*delpd;
            qd= qd0+ epsilon*delqd;
        end
        er
    end
    change1= change;
    ge0=ge; 
else
    disp('The current continuation parameter is                      ')
    disp(epsilon)
    luepsilon=epsilon;
    if epsilon==1
        keps=1;
    end                     
    if klt==1
        %if luepsilon==1 & laepsilon==0
        %    epsilon=0.05;
        %    deltaeps=0.05;
        % else
        epsilon= laepsilon+(epsilon-laepsilon)/2;
        %end
    else
        epsilon=laepsilon+(epsilon-laepsilon)/2;
    end
    disp('New continuation parameter                                 ')
    disp(epsilon)
    if klt==1
        pd= pd0+ epsilon*delpd;
        qd= qd0+ epsilon*delqd;
    end
    %
    %  restarting from the last aceptable solution
    %
    d=rd(:,ite);
    v=rv(:,ite);
    b=rb(:,ite);
    pg=rpg(:,ite);
    qg=rqg(:,ite);
    stotal
    
    if w5~=0
        qg1=rqg1(:,ite);
        qg2=rqg2(:,ite);
        qg3=rqg3(:,ite);
        qg4=rqg4(:,ite);
        qg5=rqg5(:,ite);
        qg6=rqg6(:,ite);
        theta=rtheta(:,ite);
    end

    fl=rfl(:,ite);

    alpha=ralpha(:,ite);
    beta=rbeta(:,ite);
    
    gamamax(iqgnf) = rgamamax(:,ite);

    sigma=rsigma(:,ite);
    
    if delta < toler && w5~=0
        perg=length(qgvio);
        if perg == 1
            wqg=qgvio;
            lqg=qglim;
            bqg=qgbar;
            if wqg == 1
                teste=find(iqg1free ~= bqg);
                iqg1free=iqg1free(teste);
                 
                if lqg==1
                    qg1(bqg)=qg01(bqg);
                    iqg1max=[iqg1max;bqg];
                else
                    qg1(bqg)=0;
                    iqg1min=[iqg1min;bqg];
                end
                    nqg1free=length(iqg1free);
            elseif wqg == 2
                teste=find(iqg2free ~= bqg);
                iqg2free=iqg2free(teste);
                 
                if lqg==1
                    qg2(bqg)=qg12(bqg);
                    iqg2max=[iqg2max;bqg];
                else
                    qg2(bqg)=qg01(bqg);
                    iqg2min=[iqg2min;bqg];
                end
                    nqg2free=length(iqg2free);
                elseif wqg == 3
                    teste=find(iqg3free ~= bqg);
                    iqg3free=iqg3free(teste);
                   
                    if lqg==1
                        qg3(bqg)=qgmaxt(bqg);
                        iqg3max=[iqg3max;bqg];
                    else
                        qg3(bqg)=qg12(bqg);
                        iqg3min=[iqg3min;bqg];
                    end
                    nqg3free=length(iqg3free);
                elseif wqg == 4
                    teste=find(iqg4free ~= bqg);
                    iqg4free=iqg4free(teste);
                   
                    if lqg==1
                        qg4(bqg)=0;
                        iqg4max=[iqg4max;bqg];
                    else
                        qg4(bqg)=qg03(bqg);
                        iqg4min=[iqg4min;bqg];
                    end
                    nqg4free=length(iqg4free);
               elseif wqg == 5
                    teste=find(iqg5free ~= bqg);
                    iqg5free=iqg5free(teste);
                   
                    if lqg==1
                        qg5(bqg)=qg03(bqg);
                        iqg5max=[iqg5max;bqg];
                    else
                        qg5(bqg)=qg34(bqg);
                        iqg5min=[iqg5min;bqg];
                    end
                    nqg5free=length(iqg5free);
               elseif wqg == 6
                    teste=find(iqg6free ~= bqg);
                    iqg6free=iqg6free(teste);
                   
                    if lqg==1
                        qg6(bqg)=qg34(bqg);
                        iqg6max=[iqg6max;bqg];
                    else
                        qg6(bqg)=qgmint(bqg);
                        iqg6min=[iqg6min;bqg];
                    end
                    nqg6free=length(iqg6free);
               end
           end
       end
         
       de                                       % update derivatives
       er                                       % update error
       ge0=ge;
       trial= trial+1;
       nrtrial(trial)= nit;
end
nit=0;                                          % Newton Raphson counter
