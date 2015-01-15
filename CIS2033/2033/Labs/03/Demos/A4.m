distnames = {'Uniform', 'Exponential', 'GeneralizedPareto','Normal'};
colors = {'b','c','k','m','r'};
%X ~ U(0, beta);
betas=[1];
numOfPoints = 10^5;
for i=1:length(betas)
    uds = makedist(distnames{1},'lower',0,'upper',betas(i));
    ys = random(uds,numOfPoints,1);
end
%Exp(lambda): X = -1/lambda ln(U);
X1 = -1/2 * log(ys);
fig = figure;
hist(X1);
legend('Exp(2)');
saveas(fig,'A4a.eps','epsc');

%Par(alpha): X = U^{- 1/alpha}
X2 = ys.^(- 1/3);
fig = figure;
hist(X2);
legend('Par(2)');
saveas(fig,'A4b.eps','epsc');
