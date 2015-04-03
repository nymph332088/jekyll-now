%% Graphical and Numerical Summaries of a dataset
% EG 1: Draw histograms for a sample with numbers: [12, 15, 34, 24, 35, 67,
% 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74]
% Question 1.1) Let the bin width be 10, the first bin starts at 10;
X = [12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74];
N = length(X);
%[..., a(i), a(i+1), ...] a(i)<=Bi<a(i+1);
%[10,20),[20,30),...,[90,100];
fig1 = figure;
bin1 = [10,20,30,40,50,60,70,80,90,100];

%%
%% Alternatively, you can use
bin1 = 10:10:100
width1 = ones(1,10)*10;
bincount1 = histc(X,bin1);
height1 = bincount1./(N*width1);
bar(bin1,height1,'histc');
xlim([10,100]);
saveas(fig1, 'h1.eps', 'epsc');

% Question 1.2)  Let the bin width be 30, the first bin starts at 10;
X = [12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74];
N = length(X);
%[..., a(i), a(i+1), ...] a(i)<=Bi<a(i+1);
%[10,40),[40,70),[70,100];
fig2 = figure;
bin2 = [10,40,70,100];
width2 = ones(1,4)*30;
bincount2 = histc(X,bin2);
height2 = bincount2./(N*width2);
bar(bin2,height2,'histc');
xlim([10,100]);
saveas(fig2, 'h2.eps', 'epsc');

% Question 1.3) Let the bin width be 50, the first bin starts at 10;
X = [12, 15, 34, 24, 35, 67, 89, 13, 45, 36, 89, 46, 97, 34, 56, 78, 65, 83, 59, 74];
N = length(X);
%[..., a(i), a(i+1), ...] a(i)<=Bi<a(i+1);
%[10,60),[60,110];
fig3 = figure;
bin3 = [10,60,110];
width3 = ones(1,3)*50;
bincount3 = histc(X,bin3);
height3 = bincount3./(N*width3);
bar(bin3,height3,'histc');
xlim([10,110]);
saveas(fig3, 'h3.eps', 'epsc');


% EG 2: Draw histogram for a sample with continuous numbers, load cities
% 2.1) draw histogram for climate with 10 bins, 20 bins, 50 bins, 100 bins
clear all;
load cities
X = ratings(:,1); % get the sample ratings for climate.
N = length(X);
fig4 = figure;
nbins = [10,20,50,100]
for i = 1:4
    subplot(2,2,i);
    nbin = nbins(i);
    width = (max(X) - min(X))./nbin;
    bin = [min(X):width:max(X), max(X)];
    bincount = histc(X,bin);
    height = bincount./(N*width);
    bar(bin,height,'histc');
    xlim([min(X), max(X)]);
    xlabel(['Number of Bins = ', num2str(nbin)]);

end

% EG 3: Calculate the following numeric summaries for climate ratings in city data.
% 3.1) Compute the sample median, sample mean, sample standard deviation, sample MAD.
clear all;
load cities
X = ratings(:,1);
[N,~] = size(X);
sMe = median(X); % Sample median
sMea = sum(X)/N; % Sample mean
sVar1 = 1/N * sum((X - sMea).^2);
sSTD = sqrt(sVar1);
sMad = median(abs(X - median(X)) );

% 3.2) Compute the lower quantile, upper quantile and the IQR.
% lower quantile: quantile(X, 0.25)
X = sort(X);
N = length(X);
p =0.25;
k = floor(p*(N+1));
alpha = p*(N+1)-k;
lowQ = X(k) + alpha*(X(k+1) - X(k));
% upper quantile: quantile(X, 0.75)
p = 0.75;
k = floor(p*(N+1));
alpha = p*(N+1)-k;
upperQ = X(k) + alpha*(X(k+1) - X(k));
% IOR
IOR = upperQ - lowQ

% EG 4: For cities data
% 4.1) draw the scatter plot between ratings for crime and ratings for
% education.
clear all;
load cities
X = ratings(:,4); % Ratings for crimes
Y = ratings(:,6); % Ratings for education
plot(X,Y,'r*');
xlabel('Crimes');
ylabel('Education');
title('Scatter between crimes and education');

% 4.2) compute the covariance between crime and education;
sCov = cov(X,Y);
% 4.3) compute the correlation coefficient between crime and education;
sCor = corr(X,Y);


