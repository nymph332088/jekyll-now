distnames = {'Uniform', 'GeneralizedPareto'};
%X ~ U(0, 1);
alpha1 = 0;
beta1 = 1;
% Compute TRUE values;
uds = makedist(distnames{1},'lower',alpha1,'upper',beta1);
mean1 = uds.mean;
variance1 = uds.var;
% Compute empirical values;
rep = 100; % Repeat 100 times;
sizes = [5,10,50,100,500,1000,5000]; % For different sampling sizes;
nS = length(sizes);
mean2 = zeros(nS,1);
variance2 = zeros(nS,1);
for sizeIndex = 1:nS
    aSize = sizes(sizeIndex);
    aMean = 0;
    aVariance = 0;
    for aRep = 1:rep
        ys = random(uds,[aSize,1]);
        aMean = aMean + mean(ys);
        aVariance = aVariance + var(ys);
    end
    aMean = aMean/rep;         
    aVariance = aVariance/rep;
    mean2(sizeIndex) = aMean;
    variance2(sizeIndex) = aVariance;
end
fig1a = figure;
xlim([min(sizes) max(sizes)]);
plot(sizes,mean2, '-r');
hold on;
plot(sizes,repmat(mean1,1,nS),'-b');
legend('EMPIRICAL','TRUE');
title('Mean');
saveas(fig1a,'U1.eps','epsc');

fig1b = figure;
xlim([min(sizes) max(sizes)]);
plot(sizes,variance2,'-r');
hold on;
plot(sizes,repmat(variance1,1,nS),'-b');
legend('EMPIRICAL','TRUE');
title('Variance');
saveas(fig1b,'U2.eps','epsc');


%X ~ Par(3);
alpha1 = 3;
k1 = 1/alpha1;
sigma1 = 1/alpha1;    
theta1 = 1;
% Compute TRUE values;
uds = makedist(distnames{2},'k',k1, 'sigma',sigma1,'theta',theta1);
mean1 = uds.mean;
variance1 = uds.var;
% Compute empirical values;
rep = 100;
sizes = [5,10,50,100,500,1000,5000];
nS = length(sizes);
mean2 = zeros(nS,1);
variance2 = zeros(nS,1);
for sizeIndex = 1:nS
    aSize = sizes(sizeIndex);
    aMean = 0;
    aVariance = 0;
    for aRep = 1:rep
        ys = random(uds,[aSize,1]);
        aMean = aMean + mean(ys);
        aVariance = aVariance + var(ys);
    end
    aMean = aMean/rep;         
    aVariance = aVariance/rep;
    mean2(sizeIndex) = aMean;
    variance2(sizeIndex) = aVariance;
end
fig1a = figure;
xlim([min(sizes) max(sizes)]);
plot(sizes,mean2, '-r');
hold on;
plot(sizes,repmat(mean1,1,nS),'-b');
legend('EMPIRICAL','TRUE');
title('Mean');
saveas(fig1a,'P1.eps','epsc');

fig1b = figure;
xlim([min(sizes) max(sizes)]);
plot(sizes,variance2,'-r');
hold on;
plot(sizes,repmat(variance1,1,nS),'-b');
legend('EMPIRICAL','TRUE');
title('Variance');
saveas(fig1b,'P2.eps','epsc');

