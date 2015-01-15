% Ex 1: load poiss.mat. 
% Let the discrete random variable $X$ be the number of customers visiting
% ABC Bank in a hour. We know that $X ~ Poiss(lambda). 
% The poiss.mat stores such information: 1000 records. 
% 1.1 Estimate lambda;
% 1.2 Compute P(X=k), k = minK, minK+1, minK+2, maxK, where minK and maxK
% are the minimum and maximum of X, respectively;
% 1.3 Estimate P(X=k) by using the frequencies. 
% 1.4 Plot 2D figure with both results from 1.2 and 1.3: two curves;

load('poiss.mat');
lambda1 = mean(X);
minK = min(X);
maxK = max(X);
k = minK:1:maxK;
prob1 = poisspdf(k,lambda1);
N = 1000;
prob2 = zeros(maxK+1-minK,1);
for i=1:length(k)
    prob2(i) = (sum(X==k(i))/N);
end
plot(k,prob1,'-*r');
hold on;
plot(k,prob2,'--b');
legend('Poiss(\lambda)','Frequency');
title('Poiss Distribution');
hold off;

% Ex 2: load norm.mat. 
% Let the continuous random variable $X$ be the price changes of the product XYZ. 
% Positve values mean its price is increased and negative values means its
% price is decreased. 
% We know that X ~ N(mu, sigma^2). 
% The norm.mat stores 1000 records of such information. 
% Please load the data and 
% 2.1) Estimate mu and sigma;
% 2.2) Compute P(X=a), a belongs to [minX, maxX] where minX and maxX are
% the minimum and maximum of X, respectively. 
% 2.3) Plot a 2D figure.

load('norm.mat');
mu1 = mean(X);
std1 = std(X);
minX = min(X);
maxX = max(X);
As = minX:0.01:maxX;
prob = normpdf(As,mu1,std1);
plot(As,prob);