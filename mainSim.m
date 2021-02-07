% Simulate random Hanoi Tower solve moves
clear;
clc;
close all;

%% main script
simCount = 1e5;
N = 4;
moveSum = 0;
for k = 1:simCount
     moveSum = moveSum + getNumMoves(N);
     fprintf('Done trial %d\n', k);
end

expectedMoves = moveSum / simCount;