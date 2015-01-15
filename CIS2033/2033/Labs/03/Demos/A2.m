distnames = {'Uniform', 'GeneralizedPareto'};
colors = {'b','c','k','m','r'};
%X ~ U(0, beta);
betas=[2];
xs = -1:0.01:3;
fig = figure;
for i=1:length(betas)
    uds = makedist(distnames{1},'lower',0,'upper',betas(i));
    ys = cdf(uds,xs);
    stairs(xs,ys,colors{i});
    hold on;
end
median1 = uds.median;
plot(median1,0.5,'r*');
axis([-1 3 -0.2 1.2]);
legend('U(0, 2)','(q_{.5}, .5)');
saveas(fig,'A2a.eps','epsc');

%X ~ Par(alpha);
alphas = [2];
xs = 0:0.01:5;
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    uds = makedist(distnames{2},'k',k1, 'sigma',sigma1,'theta',theta1);
    ys = cdf(uds,xs);
    plot(xs,ys,colors{i});
    hold on;
end
axis([0 5 -0.2 1.2]);
median1 = uds.median;
plot(median1,0.5,'r*');
legend('Par(2)','(q_{.5},.5)');
saveas(fig,'A2c.eps','epsc');
