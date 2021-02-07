clear;
close all;
clc;

%% Plot expected moves as a function of N
N = 1:10;
expMoves = NaN(size(N));
for k = N
    expMoves(k) = getExpectedNumMoves(k);
end

plot(N, expMoves);