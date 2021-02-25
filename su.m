%
%
% Final solution
%
clc
disp('End of the Continuation Process')
disp('Optimal Solution')
disp('     bus      angle    voltage    active   reactive   bshunt')
disp(' ')
disp([biv full(d) full(v) full(pgt) full(qgt) full(b)])
disp('press ENTER to continue')
pause
clc
disp('   machine    active    reactive')
disp(' ')
disp([miv full(pg) full(qg)])
disp('press ENTER to continue')
pause
clc
disp(' ')
disp('     bus     lambda       mi       alpha     beta')
disp(' ')
disp([biv full(lambda) full(mi) full(alpha) full(beta)])
disp(' ')
disp('press ENTER to continue')
pause
clc
disp(' ')
disp('   machine     gama       ro')
disp(' ')
disp([miv full(gama) full(ro)])
disp(' ')
disp('Objective Function')
disp(full(of))
disp('press ENTER to continue')
pause
clc
