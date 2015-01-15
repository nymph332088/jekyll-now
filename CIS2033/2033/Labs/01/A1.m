%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1
% Experiment with the following matrices. What does C1, C2, C3, C4, Cp1, Cp2, D, E, F do?      
C = [1 2 3 4; 5 6 7 8; 9 10 11 12];
C1 = C(1,:); % Get the first row of matrix C;
C2 = C(:,2); % Get the second column of matrix C;		 
C3 = C([1 2],:); % Get the first two rows of matrix C;	 
C4 = C(1:3,[1,3]); % Get the first three entries of column 1 and column 3 of matrix C;
Cp1 = C'; % Do the transpose;
Cp2 = transpose(C); % Do the transpose;
D = Cp1 + Cp2; % Matrix Addition
E = C * Cp1; % Matrix Multiply 
F = Cp1 .* Cp2; % Matrix Element-wise multiply


% Exercise 2
% 1st, create a matrix A with 5 rows and 3 columns, filled with random
% variables between 0 and 10;
% 2nd, create an identity matrix B with the size of 3 times 3;
% 3rd, get the submatrix C of A by extracting the elements of the last
% three rows;
% 4th, perform element-wise multiplication between matrix B and matrix
% C.  The result is denoted as the matrix D;
% Finally, concatenate A and D to form matrix E, whose first 5 rows are
% from A and the last 3 rows are from D. 
clear A B C D E;
A = rand(5,3)*10;
B = eye(3);
C = A(3:5,:);
D = B.*C;
E = [A;D];

% Exercise 3
% 1st, find the MATLAB function to compute the union of two sets and review
% its documentation file. 
% 2nd, find the MATLAB function to compute the intersection of two sets and
% review its documentation file. 
% 3rd, create a row array A with 20 elements, filled with random
% integers from the closed set [1,100] and create a row array B with 15 elements, filled with random
% integers from the closed set [1,100]. 
% Finally, use the previous two functions to compute the union and
% intersection of A and B. 
clear A B C D;
A = randi(100,20,1);
B = randi(100,15,1);
C = union(A,B);
D = intersect(A,B);

% Exercise 4
% We know that n factorial is defined as n! = n*(n-1)*(n-2)...*3*2*1;
% First, find the Factorial function provided by MATLAB and review its
% documentation file. 
% Then compute the values for n! (n=0,1,2,3, ..., 10). 
% Finally, plot a 2-dimensional figure where the x-axis denotes the values
% of n (n=0, 1, 2, ..., 10) and the y-axis denotes the values of n!. Please
% label the axes and add a title. You should also
% specify other properties such as the line width, the font size and the
% color. Please save the figure with two copies, one is with .eps extension
% and one is with .fig extension. 
styles={'.r'};
xs = 0:1:10;
ys = factorial(xs);
fig1 = figure;
ah = axes('Fontsize', 20);
set(fig1, 'CurrentAxes', ah);
scatter(xs,ys,styles{1}, 'Linewidth',10);
ylim([min(ys)-0.5 max(ys)+0.5]); 
xlim([min(xs), max(xs)]);
title('N Factorial', 'fontsize',26);
xlabel('n','fontsize',23);
ylabel('n!','fontsize',23);
hold off
saveas(fig1, ['n!', '.eps'], 'epsc');
saveas(fig1, ['n!', '.fig'], 'fig');
clear fig1;


