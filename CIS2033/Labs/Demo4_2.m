%X ~ Geo(5);
p = 0.3;
% Compute TRUE values;
[mean1, variance1] =geostat(p);
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
        ys = geornd(p,[aSize,1]);
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