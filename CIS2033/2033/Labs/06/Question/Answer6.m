%A1
load('poiss2.mat');
lambda1=mean(X);
lambda2 = 7*lambda1;
X2 = poissrnd(lambda2,[100,1]);
save('poiss100.mat','X2');

%A2
load('exp.mat');
mu1=mean(X);
mu2 = 2*mu1;
X2 = exprnd(mu2,[100,1]);
save('exp100.mat','X2');

%A3
load('poiss3.mat');
p = size(X,2);
lambdas = zeros(1,p);
lls = zeros(1,p);
for i=1:p
    lambdas(i) = mle(X(:,i),'distribution','poisson');
    lls(i) = sum(log(poisspdf(X(:,i),lambdas(i))));
end

%A4
load('exp2.mat');
p = size(X,2);
mus = zeros(1,p);
lls = zeros(1,p);
for i=1:p
    mus(i) = mle(X(:,i),'distribution','exponential');
    lls(i) = sum(log(exppdf(X(:,i),mus(i))));    
end


