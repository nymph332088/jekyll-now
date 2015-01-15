distnames = {'Uniform', 'GeneralizedPareto'};
colors = {'r','b','k','m','c'};
%X ~ U(0, beta);
betas=[0.5, 1, 2];
xs = -1:0.01:3;
fig = figure;
for i=1:length(betas)
    uds = makedist(distnames{1},'lower',0,'upper',betas(i));
    ys = pdf(uds,xs);
    stairs(xs,ys,colors{i});
    hold on;
end
axis([-1 3 -0.1 3]);
legend('U(0, 0.5)','U(0, 1)', 'U(0, 2)');
saveas(fig,'A1a.eps','epsc');

%X ~ Par(alpha);
alphas = [0.5, 1, 2];
xs = 0:0.01:5;
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    uds = makedist(distnames{2},'k',k1, 'sigma',sigma1,'theta',theta1);
    ys = pdf(uds,xs);
    plot(xs,ys,colors{i});
    hold on;
end
axis([0 5 -0.2 2.5]);
legend('Par(0.5)','Par(1)', 'Par(2)');
saveas(fig,'A1c.eps','epsc');