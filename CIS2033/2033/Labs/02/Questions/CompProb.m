function [ P_Bn ] = CompProb( n)
%COMPPROB Summary of this function goes here
%   n people without coincident birthdays.
P_Bn = 1;
for i = 1:n-1
    P_Bn = P_Bn *(1- (n-1)/365);
end

end

