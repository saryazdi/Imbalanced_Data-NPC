clear all
close all
clc
% ~~~~~~ CODE STARTS HERE ~~~~~~~~
Sample = importdata('Example_Imbalanced_Dataset_Train.mat');
Test= importdata('Example_Imbalanced_Dataset_Test.mat');
[size1 size2] = size(Sample);
n_all=size1;
% DATA ANALYSIS
IR=sum(Sample(:,size2)==0)/sum(Sample(:,size2)==1);
% WEIGHTS
Weights = zeros(n_all,2);
Ranks = 1:n_all;
PosSc = IR*(n_all-Ranks)/(n_all-1-sqrt(IR));
NegSc = (IR.^(Ranks/n_all)); % The negative was accounted for in the CompN function in second loop
Weights = [[PosSc]',NegSc'];
% CLASSIFICATION
Result = CompN(Sample,Test,Weights,round(0.7*IR));
% GEOMETRIC MEAN
GM = GMCalc(Test,Result);
fprintf('GM = %2.2f%%\n',GM*100)