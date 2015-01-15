% Ex 1: load the demo5.mat and compute the covariance between each column of
% X and Y;
% 1.1) 
load('demo5.mat');
[~, p] = size(X);
R = zeros(p,1);
for i = 1:p
    r = cov(X(:,i),Y);
    R(i,1) = r(1,2);
end

% 1.2) : load the demo5.mat and compute the correlation coefficient between
% each column of X and Y;
load('demo5.mat');
[~, p] = size(X);
R = zeros(p,1);
for i = 1:p
    r = corrcoef(X(:,i),Y);
    R(i,1) = r(1,2);
end

% Ex 2: 
% 2.1) Let X ~ Pios(2), compute p(k), k = 0, 1, 2, 50;
k = 0:1:50;
prob = poisspdf(k, 2);

% 2.2)  Let Y ~ Pois(1), compute F(k), k = 0, 1, 2, 50;
k = 0:1:50;
f = poisscdf(k,1);

% Ex 3: Draw histograms for the following dataset:
% 12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74
% 3.1) Let the bin width be 10, the first bin starts at 10;
X = [12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74];
N = length(X);
%[..., a(i), a(i+1), ...] a(i)<=Bi<a(i+1);
%[10,20),[20,30),...,[90,100];
fig1 = figure;
bin1 = [10,20,30,40,50,60,70,80,90,100.1];
width1 = ones(1,10)*10;
bincount1 = histc(X,bin1);
height1 = bincount1./(N*width1);
bar(bin1,height1,'histc');
xlim([10,100]);
saveas(fig1, 'h1.eps', 'epsc');

% 3.2)  Let the bin width be 30, the first bin starts at 10;
X = [12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74];
N = length(X);
%[..., a(i), a(i+1), ...] a(i)<=Bi<a(i+1);
%[10,40),[40,70),[70,100];
fig2 = figure;
bin2 = [10,40,70,100.1];
width2 = ones(1,4)*30;
bincount2 = histc(X,bin2);
height2 = bincount2./(N*width2);
bar(bin2,height2,'histc');
xlim([10,100]);
saveas(fig2, 'h2.eps', 'epsc');

% 3.3) Let the bin width be 50, the first bin starts at 10;
X = [12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74];
N = length(X);
%[..., a(i), a(i+1), ...] a(i)<=Bi<a(i+1);
%[10,60),[60,110];
fig3 = figure;
bin3 = [10,60,110.1];
width3 = ones(1,3)*50;
bincount3 = histc(X,bin3);
height3 = bincount3./(N*width3);
bar(bin3,height3,'histc');
xlim([10,110]);
saveas(fig3, 'h3.eps', 'epsc');

% Ex 4: 
% Given the following dataset, which contains the prime numbers less than 100. 
% 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97
% a. Compute the sample median.
% b. Compute the lower and upper quartiles.
S = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97];
% 4.1) Sample Median;
sMe = median(S);
n = length(S);

% 4.2) Lower Quantile;
p =0.25;
k = floor(p*(n+1));
alpha = p*(n+1)-k;
lowQ = S(k) + alpha*(S(k+1) - S(k));

% 4.3) Upper Quantile;
p = 0.75;
k = floor(p*(n+1));
alpha = p*(n+1)-k;
upperQ = S(k) + alpha*(S(k+1) - S(k));

% Ex 5:
% Given the following dataset, which contains Fibonacci numbers less than 100. 
% 0,1,1,2,3,5,8,13,21,34,55,89
% Compute the standard deviation. 
% Compute the MAD.
S = [0,1,1,2,3,5,8,13,21,34,55,89];
% 5.1) Standard deviation;
std1 = std(S);

% 5.2) MAD;
MAD = median(abs(S-median(S)));


