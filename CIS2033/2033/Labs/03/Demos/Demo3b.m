% Ex 1: Plot probability density function 
% for continuous random variables
% 1 (a): X ~ U(0, beta), beta = 0.5, 1, 2 
colors = {'r','b','k','m','c'};
betas=[0.5, 1, 2];
xs = -1:0.01:3;
fig = figure;
for i=1:length(betas)
    ys = unifpdf(xs,0,betas(i));
    stairs(xs,ys,colors{i});
    hold on;
end
axis([-1 3 -0.1 3]);
legend('U(0, 0.5)','U(0, 1)', 'U(0, 2)');
saveas(fig,'D1a.eps','epsc');

% 1 (b): X ~ Par(alpha), alpha = 0.5, 1, 2
alphas = [0.5, 1, 2];
xs = 0:0.01:5;
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    ys = gppdf(xs,k1,sigma1,theta1);
    plot(xs,ys,colors{i});
    hold on;
end
axis([0 5 -0.2 2.5]);
legend('Par(0.5)','Par(1)', 'Par(2)');
saveas(fig,'D1b.eps','epsc');
% 
% Ex 2: Plot distribution functions for 
% continuous random variables. 
% 2 (a): X ~ U(0, 2)
colors = {'b','c','k','m','r'};
betas=[2];
xs = -1:0.01:3;
fig = figure;
for i=1:length(betas)
    ys = unifcdf(xs,0,betas(i));
    stairs(xs,ys,colors{i});
    hold on;
end
median1 = 1; %You have to compute the median by yourself;
plot(median1,0.5,'r*');
axis([-1 3 -0.2 1.2]);
legend('U(0, 2)','(q_{.5}, .5)');
saveas(fig,'D2a.eps','epsc');

% 2(b): X ~ Par(2);
alphas = [2];
xs = 0:0.01:5;
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    ys = gpcdf(xs,k1,sigma1,theta1);
    plot(xs,ys,colors{i});
    hold on;
end
axis([0 5 -0.2 1.2]);
median1 = sqrt(2);%You have to compute the median by yourself;
plot(median1,0.5,'r*');
legend('Par(2)','(q_{.5},.5)');
saveas(fig,'D2b.eps','epsc');

% Ex 3: Generate samples from a specific distribution
% 3 (a): Generate 100000 samples from U(0, 2)
colors = {'b','c','k','m','r'};
betas=[2];
fig = figure;
numOfPoints = 10^5;
for i=1:length(betas)
    ys = random('Uniform',0,betas(i),[numOfPoints,1]);
    hist(ys);
    hold on;
end
legend('U(0, 2)');
saveas(fig,'D3a.eps','epsc');

% 3 (b): Generate 100000 samples from Par(2)
alphas = [2];
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    ys = random('Generalized Pareto',k1,sigma1,theta1,[numOfPoints,1]);
    hist(ys);
    hold on;
end
legend('Par(2)');
saveas(fig,'D3b.eps','epsc');

% Ex 4: Generate samples with X distribution from a Y distribution
% 4 (a): Generate datapoints with U(0, 1) from a Par(2) 
alphas = [2];
fig = figure;
for i=1:length(alphas)
    k1 = 1/alphas(i);
    sigma1 = 1/alphas(i);    
    theta1 = 1;
    uds = random('Generalized Pareto',k1,sigma1,theta1,[numOfPoints,1]);
    zs = 1-1./(ys.^2);
    %zs = 1./(ys.^2);
    hist(zs);
    hold on;    
end
legend('U(0, 1)');
saveas(fig,'D4a.eps','epsc');