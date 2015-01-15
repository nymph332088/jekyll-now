%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1
% Experiment with the following matrices. What does C1, C2, C3, C4, Cp1, Cp2, D, E, F do?      
C = [1 2 3 4; 5 6 7 8; 9 10 11 12];
C1 = C(1,:);	 
C2 = C(:,2);		 
C3 = C([1 2],:);	 
C4 = C(1:3,[1,3]);
Cp1 = C';
Cp2 = transpose(C);
D = Cp1 + Cp2;
E = C * Cp1;
F = Cp1 .* Cp2;
% Please add your answers in the following comments. 
% C1: 
% C2: 
% C3: 
% C4: 
% Cp1: 
% Cp2: 
% D:
% E: 
% F: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
% Please write your codes here. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 3
% 1st, find the MATLAB function to compute the union of two sets and review
% its documentation file. 
% 2nd, find the MATLAB function to compute the intersection of two sets and
% review its documentation file. 
% 3rd, create a row array A with 20 elements, filled with random
% integers from the closed set [1, 100] and create a row array B with 15 elements, filled with random
% integers from the closed set [1, 100]
% Finally, use the previous two functions to compute the union and
% intersection of A and B. 
% Please write your codes here. 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
% and one is with .jpg extension. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
