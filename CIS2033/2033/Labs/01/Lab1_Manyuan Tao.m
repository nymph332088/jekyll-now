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
% C1: get the first row of matrix C
% C2: get the second column of matrix C
% C3: get the submatrix of C by extracting the elements of the first two rows;
% C4: get the submatrix of C by extracting the elements of the first and third rows
% Cp1:get the conjugate transposition of matrix C
% Cp2:get the transposition of matrix C;
% D: perform matrix addition between matrix Cp1 and matrix Cp2
% E: perform matrix multiplication between matrix C and matrix Cp1
% F: perform element-wise multiplication between matrix Cp1 and matrix Cp2
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
A=10*rand(5,3)
B=eye(3)
C=A(3:5,:)
D=B.*C
E=[A;D]
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
help union
help intersect
A=fix(rand(1,20)*100)
B=fix(rand(1,15)*100)
union(A,B)
intersect(A,B)
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
help factorial
for n=0:10
    factorial(n)
end
x=0:10;y=factorial(x);
fig1=figure;
plot(x,y,'b','linewidth',2)
title('n factorial', 'fontsize',26);
xlabel('x','fontsize',23);
ylabel('y','fontsize',23);
saveas(fig1,['factorial','.eps'],'epsc');
saveas(fig1,['factorial','.jpg'],'epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
