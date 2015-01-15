% Be familar with load 
doc load;
% Now load the data;
load('demo5.mat');

% Now check what variables you have in the workspace
% A matrix X and a vector Y;
[n1, p] = size(X);
n2 = length(Y);

% Compute the covariance and correlation coefficient using those data
% You may check descriptive-statistics here:
% http://www.mathworks.com/help/matlab/descriptive-statistics.html
% You may practice with cov 
doc cov;
% Please read the documentation file carefully 
R1 = cov(X);
% What does R1 contain ? 

% You may practise with corrcoef;
doc corrcoef;
R2 = corrcoef(X);
% What does R2 contain ?

% Be familiar with Poisson Distribution;
% First please check the documentation file here:
% http://www.mathworks.com/help/stats/poisson-distribution-1.html
% You may find some other functions related to Poisson Distribution
% You may practise with poisscdf;
doc poisscdf;
% You may practise with poisspdf;
doc poisspdf;
% You may practice with poissinv;
doc poissinv;
% You may practice with poisstat;
doc poisstat;
% You may practice with poissfit;
doc poissfit;
% You may practice with poissrnd;
doc poissrnd;

% Practice with histograms;
doc hist;
% Please read the documentation file carefully
% What's the difference between the histogram generated via hist and the
% histogram from the textbook. 

% You may also practice with histc
doc histc;

% You may also practice with bar;
doc bar;

