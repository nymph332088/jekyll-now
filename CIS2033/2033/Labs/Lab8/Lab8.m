%% Lab 8, Unbiased Estimator(Due Apr. 17, 11:59 PM, 2015)
% _Shanshan Zhang, tuf14438@temple.edu_
% Illustration of unbiased estimator.

%% Question 1: load poiss.mat, download link 
% <http://nymph332088.github.io/CIS2033/2033/Labs/Lab8/poiss.mat> .
% Let the discrete random variable $X$ be the number of customers visiting
% ABC Bank in a hour. We know that $X ~ Poiss(lambda). 
% The poiss.mat stores such information: 1000 records. 
% 1.1) Draw the histogram of the 500 data samples.
% 1.2) Estimate lambda;
% 1.3) Based on the computed lambda, randomly generate 500 data samples from
% Poiss(lambda)

%% Question 2: load norm.mat.
% <http://nymph332088.github.io/CIS2033/2033/Labs/Lab8/norm.mat>
% Let the continuous random variable $X$ be the price changes of the product XYZ. 
% Positve values mean its price is increased and negative values means its
% price is decreased. 
% We know that X ~ N(mu, sigma^2). 
% The norm.mat stores 1000 records of such information. 
% Please load the data and 
% 2.1) Draw the histogram of the 1000 data samples.
% 2.2) Estimate mu and sigma;
% 2.3) Based on the computed mu and sigma, randomly generate 500 data
% samples from N(mu, sigma^2) 

%%
% Hint code for question 1: 

% Download the data from the website, then load('poiss.mat');
% Esitimation: lambda1 = mean(X);
% Random generation: data1 = poissrnd(lambda1,500,1);