% % Ex 1: load poiss.mat. 
% Let the discrete random variable $X$ be the number of customers visiting
% ABC Bank in a hour. We know that $X ~ Poiss(lambda). 
% The poiss.mat stores such information: 1000 records. 
% 1.1) Estimate lambda;
% 1.2) Based on the computed lambda, randomly generate 500 data samples from
% Poiss(lambda)
% 1.3) Save the data into a mat file. 
load('poiss.mat');
lambda1 = mean(X);
data1 = poissrnd(lambda1,500,1);
save('ex1.mat','data1');

% Ex 2: load norm.mat. 
% Let the continuous random variable $X$ be the price changes of the product XYZ. 
% Positve values mean its price is increased and negative values means its
% price is decreased. 
% We know that X ~ N(mu, sigma^2). 
% The norm.mat stores 1000 records of such information. 
% Please load the data and 
% 2.1) Estimate mu and sigma;
% 2.2) Based on the computed mu and sigma, randomly generate 500 data
% samples from N(mu, sigma^2)
load('norm.mat');
mu1 = mean(X);
std1 = std(X);
data2 = normrnd(mu1,std1,[500,1]);
save('ex2.mat','data2');

% Ex 3: 
% The unif.mat contains 1000 samples. 
% Suppose those samples are follow a Uniform distribution U(a, b); 
% Use the maximum likelihood to estimate a and b
load('unif.mat');
uDist = mle(X,'distribution','uniform');
a = uDist(1);
b = uDist(2);

% Ex 4:
% The norm.mat contains 1000 samples. 
% Suppose those samples follow a N(mu, sigma^2) distribution. 
% Use the maximum likelihood to estimate mu and sigma.
load('norm.mat');
nDist = mle(X, 'distribution', 'norm');
mu1 = nDist(1);
sigma1 = nDist(2);


