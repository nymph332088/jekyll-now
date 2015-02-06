distnames = {'Uniform',  'GeneralizedPareto'};
colors = {'b','c','k','m','r'};
%X ~ U(0, beta);
betas=[2];
fig = figure;
numOfPoints = 10^5;
for i=1:length(betas)
    uds = makedist(distnames{1},'lower',0,'upper',betas(i));
    ys = random(uds,numOfPoints,1);
    hist(ys);
    hold on;
end
legend('U(0, 2)');
saveas(fig,'A3a.eps','epsc');


%X ~ Par(alpha);
alphas = [2];
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    uds = makedist(distnames{2},'k',k1, 'sigma',sigma1,'theta',theta1);
    ys = random(uds,numOfPoints,1);
    hist(ys);
    hold on;
end
legend('Par(2)');
saveas(fig,'A3c.eps','epsc');
