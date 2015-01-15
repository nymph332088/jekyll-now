%
% Introduction to Matlab
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrix and Array Creation
A = [1, 2, 3];
B = [1 2 3];

C = [1; 2; 3];

D = zeros(5, 10);
E = ones(10,3);
F = rand(3,4);

% Matrix and Array Operation
ApB = A + B;
Cp = C';
DtE = D*E;
FtF = F.*F;

% Matrix and Array Concatenation
AB1 = [A, B];
AB2 = [A; B];

% Array Indexing
aNum = F(5);
F1 = F(1:2,:);
F2 = F(3,[1,3]);

% Character Strings
S1 = 'CIS 2033: Computational Probability and Statistics, Section 002';
S2 = 'It''s Good';
S3 = ['The lab starts at ', num2str(9), ' AM.'];

% Function
V1 = rand(5,1);
V2 = rand(5,1);
max1 = max(V1);
min1 = min(V1);
max2 = max(V1, V2);
min2 = min(V1, V2);
[maxV, maxIndex] = max(V1);
[minV, minIndex] = min(V1);
clc % clears the command line;

% Plot
styles={'-.*k','-.ob','-sr'};
xs = 0:pi/100:2*pi;
ys = [sin(xs);cos(xs);tanh(xs)];
fig1 = figure;
ah = axes('Fontsize', 20);
set(fig1, 'CurrentAxes', ah);
for i=1:3
    plot(xs,ys(i,:),styles{1,i}, 'linewidth', 3, 'MarkerSize', 18);
    hold on;
end
ylim([min(min(ys))-0.5 max(max(ys))+0.5]); 
xlim([min(xs), max(xs)]);
title('2D Plot', 'fontsize',26);
xlabel('x','fontsize',23);
ylabel('y','fontsize',23);
lgd = legend('sine','cosine','hyperbolic tangent','Location', 'SouthEast');
set(lgd,'FontSize',20,'Box','off');
hold off
saveas(fig1, ['2d', '.eps'], 'epsc');
clear fig1;

subplot(1,3,1);
plot(xs, ys(1,:));
title('sin(x)');
subplot(1,3,2);
plot(xs,ys(2,:));
title('cos(x)');
subplot(1,3,3);
plot(xs,ys(3,:));
title('tan(x)');

% Control Flow;
% Conditional Statement;
a = 4;
if (a > 4)
   b=a^2;
elseif (a < 4)
   b=a;
else
   b=-a;
end

% For loop
for i=1:3:9
	disp(i); 
end

% While loop
j=10;
while j > 0
   j=j-2;
end

% Help and Documentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
help plot
doc plot
%plot(

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%