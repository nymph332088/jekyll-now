function [ choice ] = nchoosek_byTA( n,k )
%NCHOOSEK Summary of this function goes here
%   Detailed explanation goes here
choice = factorial(n)/ (factorial(k) * factorial(n-k));
end

