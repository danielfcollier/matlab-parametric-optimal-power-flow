pgmax = zeros(1,nt)';
for i = 1:length(ipgnf)
    pgmax(ipgnf(i)) = polyval(funcao(:,i),qg(ipgnf(i)));
end
d1pgmax = zeros(1,nt)';
for i = 1:length(ipgnf)
    d1pgmax(ipgnf(i)) = polyval(der1(:,i),qg(ipgnf(i)));
end
d2pgmax = zeros(1,nt)';
for i = 1:length(ipgnf)
    d2pgmax(ipgnf(i)) = polyval(der2(:,i),qg(ipgnf(i)));
end