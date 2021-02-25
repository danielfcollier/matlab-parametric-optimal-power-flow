%
%  Parameters
%
toler=1e-6;;                 % Newton Raphson tolerance
epsilon=0.0;                    % initial continuation parameter
luepsilon=1;                    % last unacceptable epsilon
keps=0;                         % key - epslon=1 was tested or not
ite=0;                          % initial continuation counter
maxnit=200;                     % maximum nymber of Newton Raphson iterations
change1=0;                      % counter for automatic backtracking
step= 1;                        % default step for the unidimensional search
trial=0;                        % initial counter for trial iterations
nrtrial= [];                    % initial counter for trial epsilon-iter.
ge0=0;                          % initial recorded error on lagrang.

clc
disp('      Objective function weighting factors     ')
disp('                                               ')
disp('Enter the weights that you want to work with:  ')
%
w1=input('  . generation:       ');
while isempty(w1)
   disp('w1 is not a number')
   w1=input('  . generation:       ');
end
%
w5=input('  . reactive gen:       ');
while isempty(w5)
   disp('w5 is not a number')
   w5=input('  . reactive gen:       ');
end
%
w2=input('  . losses:           ');
while isempty(w2)
   disp('w2 is not a number')
   w2=input('  . losses:           ');
end
%
w3=input('  . voltage profile:  ');
while isempty(w3)
   disp('w3 is not a number')
   w3=input('  . voltage profile:  ');
end
%
w4=input('  . penalty factor for variables.:  ');
while isempty(w4)
   disp('w4 is not a number')
   w4= input('  . shunt deviation:  ');
end
%
deltaeps=input('Enter the continuation parameter default increment:');
while isempty(deltaeps)
   disp('Default increment is not a number')
   deltaeps=input('Enter the continuation parameter default increment:');
end
deltaeps1=deltaeps;
slack= input('Enter the slack bus number: ')
while isempty(slack)
      disp('slack is not a number')
      slack= input('Enter the slack bus number: ')
end

clc
