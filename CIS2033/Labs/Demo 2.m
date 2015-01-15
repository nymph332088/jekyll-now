%% EG1: PDF and CDF of an  from matlab functions.
y = binopdf(0:n, n, p); stem(0:n, y);  % Calculate the PMF for X = 0, 1, 2..., n of a binomial distribution parameterized by (n, p) and plot it.
y = binocdf(0:n, n, p); stairs(0:n, y); % Calculate the CDF for X = 0, 1, 2,..., n of a binomial distribution  parameterized by (n, p) and plot it.
y = binornd(n, p); % Get one random number generated from binomial distribution parameterized by (n, p).
y = binornd(n, p, [1, k]); % Get an 1*k vector contains numbers generated from binomial distribution parameterized by (n, p);


%% EG2: Toss a coin one time
n = 1
x = rand(1,1);

%% EG3: Toss a coin 10 times. 

n = 10
x = rand(1, n) < .5

%% EG4: Toss a coin 10 times; x = the number of heads. 
% 10 tosses of a fair coin. 1 - Heads, 0 - Tails
% this is equal to binornd(10, 0.5)
n = 10
t = rand(1, n) < .5
X = sum(t)


%% EG 5: Toss a coin 10 times, X = the number of heads. Repete this experiment for 100 times. Keep the record of 100 X.
% generate() is the same as y = binornd(10, 0.5, [1,100])
function [] = generate()
	trials = 100;
	xs = zeros(1,trials);
	p = 0.7;
        n = 10; 
	for i = 1:trials
    		t = rand(1,n) < p;
    		X = sum(t);    
   		xs(i) = X;
	end
	hist(xs, 0:n);
	set(gca,'XTick',0:max(x));
end

%% EG6: Mimic bernulli distribution and plot an empirical cdf
n = 10
x = sum(ceil(6*rand(2,n)))                    % Roll a pair of dice and look at the sum of each roll
stairs( [min(x) sort(x)], [0:1/length(x):1] ) % Plot the c.d.f of x






