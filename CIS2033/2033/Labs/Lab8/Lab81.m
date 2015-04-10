%% Lab 7, Unbiased Estimator(Due Apr. 11, 11:59 PM, 2015)
% _Shanshan Zhang, tuf14438@temple.edu_
% Illustration of unbiased estimator.

%% Normal Distribution Example
% Normal Distribution has two parameters $\mu$ and $\sigma^2$. We
% illustrate two estimator for $\sigma$
%%
% $S_1 = \sqrt{\frac{1}{n-1}\sum(X_i - \bar X)^2}$

%%
% $S_2 = \sqrt{\frac{1}{n}\sum(X_i - \bar X)^2}$


%%
% First we generate 1000 samples with sample size 10000 each from $N(2, 4)$

%%
% Then for each sample, we calculate the values for both $S_1$ and $S_2$
% estimators.
L = 10000;
n = 100000;
for i = 1:L
    Xi = normrnd(2, 2, [1,n]);
    Xbar = mean(Xi);
    n = length(Xi);
    S1(i) = sqrt(1/(n-1) * sum((Xi - Xbar).^2));
    S2(i) = sqrt(1/n * sum((Xi - Xbar).^2));
end

mean(S1)
mean(S2)